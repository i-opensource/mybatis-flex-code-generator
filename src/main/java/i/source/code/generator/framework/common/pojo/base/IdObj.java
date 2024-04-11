package i.source.code.generator.framework.common.pojo.base;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 简单类型对象
 * @author Go
 * @since 2024
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class IdObj implements Serializable {

    private Long id;

}
