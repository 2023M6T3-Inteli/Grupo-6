// @ts-ignore
import { Injectable, BadRequestException, InternalServerErrorException } from '@nestjs/common';
import { CreatePostDto } from './dto/create-post.dto';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class PostService {
  constructor(private prisma: PrismaService) {}

  //Method to create a new post
  async create(data: CreatePostDto) {

    //Check if a post with the same data already exists
    const postExist = await this.prisma.post.findMany({
      where: {
        title: data.title,
        description: data.description,
        category: data.category,
        creator: data.creator, 
      },
    });

    //If a post with the same data already exists, throw a BadRequestException
    if (postExist.length) {
      console.log("Post already exists");
      throw new BadRequestException('Something bad happened: Post already exists');
    }

    
    try {
      var now = new Date();
      var date = now.toLocaleDateString();

      //Create a new post
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

  //Method to get all posts
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

  //Method to get a specific post from a given ID
  async getPostById(id: string) {
    const postExist = await this.prisma.post.findUnique({
      where: {id: id},
    })

    //If a post with given ID does not exist, throw a BadRequestException
    if (!postExist) {
      console.log("Post not found");
      throw new BadRequestException('Something bad happened: Post not found');
    }

    try {

      //Find a specific post from a given ID
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

  //Method to get a specific post from a given title
  async getPostByTitle(title: string, id: string) {
    const postExist = await this.prisma.post.findUnique({
      where: { 
        id,
      },
    })

    //If a post with a given title does not exist, throw a BadRequestException
    if (!postExist) {
      console.log("Post not found");
      throw new BadRequestException('Something bad happened: Post not found');
    }

    try {
      //Find posts with given title
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

  //Method to update a post from given ID
  async updatePost(id: string, data: CreatePostDto) {

    //Update a post from a given ID
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

  //Method to delete a post from given ID
  async deletePost(id: string) {
    const postExist = await this.prisma.post.findUnique({
      where: { 
        id, 
      },
    })

    //If a post with given ID does not exist, throw a BadRequestException
    if (!postExist) {
      console.log("Post not found");
      throw new BadRequestException('Something bad happened: Post not found');
    }

    try {

    // Delete a specific post from given ID
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


  //Method to get all posts from a specific creator
  async getPostByCreator(creator: string) {
    try {
      const post = await this.prisma.post.findMany({
        where: { creator: creator },
        include: {author: true},
      })
      return post;
    }
    catch (error) {
      console.log(error);
      throw new InternalServerErrorException('Something bad happened: ', error);
    }
  }
}
