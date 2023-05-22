import {CreateBadgeDto} from '../../badge/dto/create-badge.dto'
import {CreatePostDto} from '../../post/dto/create-post.dto'

export class CreateUserDto {
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
