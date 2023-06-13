import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { BadgeService } from './badge.service';
import { CreateBadgeDto } from './dto/create-badge.dto';
import { ApiBody, ApiOperation, ApiTags, ApiOkResponse, ApiNotFoundResponse, ApiBadRequestResponse, ApiInternalServerErrorResponse, ApiConflictResponse } from '@nestjs/swagger';

@ApiTags('Badge')
@Controller('badge')
export class BadgeController {
  constructor(private readonly badgeService: BadgeService) {}

  // API to create a badge
  @ApiOperation({summary: 'Criar nova badge' })
  @ApiBody({ type: CreateBadgeDto })
  @ApiOkResponse({ description: 'Badge criada com sucesso' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @ApiConflictResponse({ description: 'Conflito ao criar a badge' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Post()
  create(@Body() createBadgeDto: CreateBadgeDto) {
    return this.badgeService.create(createBadgeDto);
  }

// API to list all badges
  @ApiOperation({ summary: 'Listar todas as badges' })
  @ApiOkResponse({ description: 'Lista de badges retornada com sucesso' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @Get()
  findAll() {
    return this.badgeService.findAll();
  }

// API to filter a badge by id
  @ApiOperation({ summary: 'Filtrar badge por id' })
  @ApiOkResponse({ description: 'Badge encontrada com sucesso' })
  @ApiNotFoundResponse({ description: 'Badge não encontrada' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.badgeService.findOne(id);
  }

  // API to update a badge'
  @ApiOperation({ summary: 'Atualizar badge específica' })
  @ApiBody({ type: CreateBadgeDto })
  @ApiOkResponse({ description: 'Badge atualizada com sucesso' })
  @ApiNotFoundResponse({ description: 'Badge não encontrada' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @ApiConflictResponse({ description: 'Conflito ao atualizar a badge' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Patch(':id')
  update(@Param('id') id: string, @Body() data: CreateBadgeDto) {
    return this.badgeService.update(id, data);
  }

  // API to delete a badge
  @ApiOperation({ summary: 'Deletar badge específica' })
  @ApiOkResponse({ description: 'Badge deletada com sucesso' })
  @ApiNotFoundResponse({ description: 'Badge não encontrada' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @ApiConflictResponse({ description: 'Conflito ao deletar a badge' })
  @ApiInternalServerErrorResponse({ description: 'Erro interno do servidor' })
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.badgeService.remove(id);
  }
}

