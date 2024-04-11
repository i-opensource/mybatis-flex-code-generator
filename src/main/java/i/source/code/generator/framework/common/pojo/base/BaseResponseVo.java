package i.source.code.generator.framework.common.pojo.base;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 基础响应对象vo
 * @author Go
 * @since 2024
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BaseResponseVo implements Serializable {

    /**
     * 状态
     */
    private Integer status;

    /**
     * 顺序
     */
    private Integer showOrder;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 创建人id
     */
    private Long createUserId;

    /**
     * 创建人
     */
    private String createUser;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 更新人id
     */
    private Long updateUserId;

    /**
     * 更新人
     */
    private String updateUser;

}
