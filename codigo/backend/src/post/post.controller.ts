import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { PostService } from './post.service';
import { CreatePostDto } from './dto/create-post.dto';
import { ApiOperation, ApiTags, ApiOkResponse, ApiBadRequestResponse, ApiNotFoundResponse } from '@nestjs/swagger';

@ApiTags('Post')
@Controller('post')
export class PostController {
  constructor(private readonly postService: PostService) {}

  @ApiOperation({ summary: 'Criar novo post' })
  @ApiOkResponse({ description: 'Post criado com sucesso' })
  @ApiBadRequestResponse({ description: 'Dados inválidos' })
  @Post()
  create(@Body() createPostDto: CreatePostDto) {
    return this.postService.create(createPostDto);
  }

  @ApiOperation({ summary: 'Listar todos os posts' })
  @ApiOkResponse({ description: 'Lista de posts retornada com sucesso' })
  @Get()
  findAll() {
    return this.postService.getAllPosts();
  }

  @ApiOperation({ summary: 'Filtrar post por id' })
  @ApiOkResponse({ description: 'Post encontrado com sucesso' })
  @ApiNotFoundResponse({ description: 'Post não encontrado' })
  @Get(':id')
  findOneById(@Param('id') id: string) {
    return this.postService.getPostById(id);
  }

  @ApiOperation({ summary: 'Filtrar por título' })
  @ApiOkResponse({ description: 'Post encontrado com sucesso' })
  @ApiNotFoundResponse({ description: 'Post não encontrado' })
  @Get(':title')
  findOneByTitle(@Param('title') title: string, @Param('id') id: string) {
    return this.postService.getPostByTitle(title, id);
  }

  @ApiOperation({ summary: 'Atualizar post específico' })
  @ApiOkResponse({ description: 'Post atualizado com sucesso' })
  @ApiBadRequestResponse({ description: 'Dados inválidos' })
  @ApiNotFoundResponse({ description: 'Post não encontrado' })
  @Patch(':id')
  update(@Param('id') id: string, @Body() data: CreatePostDto) {
    return this.postService.updatePost(id, data);
  }

  @ApiOperation({ summary: 'Deletar post específico' })
  @ApiOkResponse({ description: 'Post deletado com sucesso' })
  @ApiNotFoundResponse({ description: 'Post não encontrado' })
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.postService.deletePost(id);
  }
}
