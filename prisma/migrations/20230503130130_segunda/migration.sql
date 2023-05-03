/*
  Warnings:

  - Added the required column `categoriaId` to the `podutos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `podutos` ADD COLUMN `categoriaId` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `fornecedores` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(20) NOT NULL,
    `cnpj` DECIMAL(65, 30) NOT NULL,
    `createdAt` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,

    UNIQUE INDEX `fornecedores_cnpj_key`(`cnpj`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `categorias` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_FornecedoresToProduto` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_FornecedoresToProduto_AB_unique`(`A`, `B`),
    INDEX `_FornecedoresToProduto_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `podutos` ADD CONSTRAINT `podutos_categoriaId_fkey` FOREIGN KEY (`categoriaId`) REFERENCES `categorias`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_FornecedoresToProduto` ADD CONSTRAINT `_FornecedoresToProduto_A_fkey` FOREIGN KEY (`A`) REFERENCES `fornecedores`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_FornecedoresToProduto` ADD CONSTRAINT `_FornecedoresToProduto_B_fkey` FOREIGN KEY (`B`) REFERENCES `podutos`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
