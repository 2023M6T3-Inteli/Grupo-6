-- CreateTable
CREATE TABLE "hard_skills" (
    "id" TEXT NOT NULL,
    "hard_skill" TEXT NOT NULL,

    CONSTRAINT "hard_skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "soft_skills" (
    "id" TEXT NOT NULL,
    "soft_skill" TEXT NOT NULL,

    CONSTRAINT "soft_skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_UserHardSkills" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_UserSoftSkills" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_UserHardSkills_AB_unique" ON "_UserHardSkills"("A", "B");

-- CreateIndex
CREATE INDEX "_UserHardSkills_B_index" ON "_UserHardSkills"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_UserSoftSkills_AB_unique" ON "_UserSoftSkills"("A", "B");

-- CreateIndex
CREATE INDEX "_UserSoftSkills_B_index" ON "_UserSoftSkills"("B");

-- AddForeignKey
ALTER TABLE "_UserHardSkills" ADD CONSTRAINT "_UserHardSkills_A_fkey" FOREIGN KEY ("A") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserHardSkills" ADD CONSTRAINT "_UserHardSkills_B_fkey" FOREIGN KEY ("B") REFERENCES "hard_skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserSoftSkills" ADD CONSTRAINT "_UserSoftSkills_A_fkey" FOREIGN KEY ("A") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserSoftSkills" ADD CONSTRAINT "_UserSoftSkills_B_fkey" FOREIGN KEY ("B") REFERENCES "soft_skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;
