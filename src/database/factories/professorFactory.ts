import { Factory } from "./factory";
import { faker } from "@faker-js/faker";

export class ProfessorFactory extends Factory {
    
    definition(): Record<string, any>
    {
        return {
            department_id: faker.number.int({
                min: 1,
                max: 5
            }),
            title_id: faker.number.int({
                min: 1,
                max: 5
            }),

            name: faker.person.fullName()
        }
    }

    table(): string
    {
        return "professor";    
    }
}
