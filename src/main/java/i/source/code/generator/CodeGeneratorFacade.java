package i.source.code.generator;

import com.mybatisflex.codegen.Generator;
import com.mybatisflex.codegen.config.*;
import com.mybatisflex.codegen.generator.GeneratorFactory;
import com.zaxxer.hikari.HikariDataSource;
import i.source.code.generator.framework.dao.mybatis.base.MyBatisBaseMapper;
import i.source.code.generator.framework.dao.mybatis.base.MyBatisBaseService;
import i.source.code.generator.framework.dao.mybatis.base.MyBatisBaseServiceImpl;
import i.source.code.generator.framework.dao.mybatis.listener.MyBatisInsertListener;
import i.source.code.generator.framework.dao.mybatis.listener.MyBatisUpdateListener;
import i.source.code.generator.vo.EditVoGenerator;
import i.source.code.generator.vo.ListVoGenerator;
import i.source.code.generator.vo.RequestVoGenerator;

import java.time.LocalDate;
import java.util.Set;

public class CodeGeneratorFacade {

    // 数据库连接信息
    final String database = "mybatis_flex_code_generator";
    final String username = "root";
    final String password = "root";

    final String url = "jdbc:mysql://127.0.0.1:3306/" + database + "?useSSL=false";

    // 模块包名
    private final static String PACKAGE_NAME = "sys.user";

    // 包名
    private final static String BASE_PACKAGE_NAME = "i.source.code.generator.module.";

    // 模块名
    private final static String MODULE_NAME = "system.";

    private static final Set<String> TABLE_NAMES = Set.of("i_sys_user");

    private static final String TABLE_NAME_PREFIX = "i_";

    private static final String TEMPLATE_PATH = "templates/enjoy/";

    // 使用的jdk版本
    private static final Integer JDK_VERSION = 17;

    public void generateCode() {
        try(HikariDataSource dataSource = new HikariDataSource()) {
            dataSource.setJdbcUrl(url);
            dataSource.setUsername(username);
            dataSource.setPassword(password);

            GlobalConfig globalConfig = createGlobalConfig();

            Generator generator = new Generator(dataSource, globalConfig);
            generator.generate();
        }
    }

    private GlobalConfig createGlobalConfig() {
        GlobalConfig globalConfig = new GlobalConfig();
        globalConfig.setAuthor("i-source");
        globalConfig.setSince(LocalDate.now().getYear() + "");

        // 设置表前缀, 生成po类时会直接去掉表前缀
        globalConfig.setTablePrefix(TABLE_NAME_PREFIX);

        // 要生成的表
        globalConfig.setGenerateTables(TABLE_NAMES);

        // package config
        PackageConfig packageConfig = globalConfig.getPackageConfig();
        // 模块包名
        packageConfig.setBasePackage(BASE_PACKAGE_NAME.concat(MODULE_NAME).concat(PACKAGE_NAME));
        // 设置entity,mapper,service,controller包名
        packageConfig.setEntityPackage(packageConfig.getBasePackage().concat(".po"));
        packageConfig.setMapperPackage(packageConfig.getBasePackage().concat(".mapper"));
        packageConfig.setServicePackage(packageConfig.getBasePackage().concat(".service"));
        packageConfig.setServiceImplPackage(packageConfig.getBasePackage().concat(".service.impl"));
        packageConfig.setControllerPackage(packageConfig.getBasePackage().concat(".controller"));

        // template config
        TemplateConfig templateConfig = globalConfig.getTemplateConfig();
        // 设置生成类使用的模板文件名称
        templateConfig.setEntity(TEMPLATE_PATH .concat("entityOrBase.tpl"));
        templateConfig.setMapper(TEMPLATE_PATH .concat("mapper.tpl"));
        templateConfig.setMapperXml(TEMPLATE_PATH .concat("mapperXml.tpl"));
        templateConfig.setService(TEMPLATE_PATH .concat("service.tpl"));
        templateConfig.setServiceImpl(TEMPLATE_PATH .concat("serviceImpl.tpl"));
        templateConfig.setController(TEMPLATE_PATH .concat("controller.tpl"));

        // table config
        TableConfig tableConfig = new TableConfig();
        tableConfig.setInsertListenerClass(MyBatisInsertListener.class);
        tableConfig.setUpdateListenerClass(MyBatisUpdateListener.class);

        // entity config
        EntityConfig entityConfig = globalConfig.getEntityConfig();
        entityConfig.setJdkVersion(JDK_VERSION);
        entityConfig.setWithLombok(true);
        entityConfig.setOverwriteEnable(true);

        globalConfig.enableEntity();

        // mapper config
        MapperConfig mapperConfig = globalConfig.getMapperConfig();
        mapperConfig.setMapperAnnotation(true);
        mapperConfig.setOverwriteEnable(true);

        globalConfig.enableMapper()
                .setOverwriteEnable(true)
                .setSuperClass(MyBatisBaseMapper.class);

        // service config
        ServiceConfig serviceConfig = globalConfig.getServiceConfig();
        serviceConfig.setOverwriteEnable(true);
        serviceConfig.setSuperClass(MyBatisBaseService.class);

        globalConfig.enableService();

        // service impl config
        ServiceImplConfig serviceImplConfig = globalConfig.getServiceImplConfig();
        serviceImplConfig.setOverwriteEnable(true);
        serviceImplConfig.setSuperClass(MyBatisBaseServiceImpl.class);

        globalConfig.enableServiceImpl();

        // controller config
        ControllerConfig controllerConfig = globalConfig.getControllerConfig();
        controllerConfig.setOverwriteEnable(true);
        controllerConfig.setRestStyle(true);

        globalConfig.enableController();

        // mapper xml config
        MapperXmlConfig mapperXmlConfig = globalConfig.getMapperXmlConfig();
        mapperXmlConfig.setOverwriteEnable(true);

        globalConfig.enableMapperXml();

        // 自定义vo
        GeneratorFactory.registerGenerator("editVo", new EditVoGenerator());
        GeneratorFactory.registerGenerator("listVo", new ListVoGenerator());
        GeneratorFactory.registerGenerator("requestVo", new RequestVoGenerator());

        return globalConfig;
    }

}
