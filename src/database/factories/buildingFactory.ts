import { Factory } from "./factory";
import { faker } from "@faker-js/faker";

export class BuildingFactory extends Factory {
    
    definition(): Record<string, any>
    {
        return {
            name : faker.location.city()
        }
    }

    table(): string
    {
        return "building";    
    }
}
