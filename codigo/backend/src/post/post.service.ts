import { Injectable } from '@nestjs/common';
import { CreatePostDto } from './dto/create-post.dto';
import { UpdatePostDto } from './dto/update-post.dto';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class PostService {
  constructor(private prisma: PrismaService) {}

  async create(data: CreatePostDto) {
    const newPost = await this.prisma.post.create({
      data: {
        title: "la la la",
        description: "lalala",
        category: "lalala",
        createdAt: new Date(),
        creator: "537ab60c-dd46-4080-be07-d9805330d5ba"
      }
    });
  }

  async findAll() {
    const post = await this.prisma.post.findMany({})

    return post;
  }

  async findById(id: string) {
    const post = await this.prisma.post.findUnique({
      where: { id: id },
    })

    return post;
  }

  // async findByTitle(title: string) {
  //   const post = await this.prisma.post.findUnique({
  //     where: { title: title },
  //   })

  //   return post;
  // }

  async update(id: string, updatePostDto: UpdatePostDto) {
    const post = await this.prisma.post.update({
      where: { id: id },
      data: updatePostDto,
    })

    return post;
  }

  async delete(id: string) {
    const post = await this.prisma.post.delete({
      where: { id: id },
    })

    return post;
  }
}
