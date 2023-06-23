import { CreateBadgeDto } from "src/badge/dto/create-badge.dto";
import { CreatePostDto } from "src/post/dto/create-post.dto";

export class User {
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
    hard_skills: string;
    soft_skills: string;
    
    constructor(data: Partial<User>) {
        Object.assign(this, data);
      }
}
