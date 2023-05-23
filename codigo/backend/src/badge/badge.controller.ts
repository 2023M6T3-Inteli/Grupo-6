import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { BadgeService } from './badge.service';
import { CreateBadgeDto } from './dto/create-badge.dto';
import { ApiOperation, ApiTags, ApiOkResponse, ApiNotFoundResponse, ApiBadRequestResponse } from '@nestjs/swagger';

@ApiTags('Badge')
@Controller('badge')
export class BadgeController {
  constructor(private readonly badgeService: BadgeService) {}

  @ApiOperation({ summary: 'Criar nova badge' })
  @ApiOkResponse({ description: 'Badge criada com sucesso' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @Post()
  create(@Body() createBadgeDto: CreateBadgeDto) {
    return this.badgeService.create(createBadgeDto);
  }

  @ApiOperation({ summary: 'Listar todas as badges' })
  @ApiOkResponse({ description: 'Lista de badges retornada com sucesso' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @Get()
  findAll() {
    return this.badgeService.findAll();
  }

  @ApiOperation({ summary: 'Filtrar badge por id' })
  @ApiOkResponse({ description: 'Badge encontrada com sucesso' })
  @ApiNotFoundResponse({ description: 'Badge não encontrada' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.badgeService.findOne(id);
  }

  @ApiOperation({ summary: 'Atualizar badge específica' })
  @ApiOkResponse({ description: 'Badge atualizada com sucesso' })
  @ApiNotFoundResponse({ description: 'Badge não encontrada' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @Patch(':id')
  update(@Param('id') id: string, @Body() data: CreateBadgeDto) {
    return this.badgeService.update(id, data);
  }

  @ApiOperation({ summary: 'Deletar badge específica' })
  @ApiOkResponse({ description: 'Badge deletada com sucesso' })
  @ApiNotFoundResponse({ description: 'Badge não encontrada' })
  @ApiBadRequestResponse({ description: 'Requisição inválida' })
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.badgeService.remove(id);
  }
}

