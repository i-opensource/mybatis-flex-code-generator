#set(isCacheExample = serviceImplConfig.cacheExample)
#set(primaryKey = table.getPrimaryKey())
#set(entityClassName = table.buildEntityClassName())
#set(entityVarName = firstCharToLowerCase(entityClassName))
package #(packageConfig.serviceImplPackage);

import #(serviceImplConfig.buildSuperClassImport());
import i.source.code.generator.framework.common.constant.exceptions.ServiceException;
import i.source.code.generator.framework.common.util.IdUtil;
import cn.hutool.core.bean.BeanUtil;
import i.source.code.generator.framework.dao.mybatis.base.PageData;
import #(packageConfig.basePackage).vo.#(entityClassName)EditVo;
import #(packageConfig.basePackage).vo.#(entityClassName)ListVo;
import #(packageConfig.basePackage).vo.#(entityClassName)RequestVo;
import #(packageConfig.entityPackage).#(entityClassName);
import #(packageConfig.mapperPackage).#(table.buildMapperClassName());
import #(packageConfig.servicePackage).#(table.buildServiceClassName());
import org.springframework.stereotype.Service;
import com.mybatisflex.core.paginate.Page;
import com.mybatisflex.core.query.QueryWrapper;

import java.util.Objects;
#if(isCacheExample)
import com.mybatisflex.core.paginate.Page;
import com.mybatisflex.core.query.QueryWrapper;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
#end

/**
 * #(table.getComment())服务层实现
 *
 * @author #(javadocConfig.getAuthor())
 * @since #(javadocConfig.getSince())
 */
