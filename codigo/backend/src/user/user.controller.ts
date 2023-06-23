import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { UserService } from './user.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { ApiBody, ApiOperation, ApiTags, ApiOkResponse, ApiNotFoundResponse, ApiBadRequestResponse, ApiInternalServerErrorResponse, ApiConflictResponse } from '@nestjs/swagger';


@ApiTags('User')
@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  // API to create a new user
  @ApiOperation({ summary: 'Criar novo usuário' })
  @ApiBody({ type: CreateUserDto })
  @ApiOkResponse({ description: 'Usuário criado com sucesso' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @ApiConflictResponse({ description: 'Conflito ao criar o usuário' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Post()
  create(@Body() createUserDto: CreateUserDto) {
    return this.userService.create(createUserDto);
  }

  // API to list all users
  @ApiOperation({ summary: 'Listar todas os usuários' })
  @ApiOkResponse({ description: 'Lista de usuários retornada com sucesso' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Get()
  findAll() {
    return this.userService.findAll();
  }

  // API to find a user by id
  @ApiOperation({ summary: 'Filtrar usuário por id' })
  @ApiOkResponse({ description: 'Usuário encontrado com sucesso' })
  @ApiNotFoundResponse({ description: 'Usuário não encontrada' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.userService.findOne(id);
  }

  // API to update a user by id
  @ApiOperation({ summary: 'Atualizar usuário específico' })
  @ApiBody({ type: CreateUserDto })
  @ApiOkResponse({ description: 'Usuário atualizado com sucesso' })
  @ApiNotFoundResponse({ description: 'Usuário não encontrado' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @ApiConflictResponse({ description: 'Conflito ao atualizar o usuário' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Patch(':id')
  update(@Param('id') id: string, @Body() updateUserDto: UpdateUserDto) {
    return this.userService.update(id, updateUserDto);
  }

  // API to delete a user by id
  @ApiOperation({ summary: 'Deletar usuário específico' })
  @ApiOkResponse({ description: 'Usuário deletado com sucesso' })
  @ApiNotFoundResponse({ description: 'Usuário não encontrado' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @ApiConflictResponse({ description: 'Conflito ao deletar o usuário' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.userService.delete(id);
  }

  // API yo update user score by id
  @Patch('/score/:id')
  updateScore(@Param('id') id: string, @Body() score: number){
    return this.userService.updateScore(id,score)
  }
}
