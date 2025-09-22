import { SubjectFactory } from "../factories/subjectFactory";

export class SubjectSeed {
    private subjectFactory: SubjectFactory;

    constructor()
    {
        this.subjectFactory = new SubjectFactory();
    }

    async execute()
    {
        this.subjectFactory.createMany(10);

    }
}
