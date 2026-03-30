# 2026-03-29 12:11:01
CREATE TABLE IF NOT EXISTS `voiceAssistant`.`todos` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `created_at` DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `deleted_at` DATETIME(3) DEFAULT NULL,
  `title` VARCHAR(255) NOT NULL,
  `content` TEXT,
  `status` VARCHAR(20) DEFAULT 'pending',
  `source` VARCHAR(50),
  `meeting_id` BIGINT UNSIGNED,
  INDEX `idx_deleted_at` (`deleted_at`),
  INDEX `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
# 2026-03-29 12:11:02
CREATE TABLE IF NOT EXISTS `voiceAssistant`.`knowledge` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `created_at` DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` DATETIME(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `deleted_at` DATETIME(3) DEFAULT NULL,
  `title` VARCHAR(255) NOT NULL,
  `content` TEXT NOT NULL,
  `category` VARCHAR(100),
  `source` VARCHAR(50),
  `vector_id` VARCHAR(255),
  INDEX `idx_deleted_at` (`deleted_at`),
  INDEX `idx_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
# 2026-03-29 12:12:31
CREATE TABLE `voiceAssistant`.`todos` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',

    -- ==================== 业务字段区域 ====================
    `title` VARCHAR(255) NOT NULL COMMENT '待办标题',
    `content` TEXT COMMENT '待办内容',
    `status` VARCHAR(20) NOT NULL DEFAULT 'pending' COMMENT '状态：pending-待完成、completed-已完成',
    `source` VARCHAR(50) COMMENT '来源：voice-语音、manual-手动',
    `meeting_id` BIGINT UNSIGNED COMMENT '关联会议ID',
    -- ====================================================

    -- ================== 标准审计字段（固定不变）====================
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL COMMENT '修改时间',
    `deleted_at` DATETIME NULL COMMENT '软删除时间',
    `create_by` BIGINT UNSIGNED DEFAULT 0 NOT NULL COMMENT '创建人ID',
    `create_by_name` VARCHAR(20) DEFAULT '系统' NOT NULL COMMENT '创建人姓名',
    `update_by` BIGINT UNSIGNED DEFAULT 0 NOT NULL COMMENT '修改人ID',
    `update_by_name` VARCHAR(20) DEFAULT '系统' NOT NULL COMMENT '修改人姓名',
    -- ============================================================

    INDEX `idx_created_at` (`created_at`),
    INDEX `idx_deleted_at` (`deleted_at`),
    INDEX `idx_status` (`status`),
    INDEX `idx_meeting_id` (`meeting_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='待办事项表';
# 2026-03-29 12:12:39
CREATE TABLE `voiceAssistant`.`knowledge` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',

    -- ==================== 业务字段区域 ====================
    `title` VARCHAR(255) NOT NULL COMMENT '知识标题',
    `content` TEXT NOT NULL COMMENT '知识内容',
    `category` VARCHAR(100) COMMENT '分类：business-业务、technical-技术等',
    `source` VARCHAR(50) COMMENT '来源：voice-语音、manual-手动',
    `vector_id` VARCHAR(255) COMMENT 'Milvus向量数据库ID',
    -- ====================================================

    -- ================== 标准审计字段（固定不变）====================
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL COMMENT '修改时间',
    `deleted_at` DATETIME NULL COMMENT '软删除时间',
    `create_by` BIGINT UNSIGNED DEFAULT 0 NOT NULL COMMENT '创建人ID',
    `create_by_name` VARCHAR(20) DEFAULT '系统' NOT NULL COMMENT '创建人姓名',
    `update_by` BIGINT UNSIGNED DEFAULT 0 NOT NULL COMMENT '修改人ID',
    `update_by_name` VARCHAR(20) DEFAULT '系统' NOT NULL COMMENT '修改人姓名',
    -- ============================================================

    INDEX `idx_created_at` (`created_at`),
    INDEX `idx_deleted_at` (`deleted_at`),
    INDEX `idx_category` (`category`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='知识库表';
