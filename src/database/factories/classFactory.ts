import { Factory } from "./factory";
import { faker } from "@faker-js/faker";

export class ClassFactory extends Factory {

    private generateSemester(year: number): string
    {
        return `${year}.${(faker.number.int()%2) +1}`;
    }
    
    definition(): Record<string, any>
    {
        const year = faker.number.int({
            min: 2020,
            max: 2025
        });

        return {
            subject_id : faker.number.int({
                min: 1,
                max: 10
            }),
            year: year,
            semester: this.generateSemester(year),
            code: faker.string.alpha(5)
        };
    }

    table(): string
    {
        return "class";    
    }
}
