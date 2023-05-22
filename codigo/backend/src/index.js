const {PrismaClient} = require('@prisma/client')

const prisma = new PrismaClient()

async function main() {
    const updatedUser = await prisma.user.update({
        where: { id: "537ab60c-dd46-4080-be07-d9805330d5ba"},
        data: {
            soft_skills: {
            connect: {
              id: "26e6a424-6730-4f78-a481-3207c440e9d1",
            },
          },
        },
        include: {
            soft_skills: true,
        },
      });
    console.log(updatedUser);
}

async function main2() {
    const user = await prisma.user.findUnique({
        where: { id: "537ab60c-dd46-4080-be07-d9805330d5ba" },
        include: { badges: true, soft_skills: true, hard_skills: true, posts: true},
      });
      
      console.log(user);
      
}

async function main3() {
    const post = await prisma.post.create({
        data: {
            title: "Prisma makes databases easy",
            description: "quero so ver se o prisma é melhor que o typeorm",
            category: "tech",
            creator: "537ab60c-dd46-4080-be07-d9805330d5ba"
        },
        include: {
            author: true,
          }
    });
}

async function main4() {
    const hard_skills = await prisma.hard_skills.create({
        data: {
            hard_skill: "react"
        }
    })
    console.log(hard_skills)
}


async function main5() {
    const soft_skills = await prisma.soft_skills.create({
        data: {
            soft_skill: "comunicação"
        }
    })
    console.log(soft_skills)
}

async function  main6(){
    const createUser = await prisma.user.create({
        data: {
            name: "joao",
            role: "dev",
            email: "joao@gmail.com",
            password: "123456",
            projects: "1,2,3"
        }
    });
    console.log(createUser)
}


main6()