@Service
#if(isCacheExample)
@CacheConfig(cacheNames = "#(firstCharToLowerCase(entityClassName))")
#end
public class #(table.buildServiceImplClassName()) extends #(serviceImplConfig.buildSuperClassName())<#(table.buildMapperClassName()), #(entityClassName)> implements #(table.buildServiceClassName()) {

    @Override
    public PageData<#(entityClassName)ListVo> page#(entityClassName)(#(entityClassName)RequestVo requestVo) {
        QueryWrapper wrapper = QueryWrapper.create()
                .eq(#(entityClassName)::getDel, 0)
                .orderBy(#(entityClassName)::getShowOrder, true);

        return PageData.of(pageAs(new Page<>(requestVo.getPageNum(), requestVo.getPageSize()), wrapper, #(entityClassName)ListVo.class));
    }

    @Override
    public Long create#(entityClassName)(#(entityClassName)EditVo editVo) {
        #(entityClassName) #(entityVarName) = BeanUtil.toBean(editVo, #(entityClassName).class);

        save(#(entityVarName));

        return #(entityVarName).getId();
    }

    @Override
    public Long update#(entityClassName)(#(entityClassName)EditVo editVo) {
        if(IdUtil.isNotId(editVo.getId())) {
            throw new ServiceException("参数不能为空");
        }

        #(entityClassName) #(entityVarName)InDb = getById(editVo.getId());
        Objects.requireNonNull(#(entityVarName)InDb, "数据不存在");

        if(Objects.equals(editVo.getDel(), 1)) {
            throw new ServiceException("数据已删除");
        }

        #(entityClassName) #(entityVarName) = BeanUtil.toBean(editVo, #(entityClassName).class);

        updateById(#(entityVarName));

        return #(entityVarName).getId();
    }

    @Override
    public #(entityClassName)EditVo get#(entityClassName)EditVo(Long id) {
        if(IdUtil.isNotId(id)) {
            throw new ServiceException("参数不能为空");
        }

        return BeanUtil.toBean(getById(id), #(entityClassName)EditVo.class);
    }

    @Override
    public Boolean delete#(entityClassName)(Long id) {
        if(IdUtil.isNotId(id)) {
            throw new ServiceException("参数不能为空");
        }

        #(entityClassName) #(entityVarName)InDb = getById(id);
        Objects.requireNonNull(#(entityVarName)InDb, "数据不存在");

        if(Objects.equals(#(entityVarName)InDb.getDel(), 1)) {
            throw new ServiceException("数据已删除");
        }

        #(entityClassName) #(entityVarName) = new #(entityClassName)();
        #(entityVarName).setId(id);
        #(entityVarName).setDel(1);

        return updateById(#(entityVarName));
    }

#if(isCacheExample)
    @Override
    @CacheEvict(allEntries = true)
    public boolean remove(QueryWrapper query) {
        return super.remove(query);
    }

    @Override
    @CacheEvict(key = "#id")
    public boolean removeById(Serializable id) {
        return super.removeById(id);
    }

    @Override
    @CacheEvict(allEntries = true)
    public boolean removeByIds(Collection<? extends Serializable> ids) {
        return super.removeByIds(ids);
    }

    @Override
    @CacheEvict(allEntries = true)
    public boolean update(#(entityClassName) entity, QueryWrapper query) {
        return super.update(entity, query);
    }

    @Override
    @CacheEvict(key = "#entity.#(primaryKey)")
    public boolean updateById(#(entityClassName) entity, boolean ignoreNulls) {
        return super.updateById(entity, ignoreNulls);
    }

    @Override
    @CacheEvict(allEntries = true)
    public boolean updateBatch(Collection<#(entityClassName)> entities, int batchSize) {
        return super.updateBatch(entities, batchSize);
    }

    @Override
    @Cacheable(key = "#id")
    public #(entityClassName) getById(Serializable id) {
        return super.getById(id);
    }

    @Override
    @Cacheable(key = "#root.methodName + ':' + #query.toSQL()")
    public #(entityClassName) getOne(QueryWrapper query) {
        return super.getOne(query);
    }

    @Override
    @Cacheable(key = "#root.methodName + ':' + #query.toSQL()")
    public <R> R getOneAs(QueryWrapper query, Class<R> asType) {
        return super.getOneAs(query, asType);
    }

    @Override
    @Cacheable(key = "#root.methodName + ':' + #query.toSQL()")
    public Object getObj(QueryWrapper query) {
        return super.getObj(query);
    }

    @Override
    @Cacheable(key = "#root.methodName + ':' + #query.toSQL()")
    public <R> R getObjAs(QueryWrapper query, Class<R> asType) {
        return super.getObjAs(query, asType);
    }

    @Override
    @Cacheable(key = "#root.methodName + ':' + #query.toSQL()")
    public List<Object> objList(QueryWrapper query) {
        return super.objList(query);
    }

    @Override
    @Cacheable(key = "#root.methodName + ':' + #query.toSQL()")
    public <R> List<R> objListAs(QueryWrapper query, Class<R> asType) {
        return super.objListAs(query, asType);
    }

    @Override
    @Cacheable(key = "#root.methodName + ':' + #query.toSQL()")
    public List<#(entityClassName)> list(QueryWrapper query) {
        return super.list(query);
    }

    @Override
    @Cacheable(key = "#root.methodName + ':' + #query.toSQL()")
    public <R> List<R> listAs(QueryWrapper query, Class<R> asType) {
        return super.listAs(query, asType);
    }

    /**
     * @deprecated 无法通过注解进行缓存操作。
     */
    @Override
    @Deprecated
    public List<#(entityClassName)> listByIds(Collection<? extends Serializable> ids) {
        return super.listByIds(ids);
    }

    @Override
    @Cacheable(key = "#root.methodName + ':' + #query.toSQL()")
    public long count(QueryWrapper query) {
        return super.count(query);
    }

    @Override
    @Cacheable(key = "#root.methodName + ':' + #page.getPageSize() + ':' + #page.getPageNumber() + ':' + #query.toSQL()")
    public <R> Page<R> pageAs(Page<R> page, QueryWrapper query, Class<R> asType) {
        return super.pageAs(page, query, asType);
    }

#end
}
