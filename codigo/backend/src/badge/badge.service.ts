import { Injectable } from '@nestjs/common';
import { CreateBadgeDto } from './dto/create-badge.dto';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class BadgeService {
  constructor(private prisma: PrismaService) {}

  async create(createBadgeDto: CreateBadgeDto) {
    const newBadge = await this.prisma.badges.create({
      data: {
        picture: "lalala",
        type: "lalala",
        description: "lalala",
      }
    });
  }

  async findAll() {
    const badge = await this.prisma.badges.findMany({})

    return badge;
  }

  async findOne(id: string) {
    const badge = await this.prisma.badges.findUnique({
      where: { id: id },
    })

    return badge;
  }

  async update(id: string, data: CreateBadgeDto) {
    const badge = await this.prisma.badges.update({
      where: { id: id },
      data: data,
    })

    return badge;
  }

  async remove(id: string) {
    const badge = await this.prisma.badges.delete({
      where: { id: id },
    })

    return badge;
  }
}
