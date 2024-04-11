package i.source.code.generator.framework.dao.mybatis.base;

import com.mybatisflex.spring.service.impl.ServiceImpl;

/**
 * 基础服务实现类
 *
 * @author Go
 * @since 2024
 */
public class MyBatisBaseServiceImpl<M extends MyBatisBaseMapper<T>, T> extends ServiceImpl<M, T> implements MyBatisBaseService<T> {
}
