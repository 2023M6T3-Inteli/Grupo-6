import { ApiProperty } from "@nestjs/swagger";

export class CreatePostDto {
    
    @ApiProperty()
    id: string;

    @ApiProperty()
    title: string;

    @ApiProperty()
    description: string;

    @ApiProperty()
    category: string;

    @ApiProperty()
    createdAt: String;

    @ApiProperty()
    creator: string;
}
