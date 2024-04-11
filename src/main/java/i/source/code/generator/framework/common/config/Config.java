package i.source.code.generator.framework.common.config;

import i.source.code.generator.framework.common.security.permission.PermissionService;
import i.source.code.generator.framework.common.security.permission.impl.PermissionServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 配置类
 * @author Go
 * @since 2024
 */
@Configuration
public class Config {

    @Bean("permission")
    public PermissionService permissionService() {
        return new PermissionServiceImpl();
    }
}
