import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaService } from '../prisma.service';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}

  async create(data: CreateUserDto) {
    const newUser = await this.prisma.user.create({
      data: {
        name: data.name,
        role: data.role,
        about_me: data.about_me,
        email: data.email,
        password: data.password,
        badges: data.badges,
        projects: data.projects
      }
    });
  }

  async findAll() {
    const users = await this.prisma.user.findMany({})

    return users
  }

  async findOne(id: string) {
    const user = await this.prisma.user.findUnique({
      where: { id: id}
      });
      
      return user
  }
  
  async update(id: string, data: CreateUserDto) {
    const user = await this.prisma.user.update({
      where: {id: id},
      data: {
        name: data.name,
        role: data.role,
        about_me: data.about_me,
        email: data.email,
        password: data.password,
        badges: data.badges,
        projects: data.projects
      }
    });
    
    return user
  }

  async delete(id: string) {
    const user = await this.prisma.user.delete({
      where: {id: id}
    });

    return user
  }
}
