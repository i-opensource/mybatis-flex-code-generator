package i.source.code.generator.framework.common.util;

/**
 * 辅助类
 * @author Go
 * @since 2024
 */
public class IdUtil {

    /**
     * 验证是否是数据库id
     * @param id id
     *
     * @return boolean
     *
     * @author Go
     */
    public static boolean isId(Long id) {
        return id != null && id > 0;
    }

    /**
     * 验证是否是数据库id
     * @param id id
     *
     * @return boolean
     *
     * @author Go
     */
    public static boolean isNotId(Long id) {
        return !isId(id);
    }

}
