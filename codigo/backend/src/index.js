const {PrismaClient} = require('@prisma/client')

const prisma = new PrismaClient()

async function main() {
    const create = await prisma.badges.create({
        data: {
            picture: "teste",
            description: "teste",
            type: "teste",
            user_id: "537ab60c-dd46-4080-be07-d9805330d5ba"
        }
    })
    console.log(create)
}

main()

