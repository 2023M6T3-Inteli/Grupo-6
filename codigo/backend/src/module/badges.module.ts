import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import {Badges} from './entity/badges.entity';
import { BadgeService } from '../services/bedges.service';
import { beadgesController } from '../controller/badges.controller';

@Module({
  imports: [TypeOrmModule.forFeature([Badges])],
  controllers: [beadgesController],
  providers: [BadgeService],
})
export class BadgesModule {}