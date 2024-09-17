import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const config = new DocumentBuilder()
    .setTitle('Pos Api')
    .setDescription('The pos API description')
    .setVersion('1.0')
    .addTag('pos')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document, {
    jsonDocumentUrl: 'swagger/json',
  });
  // Enable CORS
  app.enableCors({
    origin: 'http://localhost:5173', // Replace with your frontend URL
    credentials: true,
  });
  await app.listen(4400, () => console.log("http://localhost:4400"));
}
bootstrap();
