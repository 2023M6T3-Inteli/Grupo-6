import { NestFactory } from '@nestjs/core';
import { AppModule } from './module/app.module';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  
  const config = new DocumentBuilder()
    .setTitle('CloudETS API Documentation')
    .setDescription('The CloudETS API description')
    .setVersion('1.0')
    .addTag('CloudETS')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);
  
  await app.listen(3000);
}
bootstrap();
