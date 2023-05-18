import { Injectable } from '@nestjs/common';
import { CreatePostDto } from './dto/create-post.dto';
import { UpdatePostDto } from './dto/update-post.dto';
import { PrismaService } from '../prisma.service';

@Injectable()
export class PostService {
  constructor(private prisma: PrismaService) {}
  // src/articles/articles.service.ts

// @Injectable()
// export class ArticlesService {
//   constructor(private prisma: PrismaService) {}

//   create(createArticleDto: CreateArticleDto) {
//     return 'This action adds a new article';
//   }

//   findDrafts() {
//     return this.prisma.article.findMany({ where: { published: false } });
//   }

//   // ...

// }
  create(createPostDto: CreatePostDto) {


    return 'This action adds a new post';
  }

  findAll() {
    return `This action returns all post`;
  }

  findById(id: number) {
    return `This action returns a #${id} post`;
  }

  findByTitle(title: string) {
    return `This action returns a #${title} post`;
  }

  update(id: number, updatePostDto: UpdatePostDto) {
    return `This action updates a #${id} post`;
  }

  remove(id: number) {
    return `This action removes a #${id} post`;
  }
}
