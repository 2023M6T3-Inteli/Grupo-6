/*
  Warnings:

  - You are about to drop the `_UserHardSkills` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_UserSoftSkills` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `hard_skills` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `soft_skills` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_UserHardSkills" DROP CONSTRAINT "_UserHardSkills_A_fkey";

-- DropForeignKey
ALTER TABLE "_UserHardSkills" DROP CONSTRAINT "_UserHardSkills_B_fkey";

-- DropForeignKey
ALTER TABLE "_UserSoftSkills" DROP CONSTRAINT "_UserSoftSkills_A_fkey";

-- DropForeignKey
ALTER TABLE "_UserSoftSkills" DROP CONSTRAINT "_UserSoftSkills_B_fkey";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "projects" TEXT;

-- DropTable
DROP TABLE "_UserHardSkills";

-- DropTable
DROP TABLE "_UserSoftSkills";

-- DropTable
DROP TABLE "hard_skills";

-- DropTable
DROP TABLE "soft_skills";
