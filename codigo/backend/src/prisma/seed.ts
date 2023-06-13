//@ts-ignore
import { PrismaService } from '../prisma.service';

const prisma = new PrismaService();

async function main() {

    // await prisma.user.create({
    //     data: {
    //         name: 'Victor Carvalho',
    //         role: 'Software Engineer',
    //         about_me: 'I am a software engineer with a passion for learning and teaching. I love to work with people and I am always looking for new challenges.',
    //         photo_url: 'https://github.com/vict0rcarvalh0.png',
    //         email: 'victorcarvalho@gmail.com',
    //         password: '1234',
    //     },
    // }),

    // await prisma.user.create({
    //     data: {
    //         name: 'Mateus Neves',
    //         role: 'DevOps Engineer',
    //         about_me: 'I am a DevOps engineer with a passion for learning and teaching. I love to work with people and I am always looking for new challenges.',
    //         photo_url: 'https://github.com/MateusgGCN.png',
    //         email: 'mateusgcn@gmail.com',
    //         password: '1234',
    //     },
    // }),

    // await prisma.user.create({
    //     data: {
    //         name: 'Erik Freundt',
    //         role: 'CFO',
    //         about_me: 'I am a CFO with a passion for learning and teaching. I love to work with people and I am always looking for new challenges.',
    //         photo_url: 'https://github.com/kinhofreundt.png',
    //         email: 'kinho@gmail.com',
    //         password: '1234',
    //     },
    // }),

    // await prisma.user.create({
    //     data: {
    //         name: 'Priscila Falcão',
    //         role: 'Test Engineer',
    //         about_me: 'I am a test engineer with a passion for learning and teaching. I love to work with people and I am always looking for new challenges.',
    //         photo_url: 'https://github.com/PriscilaFalcao.png',
    //         email: 'prifalcao@gmail.com',
    //         password: '1234',
    //     },
    // }),

    // await prisma.user.create({
    //     data: {
    //         name: 'Sofia Pimazzoni',
    //         role: 'Data Engineer',
    //         about_me: 'I am a data engineer with a passion for learning and teaching. I love to work with people and I am always looking for new challenges.',
    //         photo_url: 'https://github.com/sofipimazzoni.png',
    //         email: 'sofi@gmail.com',
    //         password: '1234',
    //     },
    // });

    var now = new Date();
    var date = now.toLocaleDateString();
    await prisma.post.create({
        data: {
            title: "Introdução à programação",
            description: "Um guia básico sobre como começar a programar",
            category: "Tecnologia",
            createdAt: date,
            creator: "04db46af-6058-4d42-9aac-a0b97d0e4068"
          }
    }),

    await prisma.post.create({
        data: {
            title: "As tendências da inteligência artificial",
            description: "Descubra as últimas tendências em IA e seu impacto na sociedade",
            category: "Tecnologia",
            createdAt: date,
            creator: "d56f9ba4-a2fd-4be7-8a9a-22ee7b89c390"
          }
    }),

    await prisma.post.create({
        data: {
            title: "Dicas para melhorar a segurança online",
            description: "Medidas importantes para proteger sua privacidade na internet",
            category: "Tecnologia",
            createdAt: date,
            creator: "d7629930-585a-4c8c-92d9-7ccc00c203b5",
          }
    }),

    await prisma.post.create({
        data: {
            title: "A importância da computação em nuvem",
            description: "Como a computação em nuvem está transformando a indústria de TI",
            category: "Tecnologia",
            createdAt: date,
            creator: "b9670406-2c59-4d50-99cb-200a5135e65d"
          }
    }),

    await prisma.post.create({
        data: {
            title: "O futuro da realidade virtual",
            description: "Explore as possibilidades emocionantes da tecnologia de realidade virtual",
            category: "Tecnologia",
            createdAt: date,
            creator: "62673d9c-2ab6-4873-b977-d972dcc2ca19"
          }
    }),

    await prisma.post.create({
        data: {
            title: "Construindo um aplicativo móvel do zero",
            description: "Um guia passo a passo para criar seu próprio aplicativo móvel",
            category: "Tecnologia",
            createdAt: date,
            creator: "62673d9c-2ab6-4873-b977-d972dcc2ca19"
          }
    });
}

// npx prisma db seed
// node --experimental-modules prisma/seed.mjs
main().then( async() => {
    await prisma.$disconnect();
}).catch(async (e) => {console.error(e)
    await prisma.$disconnect()
    process.exit(1);
});
