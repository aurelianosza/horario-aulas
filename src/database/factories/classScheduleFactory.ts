import { Factory } from "./factory";
import { faker } from "@faker-js/faker";

export class ClassScheduleFactory extends Factory {

    private generateTime(): {
        start_time: string,
        end_time: string
    }
    {
        const initialTime = faker.number.int({
            min: 8,
            max: 16
        });

        return {
            start_time: initialTime + ":00",
            end_time: (initialTime + (faker.number.int()%2) + 1) + ":00"
        };
    }

    definition(): Record<string, any>
    {
        const {
            start_time,
            end_time
        } = this.generateTime();

        return {
            class_id: faker.number.int({
                min: 1,
                max: 20
            }),
            room_id: faker.number.int({
                min: 1,
                max: 10
            }),
            day_of_week: faker.number.int({
                min: 0,
                max: 4
            }),
            start_time: start_time,
            end_time: end_time
        }
    }

    table(): string
    {
        return "class_schedule";    
    }
}
