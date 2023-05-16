import { Body, Controller, Get, Param, Post} from '@nestjs/common';
import CreateBadge from '../module/dto/CreateBadge.dto';
import { BadgeService } from '../services/bedges.service';


@Controller('badge')
export class beadgesController {
  constructor(private readonly BadgeService: BadgeService) {}

  @Get()
  getProject() {
    return this.BadgeService.getAllBadges();
  }

  @Get(':id')
  getProjectById(@Param('id') id: number) {
    return this.BadgeService.getBadgesById(Number(id));
  }

  @Post()
  async createBadges(@Body() Badges: CreateBadge) {
    return this.BadgeService.createBadges(Badges);
  }

}