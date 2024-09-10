import { IsNotEmpty, IsString, Length } from 'class-validator';
import { Product } from 'src/products/entities/product.entity';
import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn, Unique, OneToMany } from 'typeorm';

@Entity('categories')
@Unique(['name'])
export class Category {
    @PrimaryGeneratedColumn()
    category_id: number;

    @Column({ length: 100, unique: true })
    @IsString()
    @IsNotEmpty()
    @Length(5, 100)
    name: string;

    @Column({ type: 'text', nullable: true })
    description: string;

    @OneToMany(() => Product, (product) => product.category)
    products: Product[]

    @CreateDateColumn({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    created_at: Date;

    @UpdateDateColumn({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP', onUpdate: 'CURRENT_TIMESTAMP' })
    updated_at: Date;
}

