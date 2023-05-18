export class CreatePostDto {
    id: string;
    title: string;
    description: string;
    category: string;
    createdAt: Date;
    creator_id: string;
}

// id            String @id @default(uuid())
// title         String
// description   String
// category      String
// createdAt     DateTime @default(now())
// creator_id    String
// creator User @relation(fields: [creator_id], references: [id])