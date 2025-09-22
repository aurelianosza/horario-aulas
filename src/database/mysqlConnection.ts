import mysql, { Connection } from "mysql2";

export class MysqlConnection {
    private static instance: MysqlConnection;
    private connection: Connection;
    
    private constructor()
    {}

    static getInstance(): MysqlConnection
    {
        if (!MysqlConnection.instance) {
            const mysqlConnection = new MysqlConnection();

            mysqlConnection.connection = mysql.createConnection({
                host: process.env.DB_HOST,
                port: Number(process.env.DB_PORT),
                user: process.env.DB_USER,
                password: process.env.DB_PASSWORD,
                database: process.env.DB_DATABASE
            });

            mysqlConnection.connection.connect();

            MysqlConnection.instance = mysqlConnection;
        }

        return MysqlConnection.instance;
    }

    getConnection(): Connection
    {
        return this.connection;
    }
}
