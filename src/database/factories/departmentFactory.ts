import { Factory } from "./factory";
import { faker } from "@faker-js/faker";

export class DepartmentFactory extends Factory {
    
    static readonly availableDepartments = [
        "Departamento de exatas",
        "Departamento de ciências naturais",
        "Departamento de ciências sociais",
        "Departamento de linguas",
        "Departamento de artes",
    ]
    
    definition(): Record<string, any>
    {
        return {
            name : faker.helpers.arrayElement(DepartmentFactory.availableDepartments)
        }
    }

    table(): string
    {
        return "department";    
    }
}
