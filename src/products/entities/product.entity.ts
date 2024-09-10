// src/products/product.entity.ts
import { Category } from 'src/categories/entities/category.entity';
import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn, CreateDateColumn, UpdateDateColumn } from 'typeorm';


@Entity('products')
export class Product {
    @PrimaryGeneratedColumn()
    product_id: number;

    @Column({ length: 255 })
    name: string;

    @Column({ length: 255 })
    color: string;

    @Column({ type: 'text', nullable: true })
    description: string;

    @Column({ length: 50, unique: true })
    sku: string;

    @Column({ type: 'decimal' })
    price: number;

    @Column({ type: 'decimal' })
    cost: number;

    @Column({ type: 'int', default: 0 })
    quantity_in_stock: number;

    @Column({ type: 'int', nullable: false })
    category_id: number;

    @ManyToOne(() => Category, (category) => category.category_id, { onDelete: 'SET NULL' })
    @JoinColumn({ name: 'category_id' })
    category: Category;

    @CreateDateColumn({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    created_at: Date;

    @UpdateDateColumn({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP', onUpdate: 'CURRENT_TIMESTAMP' })
    updated_at: Date;
}
