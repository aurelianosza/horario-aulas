import dotenv from "dotenv";
import minimist from "minimist";
import { GetBusyRoomsScheduleController } from "./controllers/getBusyRoomsSchedule";
import { GetFreeRoomsScheduleController } from "./controllers/getFreeRoomsSchedule";
import { GetHoursController } from "./controllers/getHoursController";

dotenv.config();

const operations = {
    "professor-hours" : {
        controller: GetHoursController,
        params: {
            "professor-name": "name of professor",
            semester : "semester with year.period Eg: 2025.1"
        }
    },
    "free-rooms" : {
        controller: GetFreeRoomsScheduleController,
        params: {
            "week-day": "2 = Monday, 3 = Tuesday, 4 = Wednesday, 5 = Thursday, 6 = Friday",
            room : "room number"
        }
    },
    "busy-rooms" : {
        controller: GetBusyRoomsScheduleController,
        params: {
            "week-day": "2 = Monday, 3 = Tuesday, 4 = Wednesday, 5 = Thursday, 6 = Friday",
            room : "room number"
        }
    }
}

async function start(
    operation: string,
    args: any
) {
    if (!operation) {
        console.log("invalid operation, select one please:");
        console.table(Object.keys(operations));
        console.log("Eg: yarn start professor-hours\n");

        process.exit(0);
    }

    if (!(operation in operations)) {
        console.log("invalid operation, select one please:");
        console.table(Object.keys(operations));
        console.log("Eg: yarn start professor-hours\n");

        process.exit(0);
    }

    // @ts-ignore
    const selectedOperation = operations[operation];
    
    const result = await selectedOperation.controller
        .make()
        .execute(args);

    console.log("available filters:");
    console.log(selectedOperation.params);
    console.table(result);

    return process.exit(0);
}

const args = minimist(process.argv.slice(2));

const operation = args._[0];

start(operation, args);
