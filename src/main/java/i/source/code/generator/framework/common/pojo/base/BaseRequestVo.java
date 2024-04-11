package i.source.code.generator.framework.common.pojo.base;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 基础请求对象vo
 * @author Go
 * @since 2024
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BaseRequestVo implements Serializable {

    /**
     * 页码
     */
    private Integer pageNum;

    /**
     * 每页条数
     */
    private Integer pageSize;

    public Integer getPageNum() {
        if(pageNum == null || pageNum < 1) {
            pageNum = 1;
        }

        return pageNum;
    }

    public Integer getPageSize() {
        if(pageSize == null || pageSize < 1) {
            pageSize = 20;
        }

        return pageSize;
    }

}
