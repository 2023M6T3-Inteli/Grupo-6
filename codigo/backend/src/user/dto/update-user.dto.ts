import { PartialType } from '@nestjs/mapped-types';
import { CreateBadgeDto } from 'src/badge/dto/create-badge.dto';
import { CreatePostDto } from 'src/post/dto/create-post.dto';
import { CreateUserDto } from './create-user.dto';
import { ApiProperty } from '@nestjs/swagger';

export class UpdateUserDto extends PartialType(CreateUserDto) {
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
}
