import { Column, PrimaryGeneratedColumn,Entity} from 'typeorm';

@Entity()
export class Badges{
    @PrimaryGeneratedColumn()
    public id_badge: number;

    @Column()
    public picture: string;

    @Column()
    public type: string;

    @Column()
    public description: string;
}