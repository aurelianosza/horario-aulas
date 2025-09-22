import { MysqlConnection } from "../database/mysqlConnection";

export class GetFreeRoomsScheduleController {
   
    private mysqlConnection: MysqlConnection;

    private constructor()
    {
        this.mysqlConnection = MysqlConnection.getInstance();
    }

    static make(): GetFreeRoomsScheduleController
    {
        return new GetFreeRoomsScheduleController();
    }

    async execute(params: any): Promise<any>
    {
        const weekDay = params["week-day"] ?? null;
        const room = params["room"] ?? null;

        return new Promise((resolve, reject) => {

            this.mysqlConnection.getConnection()
                .query(`
                    WITH RECURSIVE days AS (
                        SELECT 0 AS day_of_week
                            UNION ALL
                        SELECT day_of_week + 1
                            FROM days
                        WHERE day_of_week < 5
                        ),
                        time_slots AS (
                            SELECT CAST('08:00:00' AS TIME) AS start_time,
                                    CAST('09:00:00' AS TIME) AS end_time
                            UNION ALL
                            SELECT
                                    end_time AS start_time,
                                    ADDTIME(end_time, '01:00:00') AS end_time
                            FROM time_slots
                            WHERE end_time < CAST('18:00:00' AS TIME)
                        )
                        SELECT 
                            CASE d.day_of_week
                                    WHEN 0 THEN 'Monday'
                                    WHEN 1 THEN 'Tuesday'
                                    WHEN 2 THEN 'Wednesday'
                                    WHEN 3 THEN 'Thursday'
                                    WHEN 4 THEN 'Friday'
                                    WHEN 5 THEN 'Saturday'
                                    WHEN 6 THEN 'Sunday'
                                    ELSE 'Invalid Day'
                                END AS week_day,
                            r.description AS room_id,
                            ts.start_time,
                            ts.end_time
                        FROM room r
                        CROSS JOIN days d
                        CROSS JOIN time_slots ts
                        LEFT JOIN class_schedule cs
                            ON cs.room_id = r.id
                            AND cs.day_of_week = 1  
                            AND ts.start_time < cs.end_time
                            AND ts.end_time   > cs.start_time
                        WHERE cs.id IS NULL
                            ${weekDay ? `AND d.day_of_week = ${weekDay - 2}` : ""}
                            ${room ? `AND r.description = "Sala ${room}"` : ""}
                        ORDER BY r.id, d.day_of_week, ts.start_time;
                `, (err, rows) => err ? reject(err) : resolve(rows));
        });

    }
}
