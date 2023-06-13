import {CreateBadgeDto} from '../../badge/dto/create-badge.dto'
import {CreatePostDto} from '../../post/dto/create-post.dto'
import { ApiProperty } from '@nestjs/swagger';

// Create User body definition
export class CreateUserDto {    
    @ApiProperty()
    id: string;

    @ApiProperty()
    name: string;

    @ApiProperty()
    role: string;

    @ApiProperty()
    about_me: string;

    @ApiProperty()
    email: string;

    @ApiProperty()
    password: string;

    @ApiProperty()
    createdAt: Date;

    @ApiProperty()
    updatedAt: Date;

    @ApiProperty()
    badges: CreateBadgeDto;

    @ApiProperty()
    posts: CreatePostDto;

    @ApiProperty()
    projects: string;

    hard_skills: string;
    soft_skills: string;

}
