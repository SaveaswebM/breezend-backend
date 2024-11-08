-- CreateEnum
CREATE TYPE "UserType" AS ENUM ('Superadmin', 'Admin', 'User');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT,
    "email" TEXT NOT NULL,
    "password" TEXT,
    "userType" "UserType" NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pages" (
    "id" SERIAL NOT NULL,
    "title" TEXT,
    "url" TEXT,
    "parent" TEXT,
    "custom_css" TEXT,
    "show_in_root_sitemap" INTEGER,
    "sitemap" INTEGER,
    "separate_siteMap" INTEGER,
    "is_blog" INTEGER,
    "meta_tags" INTEGER,
    "link_canonicals" INTEGER,
    "open_graph" INTEGER,
    "twitter_tags" INTEGER,
    "script_code" INTEGER,
    "link_canonical" TEXT,
    "script_code_url" TEXT,
    "status" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "Pages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Meta_tags" (
    "id" SERIAL NOT NULL,
    "page_id" INTEGER NOT NULL,
    "meta_title" TEXT,
    "meta_desc" TEXT,
    "meta_key" TEXT,

    CONSTRAINT "Meta_tags_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Open_graph" (
    "id" SERIAL NOT NULL,
    "page_id" INTEGER NOT NULL,
    "title" TEXT,
    "image" TEXT,
    "url" TEXT,
    "description" TEXT,
    "type" TEXT,

    CONSTRAINT "Open_graph_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tweeter_tags" (
    "id" SERIAL NOT NULL,
    "page_id" INTEGER NOT NULL,
    "title" TEXT,
    "image" TEXT,
    "url" TEXT,
    "description" TEXT,
    "card" TEXT,

    CONSTRAINT "Tweeter_tags_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "Meta_tags_page_id_idx" ON "Meta_tags"("page_id");

-- CreateIndex
CREATE INDEX "Open_graph_page_id_idx" ON "Open_graph"("page_id");

-- CreateIndex
CREATE INDEX "Tweeter_tags_page_id_idx" ON "Tweeter_tags"("page_id");

-- AddForeignKey
ALTER TABLE "Meta_tags" ADD CONSTRAINT "Meta_tags_page_id_fkey" FOREIGN KEY ("page_id") REFERENCES "Pages"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Open_graph" ADD CONSTRAINT "Open_graph_page_id_fkey" FOREIGN KEY ("page_id") REFERENCES "Pages"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tweeter_tags" ADD CONSTRAINT "Tweeter_tags_page_id_fkey" FOREIGN KEY ("page_id") REFERENCES "Pages"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
