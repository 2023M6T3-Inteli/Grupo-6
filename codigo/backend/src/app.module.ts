import { Module } from '@nestjs/common';
import {PostModule} from './post/post.module'
import { UserModule } from './user/user.module';
import { ProjectModule } from './project/project.module';


@Module({
  imports: [PostModule, ProjectModule,UserModule]
  
})
export class AppModule {}
