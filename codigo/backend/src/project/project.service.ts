// import { Injectable } from '@nestjs/common';
// import { CreateProjectDto } from './dto/create-project.dto';
// import { UpdateProjectDto } from './dto/update-project.dto';
// import { PrismaService } from 'src/prisma.service';

// @Injectable()
// export class ProjectService {
//   constructor(private prisma: PrismaService) {}

//   async create(createProjectDto: CreateProjectDto) {
//     const newProject = await this.prisma.post.create({
//       data: {
//         title: "la la la",
//         description: "lalala",
//         start_project: "20/05/2023",
//         end_project: "23/05/2023",
//         start_subscription: "10/05/2023",
//         end_subscription: "15/05/2023",
//         area: "lalala",
//         status: "lalala",
//       }
//     });
//   }

//   async findAll() {
//     const project = await this.prisma.project.findMany({})

//     return project;
//   }

//   async findById(id: string) {
//     const project = await this.prisma.project.findUnique({
//       where: { id: id },
//     })

//     return project;
//   }

//   async update(id: string, updateProjectDto: UpdateProjectDto) {
//     const project = await this.prisma.project.update({
//       where: { id: id },
//       data: updateProjectDto,
//     })

//     return project;
//   }

//   async delete(id: string) {
//     const project = await this.prisma.project.delete({
//       where: { id: id },
//     })

//     return project;
//   }
// }
