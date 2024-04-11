package i.source.code.generator.framework.common.security.permission.impl;

import i.source.code.generator.framework.common.security.permission.PermissionService;

/**
 * 权限验证服务实现
 * @author Go
 * @since 2024
 */
public class PermissionServiceImpl implements PermissionService {

    @Override
    public boolean hasPermission(final String permission) {
        return true;
    }

}
