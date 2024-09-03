// src/products/dto/create-product.dto.ts
import { IsNotEmpty, IsString, IsDecimal, IsInt, IsOptional } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateProductDto {
    @ApiProperty({ description: 'The name of the product', maxLength: 255 })
    @IsNotEmpty()
    @IsString()
    name: string;

    @ApiProperty({ description: 'The description of the product', required: false })
    @IsOptional()
    @IsString()
    description?: string;

    @ApiProperty({ description: 'The SKU of the product', maxLength: 50 })
    @IsNotEmpty()
    @IsString()
    sku: string;

    @ApiProperty({ description: 'The price of the product' })
    @IsNotEmpty()
    @IsDecimal()
    price: number;

    @ApiProperty({ description: 'The cost of the product' })
    @IsNotEmpty()
    @IsDecimal()
    cost: number;

    @ApiProperty({ description: 'The quantity of the product in stock', default: 0 })
    @IsNotEmpty()
    @IsInt()
    quantity_in_stock: number;

    @ApiProperty({ description: 'The ID of the category the product belongs to', required: false })
    @IsOptional()
    @IsInt()
    category_id?: number;
}

