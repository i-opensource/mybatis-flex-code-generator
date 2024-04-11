package i.source.code.generator.framework.dao.mybatis.base;

import com.mybatisflex.core.paginate.Page;
import lombok.Data;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

/**
 * 分页数据
 * @author Go
 * @since 2024
 */
@Data
public class PageData<T> implements Serializable {

    /**
     * 数据集
     */
    private List<T> rows;

    /**
     * 总记录数
     */
    private Integer total;

    public PageData(List<T> rows, Integer total) {
        this.rows = rows;
        this.total = total;
    }

    public static <T> PageData<T> of(Page<T> page) {
        if(page == null) {
            return new PageData<>(Collections.EMPTY_LIST, 0);
        }

        return new PageData<>(page.getRecords(), (int) page.getTotalRow());
    }

    /**
     * 对分页数据进行处理
     * @param page 分页数据
     * @param c 处理函数
     *
     * @return 分页数据
     *
     * @author Go
     */
    public static <T> PageData<T> of(Page<T> page, Consumer<T> c) {
        PageData<T> pageData = of(page);
        pageData.getRows().forEach(c);
        return pageData;
    }

    /**
     * 对分页数据进行转换
     * @param page 分页数据
     * @param f 转换函数
     *
     * @return 分页数据
     *
     * @author Go
     */
    public static <T, R> PageData<T> of(Page<T> page, Function<T, R> f) {
        PageData<T> pageData = of(page);
        pageData.getRows().forEach(f::apply);
        return pageData;
    }

}
