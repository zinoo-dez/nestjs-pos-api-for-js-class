import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CategoriesModule } from './categories/categories.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ProductsModule } from './products/products.module';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './user/user.module';
import { UsersService } from './user/user.service';






@Module({
  imports: [
    // ConfigModule.forRoot(),
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost',
      port: 3306,
      username: 'root',
      password: '',
      database: 'pos_app',
      entities: [__dirname + '/**/*.entity{.ts,.js}'],
      synchronize: false, // Set to false
      logging: true,
    }),
    CategoriesModule,
    ProductsModule,
    AuthModule,
    UsersModule,
    ],
  controllers: [AppController],
  providers: [AppService, UsersService],
})
export class AppModule { }
