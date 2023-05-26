// @ts-ignore
import { Injectable, BadRequestException, InternalServerErrorException } from '@nestjs/common';
import { CreatePostDto } from './dto/create-post.dto';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class PostService {
  constructor(private prisma: PrismaService) {}

  async create(data: CreatePostDto) {
    const postExist = await this.prisma.post.findMany({
      where: {
        title: data.title,
        description: data.description,
        category: data.category,
        creator: data.creator, 
      },
    });

    if (postExist.length) {
      console.log("Post already exists");
      throw new BadRequestException('Something bad happened: Post already exists');
    }

    
    try {
      var now = new Date();
      var date = now.toLocaleDateString();
    const newPost = await this.prisma.post.create({
      data: {
        title: data.title,
        description: data.description,
        category: data.category,
        createdAt: date,
        creator: data.creator
      }
    });
   }  
    catch (error) {
      console.log(error);
      throw new InternalServerErrorException('Something bad happened: ', error);
    }
  }

  async getAllPosts() {
    try {
      const allPosts = await this.prisma.post.findMany({
        include: {author: true},
      })
      return allPosts;
    }
    catch (error) {
      console.log(error);
      throw new InternalServerErrorException('Something bad happened: ', error);
    }
  }

  async getPostById(id: string) {
    const postExist = await this.prisma.post.findUnique({
      where: {id: id},
    })

    if (!postExist) {
      console.log("Post not found");
      throw new BadRequestException('Something bad happened: Post not found');
    }

    try {
      const post = await this.prisma.post.findUnique({
        where: { id: id },
        include: {author: true},
      })
      return post;
    }
    catch (error) {
      console.log(error);
      throw new InternalServerErrorException('Something bad happened: ', error);
    }
  }

  async getPostByTitle(title: string, id: string) {
    const postExist = await this.prisma.post.findUnique({
      where: { 
        id,
      },
    })

    if (!postExist) {
      console.log("Post not found");
      throw new BadRequestException('Something bad happened: Post not found');
    }

    try {
      const post = await this.prisma.post.findMany({
        where: { title: title },
      })
      return post;
    }
    catch (error) {
      console.log(error);
      throw new InternalServerErrorException('Something bad happened: ', error);
    }
  }

  async updatePost(id: string, data: CreatePostDto) {
    const post = await this.prisma.post.update({
      where: { id: id },
      data: {
        title: data.title,
        description: data.description,
        category: data.category,
        creator: data.creator
      },
    })

    return post;
  }

  async deletePost(id: string) {
    const postExist = await this.prisma.post.findUnique({
      where: { 
        id, 
      },
    })

    if (!postExist) {
      console.log("Post not found");
      throw new BadRequestException('Something bad happened: Post not found');
    }

    try {
    const post = await this.prisma.post.delete({
      where: { id: id },
    })
    return post;
    }
    catch (error) {
      console.log(error);
      throw new InternalServerErrorException('Something bad happened: ', error);
    }
  }
}
