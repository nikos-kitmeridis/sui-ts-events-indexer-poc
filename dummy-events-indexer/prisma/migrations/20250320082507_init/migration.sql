-- CreateTable
CREATE TABLE "Dummy" (
    "dbId" TEXT NOT NULL,
    "prop1" TEXT NOT NULL,

    CONSTRAINT "Dummy_pkey" PRIMARY KEY ("dbId")
);

-- CreateTable
CREATE TABLE "InitEvent" (
    "dbId" TEXT NOT NULL,
    "prop1" TEXT NOT NULL,
    "prop2" TEXT NOT NULL,
    "prop3" BOOLEAN NOT NULL,
    "prop4" TEXT NOT NULL,
    "prop5" INTEGER[],
    "prop6" JSONB NOT NULL,

    CONSTRAINT "InitEvent_pkey" PRIMARY KEY ("dbId")
);

-- CreateTable
CREATE TABLE "TriggerEvent" (
    "dbId" TEXT NOT NULL,
    "prop1" TEXT NOT NULL,
    "prop2" TEXT NOT NULL,

    CONSTRAINT "TriggerEvent_pkey" PRIMARY KEY ("dbId")
);

-- CreateTable
CREATE TABLE "cursor" (
    "id" TEXT NOT NULL,
    "eventSeq" TEXT NOT NULL,
    "txDigest" TEXT NOT NULL,

    CONSTRAINT "cursor_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Dummy_dbId_key" ON "Dummy"("dbId");

-- CreateIndex
CREATE UNIQUE INDEX "InitEvent_dbId_key" ON "InitEvent"("dbId");

-- CreateIndex
CREATE UNIQUE INDEX "TriggerEvent_dbId_key" ON "TriggerEvent"("dbId");
