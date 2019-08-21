package com.study.boot.codegen.utils;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.StrUtil;
import com.study.boot.codegen.entity.ColumnEntity;
import com.study.boot.codegen.entity.GenConfig;
import com.study.boot.codegen.entity.TableEntity;
import com.study.boot.common.exception.CheckedException;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.WordUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

import java.io.IOException;
import java.io.StringWriter;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Slf4j
@UtilityClass
public class GenUtils {

    private final String ENTITY_JAVA_VM = "Entity.java.vm";
    private final String MAPPER_JAVA_VM = "Mapper.java.vm";
    private final String SERVICE_JAVA_VM = "Service.java.vm";
    private final String SERVICE_IMPL_JAVA_VM = "ServiceImpl.java.vm";
    private final String CONTROLLER_JAVA_VM = "Controller.java.vm";
    private final String MAPPER_XML_VM = "Mapper.xml.vm";
    private final String INDEX_VUE_VM = "index.vue.vm";
    private final String API_JS_VM = "api.js.vm";
    private final String CRUD_JS_VM = "crud.js.vm";

    private List<String> getTemplates() {
        List<String> templates = new ArrayList<>();
        templates.add("template/Entity.java.vm");
        templates.add("template/Mapper.java.vm");
        templates.add("template/Mapper.xml.vm");
        templates.add("template/Service.java.vm");
        templates.add("template/ServiceImpl.java.vm");
        templates.add("template/Controller.java.vm");

        templates.add("template/index.vue.vm");
        templates.add("template/api.js.vm");
        templates.add("template/crud.js.vm");
        return templates;
    }


