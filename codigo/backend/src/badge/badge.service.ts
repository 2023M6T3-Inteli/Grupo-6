import { Injectable, InternalServerErrorException, BadRequestException } from '@nestjs/common';
import { CreateBadgeDto } from './dto/create-badge.dto';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class BadgeService {
  constructor(private prisma: PrismaService) {}

  // API to create a badge
  async create(data: CreateBadgeDto) {
    const badgeExist = await this.prisma.badges.findMany({
      where: {
        picture: data.picture,
        type: data.type,
        description: data.description,
      },
    });

// Verify if badge already exists
    if (badgeExist.length) {
      console.log("Badge already exists");
      throw new BadRequestException('Something bad happened: Badge already exists');
    }

    try {
      const newBadge = await this.prisma.badges.create({
        data: {
          picture: data.picture,
          type: data.type,
          description: data.description,
        }
      });
     }  
      catch (error) {
        console.log(error);
        throw new InternalServerErrorException('Something bad happened: ', error);
      }
  }

  // API to list all badges
  async findAll() {
    try {
      const allBadges = await this.prisma.post.findMany({})
      return allBadges;
    }
    catch (error) {
      console.log(error);
      throw new InternalServerErrorException('Something bad happened: ', error);
    }
  }

  // API to filter a badge by id
  async findOne(id: string) {
    const badgeExist = await this.prisma.badges.findUnique({
      where: { id: id },
    })
// Verify if badge exists
    if (!badgeExist) {
      console.log("Badge not found");
      throw new BadRequestException('Something bad happened: Badge not found');
    }

    try {
      const badge = await this.prisma.post.findUnique({
        where: { id: id },
      })
      return badge;
    }
    catch (error) {
      console.log(error);
      throw new InternalServerErrorException('Something bad happened: ', error);
    }
  }

  // API to update a badge
  async update(id: string, data: CreateBadgeDto) {
    const badge = await this.prisma.badges.update({
      where: { id: id },
      data: data,
    })

    return badge;
  }

  // API to delete a badge
  async remove(id: string) {
    const badgeExist = await this.prisma.post.findUnique({
      where: { 
        id, 
      },
    })
// Verify if badge exists
    if (!badgeExist) {
      console.log("Badge not found");
      throw new BadRequestException('Something bad happened: Badge not found');
    }

    try {
    const badge = await this.prisma.post.delete({
      where: { id: id },
    })
    
    return badge;
    }
    catch (error) {
      console.log(error);
      throw new InternalServerErrorException('Something bad happened: ', error);
    } 
  }
}
