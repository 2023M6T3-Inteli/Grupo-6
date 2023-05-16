import { Module } from '@nestjs/common';
import {TypeOrmModule} from '@nestjs/typeorm';
import {Badges} from './entity/badges.entity'
import {BadgesModule} from './badges.module'

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'db-cloudets.ct9xbmzqp0ft.us-east-1.rds.amazonaws.com',
      port: 5432,
      username: 'postgres',
      password: 'cloudets123',
      database: 'postgres',
      entities: [Badges],
      synchronize: true,
    }),
    BadgesModule
  ],
  
})
export class AppModule {}
