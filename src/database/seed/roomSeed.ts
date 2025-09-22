import { RoomFactory } from "../factories/roolFactory";

export class RoomSeed {
    private roomFactory: RoomFactory;

    constructor()
    {
        this.roomFactory = new RoomFactory();
    }

    async execute()
    {
        Array.from({
            length: 10
        }).forEach((_, index: number) => {
            this.roomFactory
                .create({
                    description: "Sala " + (index + 1)
                });
        });
    }
}
