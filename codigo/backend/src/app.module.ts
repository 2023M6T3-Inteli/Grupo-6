import { Module } from '@nestjs/common';
import {PostModule} from './post/post.module'
import { UserModule } from './user/user.module';
// import { ProjectModule } from './project/project.module';
import { BadgeModule } from './badge/badge.module';
import { LoginModule } from './login/login.module';


@Module({
  imports: [PostModule,UserModule,BadgeModule,BadgeModule]
  
})
export class AppModule {}
