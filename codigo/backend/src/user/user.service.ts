//@ts-nocheck
import { BadRequestException, Injectable, InternalServerErrorException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { PrismaService } from '../prisma.service';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}
  
  //Method to create a new user
  async create(data: CreateUserDto) {

    //Check if a user with the exact same data already exists
    const userExist = await this.prisma.user.findMany({
      where: {
        email: data.email
      }
    })

    //If a user with the exact same data already exists, throw a BadRequestException
    if (userExist.length > 0){
      throw new BadRequestException('Usuário com esse e-mail já existe no banco de dados.')
      
    };

    try{
      //Create a new user
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
          photo_url: data.photo_url,
          hard_skills: data.hard_skills,
          soft_skills: data.soft_skills
        }
      });
    }

    catch (error){
      console.log(error);
      throw new InternalServerErrorException('Something bad happened: ', error)
    }
  }

  //Method to get all users
  async findAll() {
    try{
      
      //Get all users
      const users = await this.prisma.user.findMany({
      })
      return users
    }
    catch(error) {
      console.log(error)
      throw new InternalServerErrorException('Something bad happened: ', error)
    }
  }

  //Method to get a specific user by given ID
  async findOne(id: string) {
    const userExist = await this.prisma.user.findUnique({
      where: {
        id: id
      }
    })

    //If an user with given ID does not exist, throw a BadRequestException
    if (!userExist){
      console.log("User not found")
      throw new BadRequestException('Something bad happened: User not found')
    }

    try{
      
      //Get a specific user with given ID
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
  
  //Method to update an user
  async update(id: string, data: CreateUserDto) {

    //Check if user with given ID exists
    const userExist = await this.prisma.user.findUnique({
      where: {
        id: id
      }
    })
    
    //If user with given ID does not exist, throw a BadRequestException
    if (!userExist){
      console.log("User not found")
      throw new BadRequestException('Something bad happened: User not found')
    }

    try{

      //Update specific user
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
          photo_url: data.photo_url,
          hard_skills: data.hard_skills,
          soft_skills: data.soft_skills
        }
      });
      
      return user
    }
    catch(error) {
      console.log(error)
      throw new InternalServerErrorException('Something bad happened: ', error)
    }
  }

  //Method to delete a specific user
  async delete(id: string) {

    //Check if user with given ID exists
    const userExist = await this.prisma.user.findUnique({
      where: {
        id: id
      }
    })

    //If user with given ID does not exist, throw a BadRequestException
    if (!userExist){
      console.log("User not found")
      throw new BadRequestException('Something bad happened: User not found')
    }

    try{

      //Delete a specific user
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

  async updateScore(id: String, score: number){
    //Check if user with given ID exists
    const userExist = await this.prisma.user.findUnique({
      where: {
        id: id
      }
    })
    
    //If user with given ID does not exist, throw a BadRequestException
    if (!userExist){
      console.log("User not found")
      throw new BadRequestException('Something bad happened: User not found')
    }

    try{

      //Update specific user score
      const user = await this.prisma.user.update({
        where: {id: id},
        data: {
          score: score.score
        }
      });
      
      return user
    }
    catch(error) {
      console.log(error)
      throw new InternalServerErrorException('Something bad happened: ', error)
    }
  }

}
