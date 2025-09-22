import { MysqlConnection } from "../mysqlConnection";

export abstract class Factory {
    
    private mysqlConnection: MysqlConnection;

    constructor() {
        this.mysqlConnection = MysqlConnection.getInstance();
    }

    private makeInsertQuery(
        table: string, 
        data: Record<string, any>
    ): {
        sql: string,
        values: any
    }
    {
        const fields = Object.keys(data);
        const values = Object.values(data);

        const placeholders = fields.map(() => "?");
        const sql = `INSERT INTO ${table} (${fields.join(", ")}) VALUES (${placeholders})`;

        return { sql, values };
    }

    create(baseData: any = {})
    {
        const data = {
            ...this.definition(),
            ...baseData
        }

        const {
            sql,
            values
        } = this.makeInsertQuery(this.table(), data);

        console.log(sql, values);

        return new Promise((resolve, reject) => {

            this.mysqlConnection
                .getConnection()
                .query(sql, values, (err, result) => err ? reject(err) : resolve(result));
        });
    }

    async createMany(count: number, baseData: any = {}) {
        return Promise.all(
            Array.from({
                length: count
            })
            .map((_) => this.create(baseData))
        );
    }

    abstract definition(): Record<string, any>;
    abstract table(): string;
}
