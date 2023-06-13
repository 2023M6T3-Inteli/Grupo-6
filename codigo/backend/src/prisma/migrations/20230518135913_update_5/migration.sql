/*
  Warnings:

  - Added the required column `creator` to the `Post` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_id_fkey";

-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "creator" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_creator_fkey" FOREIGN KEY ("creator") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
