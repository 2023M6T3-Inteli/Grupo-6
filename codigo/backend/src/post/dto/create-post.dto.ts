import { ApiProperty } from "@nestjs/swagger";

// Create Post body definition
export class CreatePostDto {
    
    id: string;

    @ApiProperty()
    title: string;

    @ApiProperty()
    description: string;

    @ApiProperty()
    category: string;

    createdAt: String;

    @ApiProperty()
    creator: string;
}
