import { ApiProperty } from "@nestjs/swagger";
import { IsEmail, IsNotEmpty, IsString, Length } from "class-validator";

export class CreateUserDto {
    @ApiProperty({ description: 'The name of the user', maxLength: 255 })
    @IsNotEmpty()
    @IsString()
    @Length(3, 100)
    username: string;

    @ApiProperty({ description: 'The email of the user', maxLength: 255 })
    @IsNotEmpty()
    @IsEmail()
    email: string;

    @ApiProperty({ description: 'The password of the user', maxLength: 255 })
    @IsNotEmpty()
    @IsString()
    @Length(3, 100)
    password: string;
}
