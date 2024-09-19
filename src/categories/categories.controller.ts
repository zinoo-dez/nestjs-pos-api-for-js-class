import { Controller, Get, Post, Put, Delete, Param, Body, ParseIntPipe, Query, UseGuards } from '@nestjs/common';
import { CategoriesService } from './categories.service';
import { Category } from './entities/category.entity';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { ApiResponse } from '@nestjs/swagger';
import { AuthGuard } from '@nestjs/passport';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';

@Controller('categories')
export class CategoriesController {
  constructor(private readonly categoriesService: CategoriesService) { }

  // @UseGuards(JwtAuthGuard)
  @Get()
  @ApiResponse({ status: 200, description: 'List all categories' })
  async findAll(
    @Query('page') page: number = 1,
    @Query('limit') limit: number = 10,
    @Query('search') search?: string
  ): Promise<Category[]> {
    return this.categoriesService.findAll({ page, limit, search });
  }

  @Get(':id')
  @ApiResponse({ status: 200, description: 'Get a category by ID' })
  async findOne(@Param('id', ParseIntPipe) id: number): Promise<Category> {
    return this.categoriesService.findOne(id);
  }

  @Post()
  @ApiResponse({ status: 201, description: 'Create a new category' })
  async create(@Body() createCategoryDto: CreateCategoryDto): Promise<Category> {
    return this.categoriesService.create(createCategoryDto);
  }

  @Put(':id')
  @ApiResponse({ status: 200, description: 'Update a category' })
  async update(
    @Param('id', ParseIntPipe) id: number,
    @Body() updateCategoryDto: UpdateCategoryDto
  ): Promise<Category> {
    return this.categoriesService.update(id, updateCategoryDto);
  }
  @Delete(':id')
  @ApiResponse({ status: 204, description: 'Delete a category' })
  async remove(@Param('id', ParseIntPipe) id: number): Promise<{ message: string; }> {
    return this.categoriesService.remove(id);
  }

}
