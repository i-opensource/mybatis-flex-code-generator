package i.source.code.generator.vo;

import com.mybatisflex.codegen.config.EntityConfig;
import com.mybatisflex.codegen.config.GlobalConfig;
import com.mybatisflex.codegen.config.PackageConfig;
import com.mybatisflex.codegen.entity.Table;
import com.mybatisflex.codegen.generator.IGenerator;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * 自定义RequestVo文件生成器
 * @author Go
 * @since 2024
 */
public class RequestVoGenerator implements IGenerator {

    private String templatePath = "templates/enjoy/entityRequestVo.tpl";

    @Override
    public String getTemplatePath() {
        return templatePath;
    }

    @Override
    public void setTemplatePath(final String templatePath) {
        this.templatePath = templatePath;
    }

    @Override
    public void generate(final Table table, final GlobalConfig globalConfig) {
        if(!globalConfig.isEntityGenerateEnable()) {
            return;
        }

        PackageConfig packageConfig = globalConfig.getPackageConfig();
        EntityConfig entityConfig = globalConfig.getEntityConfig();
        String editVoPackage = packageConfig.getBasePackage().replace(".", "/").concat("/vo");
        File entityJavaFile = new File(packageConfig.getSourceDir(), editVoPackage.concat("/").concat(table.buildEntityClassName()).concat("RequestVo.java"));

        Map<String, Object> params = new HashMap<>();
        params.put("table", table);
        params.put("entityConfig", entityConfig);
        params.put("packageConfig", packageConfig);
        params.put("javadocConfig", globalConfig.getJavadocConfig());
        params.put("isBase", false);
        params.put("entityPackageName", packageConfig.getBasePackage() + ".vo");
        params.put("entityClassName", table.buildEntityClassName());

        globalConfig.getTemplateConfig().getTemplate().generate(params, templatePath, entityJavaFile);
    }
}
