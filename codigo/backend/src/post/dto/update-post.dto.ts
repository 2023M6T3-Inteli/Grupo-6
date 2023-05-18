import { PartialType } from '@nestjs/mapped-types';
import { CreatePostDto } from './create-post.dto';

export class UpdatePostDto extends PartialType(CreatePostDto) {
    id: string;
    title: string;
    description: string;
    category: string;
    createdAt: Date;
    creator_id: string;
}
