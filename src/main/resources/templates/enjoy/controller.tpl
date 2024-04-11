#set(tableComment = table.getComment())
#set(entityClassName = table.buildEntityClassName())
#set(entityVarName = firstCharToLowerCase(entityClassName))
#set(serviceVarName = firstCharToLowerCase(table.buildServiceClassName()))
#set(authorizeName = camelToUnderline(entityClassName).replace("_", ":"))
package #(packageConfig.controllerPackage);

import i.source.code.generator.framework.common.pojo.base.BooleanObj;
import i.source.code.generator.framework.common.pojo.base.IdObj;
import i.source.code.generator.framework.common.web.WebResult;
import i.source.code.generator.framework.dao.mybatis.base.PageData;

import #(packageConfig.basePackage).vo.#(entityClassName)EditVo;
import #(packageConfig.basePackage).vo.#(entityClassName)ListVo;
import #(packageConfig.basePackage).vo.#(entityClassName)RequestVo;

import jakarta.validation.Valid;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import #(packageConfig.servicePackage).#(table.buildServiceClassName());
#if(controllerConfig.restStyle)
import org.springframework.web.bind.annotation.RestController;
#else
import org.springframework.stereotype.Controller;
#end
#if(controllerConfig.superClass != null)
import #(controllerConfig.buildSuperClassImport());
#end
#if(withSwagger && swaggerVersion.getName() == "FOX")
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
#end
#if(withSwagger && swaggerVersion.getName() == "DOC")
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
#end

import lombok.RequiredArgsConstructor;

/**
 * #(tableComment)接口
 *
 * @author #(javadocConfig.getAuthor())
 * @since #(javadocConfig.getSince())
 */
#if(controllerConfig.restStyle)
@RestController
#else
@Controller
#end
#if(withSwagger && swaggerVersion.getName() == "FOX")
@Api("#(tableComment)")
#end
#if(withSwagger && swaggerVersion.getName() == "DOC")
@Tag(name = "#(tableComment)接口")
#end
@RequestMapping("/#(camelToUnderline(entityClassName).replace("_", "/"))/#(camelToUnderline(entityClassName).replace("_", "-"))")
@RequiredArgsConstructor
public class #(table.buildControllerClassName()) #if(controllerConfig.superClass)extends #(controllerConfig.buildSuperClassName()) #end {

    private final #(table.buildServiceClassName()) #(serviceVarName);

    /**
     * 分页查询#(tableComment)
     *
     * @param requestVo 分页参数
     * @return 分页对象
     *
     * @author Go #(javadocConfig.getSince())
     */
    @GetMapping("page")
    #if(withSwagger && swaggerVersion.getName() == "FOX")
    @ApiOperation("分页查询#(tableComment)")
    #end
    #if(withSwagger && swaggerVersion.getName() == "DOC")
    @Operation(description="分页查询#(tableComment)")
    #end
    @PreAuthorize("@permission.hasPermission('#(authorizeName):query')")
    public WebResult<PageData<#(entityClassName)ListVo>> page#(entityClassName)(@RequestBody #if(withSwagger && swaggerVersion.getName() == "FOX")@ApiParam("分页信息") #end #if(withSwagger && swaggerVersion.getName() == "DOC")@Parameter(description="分页信息")#end final #(entityClassName)RequestVo requestVo) {
        return WebResult.success(#(serviceVarName).page#(entityClassName)(requestVo));
    }

    /**
     * 添加#(tableComment)
     *
     * @param editVo #(tableComment)
     * @return {@code IdObj} 主键ID
     *
     * @author Go #(javadocConfig.getSince())
     */
    @PostMapping("/create")
    #if(withSwagger && swaggerVersion.getName() == "FOX")
    @ApiOperation("添加#(tableComment)")
    #end
    #if(withSwagger && swaggerVersion.getName() == "DOC")
    @Operation(description="添加#(tableComment)")
    #end
    @PreAuthorize("@permission.hasPermission('#(authorizeName):create')")
    public WebResult<IdObj> create#(entityClassName)(@RequestBody @Valid #if(withSwagger && swaggerVersion.getName() == "FOX")@ApiParam("#(tableComment) Edit Vo") #end #if(withSwagger && swaggerVersion.getName() == "DOC")@Parameter(description="#(tableComment) Edit Vo")#end final #(entityClassName)EditVo editVo) {
        return WebResult.success(new IdObj(#(serviceVarName).create#(entityClassName)(editVo)));
    }

    /**
     * 更新#(tableComment)
     *
     * @param editVo #(tableComment)
     * @return {@code IdObj} 主键ID
     *
     * @author Go #(javadocConfig.getSince())
     */
    @PutMapping("/update")
    #if(withSwagger && swaggerVersion.getName() == "FOX")
    @ApiOperation("更新#(tableComment)")
    #end
    #if(withSwagger && swaggerVersion.getName() == "DOC")
    @Operation(description="更新#(tableComment)")
    #end
    @PreAuthorize("@permission.hasPermission('#(authorizeName):update')")
    public WebResult<IdObj> update#(entityClassName)(@RequestBody @Valid #if(withSwagger && swaggerVersion.getName() == "FOX")@ApiParam("#(tableComment) Edit Vo") #end #if(withSwagger && swaggerVersion.getName() == "DOC")@Parameter(description="#(tableComment) Edit Vo")#end final #(entityClassName)EditVo editVo) {
        return WebResult.success(new IdObj(#(serviceVarName).update#(entityClassName)(editVo)));
    }

    /**
     * 获取#(tableComment)详情
     *
     * @param id 主键ID
     * @return #(tableComment)详情
     *
     * @author Go #(javadocConfig.getSince())
     */
    @GetMapping("/get")
    #if(withSwagger && swaggerVersion.getName() == "FOX")
    @ApiOperation("获取#(tableComment)详情")
    #end
    #if(withSwagger && swaggerVersion.getName() == "DOC")
    @Operation(description="获取#(tableComment)详情")
    #end
    @PreAuthorize("@permission.hasPermission('#(authorizeName):get')")
    public WebResult<#(entityClassName)EditVo> get#(entityClassName)EditVo(@RequestParam("id") #if(withSwagger && swaggerVersion.getName() == "FOX")@ApiParam("#(tableComment)主键") #if(withSwagger && swaggerVersion.getName() == "DOC")@Parameter(description="#(tableComment)主键")#end#end final Long id) {
        return WebResult.success(#(serviceVarName).get#(entityClassName)EditVo(id));
    }

    /**
     * 删除#(tableComment)
     *
     * @param id 主键
     * @return {@code True}成功 {@code False}失败
     *
     * @author Go #(javadocConfig.getSince())
     */
    @DeleteMapping("/delete")
    #if(withSwagger && swaggerVersion.getName() == "FOX")
    @ApiOperation("删除#(tableComment)")
    #end
    #if(withSwagger && swaggerVersion.getName() == "DOC")
    @Operation(description="删除#(tableComment)")
    #end
    @PreAuthorize("@permission.hasPermission('#(authorizeName):delete')")
    public WebResult<BooleanObj> delete#(entityClassName)(@RequestParam("id") #if(withSwagger && swaggerVersion.getName() == "FOX")@ApiParam("#(tableComment)主键") #end #if(withSwagger && swaggerVersion.getName() == "DOC")@Parameter(description="#(tableComment)主键")#end final Long id) {
        return WebResult.success(new BooleanObj(#(serviceVarName).delete#(entityClassName)(id)));
    }

}