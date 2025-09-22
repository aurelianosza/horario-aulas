import { Factory } from "./factory";
import { faker } from "@faker-js/faker";

export class TitleFactory extends Factory {
    
    static readonly availableTitles = [
        "Matemática",
        "Português",
        "História",
        "Geografia",
        "Ciências",
        "Inglês",
        "Educação Física",
        "Artes",
        "Química",
        "Física",
        "Biologia",
        "Sociologia",
        "Filosofia"
    ];
    
    definition(): Record<string, any>
    {
        return {
            name : faker.helpers.arrayElement(TitleFactory.availableTitles)
        }
    }

    table(): string
    {
        return "title";    
    }
}
