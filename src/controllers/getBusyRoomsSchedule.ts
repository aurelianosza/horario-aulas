import { MysqlConnection } from "../database/mysqlConnection";

export class GetBusyRoomsScheduleController {
   
    private mysqlConnection: MysqlConnection;

    private constructor()
    {
        this.mysqlConnection = MysqlConnection.getInstance();
    }

    static make(): GetBusyRoomsScheduleController
    {
        return new GetBusyRoomsScheduleController();
    }

    async execute(params: any): Promise<any>
    {
        const weekDay = params["week-day"] ?? null;
        const room = params["room"] ?? null;

        return new Promise((resolve, reject) => {

            this.mysqlConnection.getConnection()
                .query(`
                    SELECT 
                        CASE cs.day_of_week
                            WHEN 0 THEN 'Monday'
                            WHEN 1 THEN 'Tuesday'
                            WHEN 2 THEN 'Wednesday'
                            WHEN 3 THEN 'Thursday'
                            WHEN 4 THEN 'Friday'
                            WHEN 5 THEN 'Saturday'
                            WHEN 6 THEN 'Sunday'
                            ELSE 'Invalid Day'
                        END AS week_day,
                        r.description,
                        cs.start_time,
                        cs.end_time 
                        FROM room r
                        INNER JOIN class_schedule cs 
                            ON cs.room_id = r.id
                        JOIN class c
                            ON c.id = cs.class_id
                        WHERE 1=1
                        ${weekDay ? `AND cs.day_of_week = ${weekDay - 2}` : ""}
                        ${room ? `AND r.description = "Sala ${room}"` : ""}
                        ORDER BY r.id, cs.day_of_week;
                    `, (err, rows) => err ? reject(err) : resolve(rows));
        });

    }
}
