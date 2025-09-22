import { Factory } from "./factory";
import { faker } from "@faker-js/faker";

export class RoomFactory extends Factory {
    
    definition(): Record<string, any>
    {
        return {
            building_id: 1,
            description: faker.person.fullName()
        }
    }

    table(): string
    {
        return "room";    
    }
}
