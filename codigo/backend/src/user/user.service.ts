//@ts-nocheck
import { BadRequestException, Injectable, InternalServerErrorException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { PrismaService } from '../prisma.service';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}
  
  async create(data: CreateUserDto) {
    const userExist = await this.prisma.user.findMany({
      where: {
        email: data.email
      }
    })

    if (userExist){
      throw new BadRequestException('Usuário com esse e-mail já existe no banco de dados.')
      
    };

    try{
      const newUser = await this.prisma.user.create({
        data: {
          name: data.name,
          role: data.role,
          about_me: data.about_me,
          email: data.email,
          password: data.password,
          badges: data.badges,
          posts: data.posts,
          projects: data.projects,
          photo_url: data.photo_url
        }
      });
    }

    catch (error){
      console.log(error);
      throw new InternalServerErrorException('Something bad happened: ', error)
    }
  }

  async findAll() {
    try{
      const users = await this.prisma.user.findMany({})
      return users
    }
    catch(error) {
      console.log(error)
      throw new InternalServerErrorException('Something bad happened: ', error)
    }
  }

  async findOne(id: string) {
    const userExist = await this.prisma.user.findUnique({
      where: {
        id: id
      }
    })

    if (!userExist){
      console.log("User not found")
      throw new BadRequestException('Something bad happened: User not found')
    }

    try{
      const user = await this.prisma.user.findUnique({
        where: { id: id}
      });
        return user
    }
    catch(error) {
      console.log(error)
      throw new InternalServerErrorException('Something bad happened: ', error)
    }
  }
  
  async update(id: string, data: CreateUserDto) {
    const userExist = await this.prisma.user.findUnique({
      where: {
        id: id
      }
    })
    
    if (!userExist){
      console.log("User not found")
      throw new BadRequestException('Something bad happened: User not found')
    }

    try{
      const user = await this.prisma.user.update({
        where: {id: id},
        data: {
          name: data.name,
          role: data.role,
          about_me: data.about_me,
          email: data.email,
          password: data.password,
          badges: data.badges,
          posts: data.posts,
          projects: data.projects,
          photo_url: data.photo_url
        }
      });
      
      return user
    }
    catch(error) {
      console.log(error)
      throw new InternalServerErrorException('Something bad happened: ', error)
    }
  }

  async delete(id: string) {
    const userExist = await this.prisma.user.findUnique({
      where: {
        id: id
      }
    })

    if (!userExist){
      console.log("User not found")
      throw new BadRequestException('Something bad happened: User not found')
    }

    try{
      const user = await this.prisma.user.delete({
        where: {id: id}
      });

      return user
    }

    catch(error) {
      console.log(error)
      throw new InternalServerErrorException('Something bad happened: ', error)
    }
  }
}
