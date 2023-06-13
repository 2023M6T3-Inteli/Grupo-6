import { ApiProperty } from "@nestjs/swagger";

// DTO to create a badge
export class CreateBadgeDto {
    @ApiProperty()
    id: string;

    @ApiProperty()
    picture: string;

    @ApiProperty()
    type: string;

    @ApiProperty()
    description: string;	
}
