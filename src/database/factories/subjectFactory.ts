import { faker } from "@faker-js/faker";
import { Factory } from "./factory";

export class SubjectFactory extends Factory {
    
    definition(): Record<string, any>
    {
        return {
            professor_id: faker.number.int({
                min: 1,
                max: 8
            }),
            code: faker.string.alpha({
                length: 6
            }),
            name: faker.word.noun()
        }
    }

    table(): string
    {
        return "subject";    
    }
}
