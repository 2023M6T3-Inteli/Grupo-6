import { PartialType } from '@nestjs/mapped-types';
import { CreateBadgeDto } from 'src/badge/dto/create-badge.dto';
import { CreatePostDto } from 'src/post/dto/create-post.dto';
import { CreateUserDto } from './create-user.dto';

export class UpdateUserDto extends PartialType(CreateUserDto) {
    id: string;
    name: string;
    role: string;
    about_me: string;
    email: string;
    password: string;
    createdAt: Date;
    updatedAt: Date;
    badges: CreateBadgeDto;
    posts: CreatePostDto;
    projects: string;
}
