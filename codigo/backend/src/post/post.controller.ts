import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { PostService } from './post.service';
import { CreatePostDto } from './dto/create-post.dto';
import { UpdatePostDto } from './dto/update-post.dto';

@Controller('post')
export class PostController {
  constructor(private readonly postService: PostService) {}

  @Post()
  create(@Body() createPostDto: CreatePostDto) {
    return this.postService.create(createPostDto);
  }

  @Get()
  findAll() {
    return this.postService.getAllPosts();
  }

  @Get(':id')
  findOneById(@Param('id') id: string) {
    return this.postService.getPostById(id);
  }

  @Get(':title')
  findOneByTitle(@Param('title') title: string, @Param('id') id: string) {
    return this.postService.getPostByTitle(title, id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() data: CreatePostDto) {
    return this.postService.updatePost(id, data);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.postService.deletePost(id);
  }
}