    /**
     * 生成代码
     */
    public void generatorCode(GenConfig genConfig, Map<String,String> table,
                              List<Map<String,String>> columns, ZipOutputStream zip){
        //配置信息
        Configuration configuration = getConfig();
        boolean hasBigDecimal = false;

        //表信息
        TableEntity tableEntity = new TableEntity();
        tableEntity.setTableName(table.get("tableName"));
        //表注释
        if(StrUtil.isNotBlank(genConfig.getComments())) {
            tableEntity.setComments(genConfig.getComments());
        } else {
            tableEntity.setComments(table.get("tableComment"));
        }

        String tablePrefix;
        if(StrUtil.isNotBlank(genConfig.getTablePrefix())) {
            tablePrefix = genConfig.getTablePrefix();
        } else {
            tablePrefix = configuration.getString("tablePrefix");
        }

        //表名转换成Java类名
        String className = tableToJava(tableEntity.getTableName(),tablePrefix);
        tableEntity.setCaseClassName(className);
        tableEntity.setLowerClassName(StringUtils.uncapitalize(className));

//        column_name columnName, data_type dataType, column_comment columnComment, column_key columnKey, extra
        List<ColumnEntity> columnList = new ArrayList<>();
        for (Map<String,String> column: columns) {
            ColumnEntity columnEntity = new ColumnEntity();
            columnEntity.setColumnName(column.get("columnName"));
            columnEntity.setDataType(column.get("dataType"));
            columnEntity.setComments(column.get("columnComment"));
            columnEntity.setExtra(column.get("extra"));

            //列名转换成java属性名
            String attrName = columnToJava(columnEntity.getColumnName());
            columnEntity.setCaseAttrName(attrName);
            columnEntity.setLowerAttrName(StringUtils.uncapitalize(attrName));
            columnEntity.setUpperAttrName(attrName.toUpperCase());

            //列的数据类型，转换成Java类型
            String attrType = configuration.getString(columnEntity.getDataType(), "unknowType");
            columnEntity.setAttrType(attrType);
            if (!hasBigDecimal && "BigDecimal".equals(attrType)) {
                hasBigDecimal = true;
            }

            //是否主键
            if ("PRI".equalsIgnoreCase(column.get("columnKey")) && tableEntity.getPk() == null) {
                tableEntity.setPk(columnEntity);
            }

            columnList.add(columnEntity);
        }

        tableEntity.setColumns(columnList);
        //没主键，则第一个字段为主键
        if (tableEntity.getPk() == null) {
            tableEntity.setPk(tableEntity.getColumns().get(0));
        }

        //设置velocity资源加载器
        Properties prop = new Properties();
        prop.put("file.resource.loader.class","org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        Velocity.init(prop);
        //封装模板数据
        Map<String, Object> map = new HashMap<>(16);
        map.put("tableName", tableEntity.getTableName());
        map.put("pk", tableEntity.getPk());
        map.put("className", tableEntity.getCaseClassName());
        map.put("classname", tableEntity.getLowerClassName());
        map.put("pathName", tableEntity.getLowerClassName().toLowerCase());
        map.put("columns", tableEntity.getColumns());
        map.put("hasBigDecimal", hasBigDecimal);
        map.put("datetime", DateUtil.now());

        if (StrUtil.isNotBlank(genConfig.getComments())) {
            map.put("comments", genConfig.getComments());
        } else {
            map.put("comments", tableEntity.getComments());
        }

        if (StrUtil.isNotBlank(genConfig.getAuthor())) {
            map.put("author", genConfig.getAuthor());
        } else {
            map.put("author", configuration.getString("author"));
        }

        if (StrUtil.isNotBlank(genConfig.getModuleName())) {
            map.put("moduleName", genConfig.getModuleName());
        } else {
            map.put("moduleName", configuration.getString("moduleName"));
        }

        if (StrUtil.isNotBlank(genConfig.getPackageName())) {
            map.put("package", genConfig.getPackageName());
            map.put("mainPath", genConfig.getPackageName());
        } else {
            map.put("package", configuration.getString("package"));
            map.put("mainPath", configuration.getString("mainPath"));
        }
        VelocityContext context = new VelocityContext(map);

        //获取模板列表
        List<String> templates = getTemplates();
        for (String template : templates) {
            //渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, CharsetUtil.UTF_8);
            tpl.merge(context, sw);

            try {
                //添加到zip
                zip.putNextEntry(new ZipEntry(Objects
                        .requireNonNull(getFileName(template, tableEntity.getCaseClassName()))));
                IoUtil.write(zip, CharsetUtil.UTF_8, false, sw.toString());
                IoUtil.close(sw);
                zip.closeEntry();
            } catch (IOException e) {
                throw new CheckedException("渲染模板失败，表名：" + tableEntity.getTableName(), e);
            }
        }

    }

    private String getFileName(String template, String className) {
        if (template.contains(ENTITY_JAVA_VM)) {
            return  className + ".java";
        }

        if (template.contains(MAPPER_JAVA_VM)) {
            return className + "Mapper.java";
        }

        if (template.contains(SERVICE_JAVA_VM)) {
            return className + "Service.java";
        }

        if (template.contains(SERVICE_IMPL_JAVA_VM)) {
            return className + "ServiceImpl.java";
        }

        if (template.contains(CONTROLLER_JAVA_VM)) {
            return className + "Controller.java";
        }

        if (template.contains(MAPPER_XML_VM)) {
            return className + "Mapper.xml";
        }

        if (template.contains(INDEX_VUE_VM)) {
            return "index.vue";
        }

        if (template.contains(API_JS_VM)) {
            return className.toLowerCase() + "-api.js";
        }

        if (template.contains(CRUD_JS_VM)) {
            return className.toLowerCase() + ".js";
        }

        return null;
    }

    /**
     * 列名转换成Java属性名
     */
    private String columnToJava(String columnName) {
        return WordUtils.capitalizeFully(columnName, new char[]{'_'}).replace("_", "");
    }

    /**
     * 表名转换成Java类名
     */
    private String tableToJava(String tableName, String tablePrefix) {
       if(StrUtil.isNotBlank(tablePrefix)) {
            tableName = tableName.replace(tablePrefix,"");
       }
       return columnToJava(tableName);
    }

    private Configuration getConfig() {
        try {
            return new PropertiesConfiguration("generator.properties");
        }catch (ConfigurationException e) {
            throw new CheckedException("获取配置文件失败，", e);
        }
    }
}
