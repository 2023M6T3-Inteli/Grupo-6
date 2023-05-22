import { Module } from '@nestjs/common';
import {PostModule} from './post/post.module'
import { ProjectModule } from './project/project.module';


@Module({
  imports: [PostModule, ProjectModule]
  
})
export class AppModule {}
