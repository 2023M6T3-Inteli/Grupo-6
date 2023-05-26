import { ApiProperty } from "@nestjs/swagger";

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
