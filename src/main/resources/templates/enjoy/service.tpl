#set(tableComment = table.getComment())
package #(packageConfig.servicePackage);

import #(serviceConfig.buildSuperClassImport());
import #(packageConfig.entityPackage).#(table.buildEntityClassName());
import #(packageConfig.basePackage).vo.#(table.buildEntityClassName())EditVo;
import #(packageConfig.basePackage).vo.#(table.buildEntityClassName())ListVo;
import #(packageConfig.basePackage).vo.#(table.buildEntityClassName())RequestVo;

import i.source.code.generator.framework.common.util.IdUtil;
import i.source.code.generator.framework.dao.mybatis.base.PageData;

/**
 * #(tableComment)服务层
 *
 * @author #(javadocConfig.getAuthor())
 * @since #(javadocConfig.getSince())
 */
public interface #(table.buildServiceClassName()) extends #(serviceConfig.buildSuperClassName())<#(table.buildEntityClassName())> {

    /**
     * 分页查询#(tableComment)
     * @param requestVo 参数
     *
     * @return i.source.code.generator.framework.common.web.PageData<#(packageConfig.basePackage).vo.#(table.buildEntityClassName())RequestVo> 分页列表
     *
     * @author Go #(javadocConfig.getSince())
     */
    PageData<#(table.buildEntityClassName())ListVo> page#(table.buildEntityClassName())(#(table.buildEntityClassName())RequestVo requestVo);

    /**
     * 添加#(tableComment)
     * @param editVo #(tableComment)参数
     *
     * @return java.lang.Long 主键ID
     *
     * @author Go #(javadocConfig.getSince())
     *
     */
    Long create#(table.buildEntityClassName())(#(table.buildEntityClassName())EditVo editVo);

    /**
     * 更新#(tableComment)
     * @param editVo #(tableComment)参数
     *
     * @return java.lang.Long 主键ID
     *
     * @author Go #(javadocConfig.getSince())
     */
    Long update#(table.buildEntityClassName())(#(table.buildEntityClassName())EditVo editVo);

    /**
     * 获取#(tableComment)
     * @param id 主键ID
     *
     * @return #(tableComment)EditVo
     *
     * @author Go #(javadocConfig.getSince())
     */
    #(table.buildEntityClassName())EditVo get#(table.buildEntityClassName())EditVo(Long id);

    /**
     * 删除#(tableComment)
     * @param id 主键id
     *
     * @return java.lang.Boolean
     *
     * @author Go #(javadocConfig.getSince())
     */
    Boolean delete#(table.buildEntityClassName())(Long id);

}
