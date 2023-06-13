import { ApiProperty } from "@nestjs/swagger";

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
