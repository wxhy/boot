package com.study.boot.common.datasource.support;


import lombok.experimental.UtilityClass;

/**
 *  根据当前线程来选择具体的数据源
 * @author carlos
 */
@UtilityClass
public class DynamicDataSourceContextHolder {

    private static final ThreadLocal<DataSourceContants> CONTEXT_HOLDER = new ThreadLocal<>();

    public static void add(DataSourceContants dataSourceContants) {
        CONTEXT_HOLDER.set(dataSourceContants);
    }

    public static DataSourceContants get() {
        return CONTEXT_HOLDER.get();
    }

    public static void clear(){
        CONTEXT_HOLDER.remove();
    }

}
