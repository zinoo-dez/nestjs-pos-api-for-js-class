import { IsEmail } from "class-validator";
import { BeforeInsert, BeforeUpdate, Column, Entity, PrimaryGeneratedColumn } from "typeorm";
import * as bcrypt from "bcrypt";
@Entity('users')
export class User {
    @PrimaryGeneratedColumn()
    user_id: number;

    @Column()
    username: string;

    @Column()
    @IsEmail()
    email: string;

    @Column()
    password: string;
    // @BeforeInsert()
    // @BeforeUpdate()
    // async hashPassword() {
    //     if (this.password) {
    //         this.password = await bcrypt.hash(this.password,10);
    //     }
    // }

}
