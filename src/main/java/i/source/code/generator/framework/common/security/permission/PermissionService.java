package i.source.code.generator.framework.common.security.permission;

/**
 * 权限验证服务接口
 * @author Go
 * @since 2024
 */
public interface PermissionService {

    /**
     * 验证是否有指定权限
     * @param permission 权限描述
     *
     * @return 有权限返回true，否则返回false
     *
     * @author Go
     */
    boolean hasPermission(String permission);

}
