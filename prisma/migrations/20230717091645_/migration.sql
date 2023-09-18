-- CreateTable
CREATE TABLE "student" (
    "id" TEXT NOT NULL,
    "name" TEXT,

    CONSTRAINT "student_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "classroom" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "classroom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "song" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "relation_album" INTEGER,

    CONSTRAINT "song_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "album" (
    "id" SERIAL NOT NULL,
    "year" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "mJson" JSONB DEFAULT '{"hello":"world"}',

    CONSTRAINT "album_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "user_type" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "system_panda_plugins" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "sourceCode" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL,

    CONSTRAINT "system_panda_plugins_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "system_panda_sessions" (
    "id" TEXT NOT NULL,
    "data" JSONB,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "relation_users" INTEGER,

    CONSTRAINT "system_panda_sessions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_classroomTostudent" (
    "A" INTEGER NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "album_title_key" ON "album"("title");

-- CreateIndex
CREATE INDEX "album_title_idx" ON "album"("title");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE INDEX "users_email_idx" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "system_panda_plugins_title_key" ON "system_panda_plugins"("title");

-- CreateIndex
CREATE UNIQUE INDEX "_classroomTostudent_AB_unique" ON "_classroomTostudent"("A", "B");

-- CreateIndex
CREATE INDEX "_classroomTostudent_B_index" ON "_classroomTostudent"("B");

-- AddForeignKey
ALTER TABLE "song" ADD CONSTRAINT "song_relation_album_fkey" FOREIGN KEY ("relation_album") REFERENCES "album"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "system_panda_sessions" ADD CONSTRAINT "system_panda_sessions_relation_users_fkey" FOREIGN KEY ("relation_users") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_classroomTostudent" ADD CONSTRAINT "_classroomTostudent_A_fkey" FOREIGN KEY ("A") REFERENCES "classroom"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_classroomTostudent" ADD CONSTRAINT "_classroomTostudent_B_fkey" FOREIGN KEY ("B") REFERENCES "student"("id") ON DELETE CASCADE ON UPDATE CASCADE;
