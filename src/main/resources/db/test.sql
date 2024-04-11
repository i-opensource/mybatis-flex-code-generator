create database `mybatis_flex_code_generator` default character set utf8mb4 collate utf8mb4_0900_ai_ci;

CREATE TABLE mybatis_flex_code_generator.i_sys_user
(
    `id`              BIGINT auto_increment   NOT NULL COMMENT '主键',
    `account`         VARCHAR(60)             NOT NULL comment '账号',
    `password`        varchar(100)            not null comment '密码',
    `real_name`       varchar(20)             not null default '' comment '姓名',
    `mobile`          varchar(11)             not null default '' comment '手机号',
    `email`           varchar(100)            not null default '' comment '邮箱',
    `sex`             enum ('男','女','保密') not null default '保密' comment '性别',
    `birthday`        date                    not null default '1990-01-01' comment '生日',
    `last_login_time` datetime                not null default current_timestamp comment '上次登录时间',
    `last_login_ip`   varchar(50)             not null default '' comment '上次登录Ip',
    `status`          tinyint                 not null default '1' comment '状态',
    `create_time`     datetime                not null default current_timestamp comment '创建时间',
    `create_user_id`  bigint                  not null default '0' comment '创建人id',
    `create_user`     varchar(20)             not null default '' comment '创建人',
    `update_time`     datetime                not null default current_timestamp on update current_timestamp comment '更新时间',
    `update_user_id`  bigint                  not null default '0' comment '更新人id',
    `update_user`     varchar(20)             not null default '' comment '更新人',
    `del`             tinyint                 not null default '0' comment '删除标记',
    `show_order`      int                     not null default '100' comment '顺序号',
    `remarks`         varchar(255)            not null default '' comment '备注',
    primary key (`id`),
    unique key uniq_account (`account`)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;