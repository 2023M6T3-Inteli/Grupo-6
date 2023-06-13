/*
  Warnings:

  - You are about to drop the column `user_id` on the `Badges` table. All the data in the column will be lost.
  - You are about to drop the column `creator_id` on the `Post` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Badges" DROP CONSTRAINT "Badges_user_id_fkey";

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_creator_id_fkey";

-- AlterTable
ALTER TABLE "Badges" DROP COLUMN "user_id";

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "creator_id";

-- CreateTable
CREATE TABLE "_UserBadges" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_UserBadges_AB_unique" ON "_UserBadges"("A", "B");

-- CreateIndex
CREATE INDEX "_UserBadges_B_index" ON "_UserBadges"("B");

-- AddForeignKey
ALTER TABLE "_UserBadges" ADD CONSTRAINT "_UserBadges_A_fkey" FOREIGN KEY ("A") REFERENCES "Badges"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserBadges" ADD CONSTRAINT "_UserBadges_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
