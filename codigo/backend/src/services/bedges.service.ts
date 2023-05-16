import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import createBedgeDto from '../module/dto/CreateBadge.dto';
import { Badges } from '../module/entity/badges.entity';

@Injectable()
export class BadgeService {
  constructor(
    @InjectRepository(Badges) private BadgesRepository: Repository<Badges>,
  ) {}

  getAllBadges() {
    return this.BadgesRepository.find();
  }

  async getBadgesById(id_badge: number) {
    const badge = await this.BadgesRepository.findOneById(id_badge);
    if (badge) {
      return badge;
    }

  }

  async createBadges(project: createBedgeDto) {
    const newBadge = await this.BadgesRepository.create(project);
    await this.BadgesRepository.save(newBadge);

    return newBadge;
  }

}