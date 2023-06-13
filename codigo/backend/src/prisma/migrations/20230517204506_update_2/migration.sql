/*
  Warnings:

  - You are about to drop the column `badge_id` on the `User` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_badge_id_fkey";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "badge_id";
