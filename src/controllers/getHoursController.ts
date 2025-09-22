import { MysqlConnection } from "../database/mysqlConnection";

export class GetHoursController {
   
    private mysqlConnection: MysqlConnection;

    private constructor()
    {
        this.mysqlConnection = MysqlConnection.getInstance();
    }

    static make(): GetHoursController
    {
        return new GetHoursController();
    }

    async execute(params: any): Promise<any>
    {
        const professorName = params["professor-name"] ?? null;
        const semester = params["semester"] ?? null;

        return new Promise((resolve, reject) => {

            this.mysqlConnection.getConnection()
                .query(`
                    SELECT
                        ps.name,
                        c.semester,
                        SUM(
                            HOUR(
                                TIMEDIFF(cs.end_time, cs.start_time)
                            )
                        ) AS sum_hours
                    FROM subject s
                        JOIN class c 
                            ON c.subject_id  = s.id
                        JOIN class_schedule cs
                            ON cs.class_id  = c.id
                        JOIN (
                            SELECT
                                s.id,
                                p.id AS professor_id,
                                p.name
                            FROM professor p
                            JOIN subject s 
                                ON s.professor_id  = p.id
                        ) ps ON ps.id = c.subject_id
                    WHERE 1 = 1
                    ${professorName ? `AND ps.name LIKE "%${professorName}%"` : ""}
                    ${semester ? `AND c.semester = "${semester}"` : ""}
                    GROUP BY ps.professor_id, c.semester;
                `,
                (err, rows) => err ? reject(err) : resolve(rows));
        });

    }
}
