import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { PostService } from './post.service';
import { CreatePostDto } from './dto/create-post.dto';
import {ApiBody, ApiOperation, ApiTags, ApiOkResponse, ApiBadRequestResponse, ApiNotFoundResponse, ApiInternalServerErrorResponse, ApiConflictResponse } from '@nestjs/swagger';

// Importing decorations for API documentation
@ApiTags('Post')
@Controller('post')
export class PostController {
  constructor(private readonly postService: PostService) {}

  //Route create a new post
  @ApiOperation({ summary: 'Criar novo post' })
  @ApiBody({ type: CreatePostDto })
  @ApiOkResponse({ description: 'Post criado com sucesso' })
  @ApiBadRequestResponse({ description: 'Dados inválidos' })
  @ApiConflictResponse({ description: 'Conflito ao criar o post' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Post()
  create(@Body() createPostDto: CreatePostDto) {
    return this.postService.create(createPostDto);
  }

  //Route to list all posts
  @ApiOperation({ summary: 'Listar todos os posts' })
  @ApiOkResponse({ description: 'Lista de posts retornada com sucesso' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Get()
  findAll() {
    return this.postService.getAllPosts();
  }


  //Route to list a specific post by id
  @ApiOperation({ summary: 'Filtrar post por id' })
  @ApiOkResponse({ description: 'Post encontrado com sucesso' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @ApiNotFoundResponse({ description: 'Post não encontrado' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Get(':id')
  findOneById(@Param('id') id: string) {
    return this.postService.getPostById(id);
  }

  //Route to list a specific post by title
  @ApiOperation({ summary: 'Filtrar por título' })
  @ApiOkResponse({ description: 'Post encontrado com sucesso' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @ApiNotFoundResponse({ description: 'Post não encontrado' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Get(':title')
  findOneByTitle(@Param('title') title: string, @Param('id') id: string) {
    return this.postService.getPostByTitle(title, id);
  }

  //Route to update a specific post
  @ApiOperation({ summary: 'Atualizar post específico' })
  @ApiBody({ type: CreatePostDto })
  @ApiOkResponse({ description: 'Post atualizado com sucesso' })
  @ApiBadRequestResponse({ description: 'Dados inválidos' })
  @ApiNotFoundResponse({ description: 'Post não encontrado' })
  @ApiConflictResponse({ description: 'Conflito ao atualizar o post' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Patch(':id')
  update(@Param('id') id: string, @Body() data: CreatePostDto) {
    return this.postService.updatePost(id, data);
  }

  //Route to delete a specific post
  @ApiOperation({ summary: 'Deletar post específico' })
  @ApiOkResponse({ description: 'Post deletado com sucesso' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @ApiNotFoundResponse({ description: 'Post não encontrado' })
  @ApiConflictResponse({ description: 'Conflito ao atualizar o post' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.postService.deletePost(id);
  }

  //Route to list specific posts by creator
  @Get('creator/:creator')
  findPostsByCreator(@Param('creator') creator: string) {
    return this.postService.getPostByCreator(creator);
  }
}
