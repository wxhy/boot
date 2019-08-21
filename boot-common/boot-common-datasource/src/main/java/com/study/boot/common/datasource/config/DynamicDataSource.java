package com.study.boot.common.datasource.config;

import com.study.boot.common.datasource.support.DynamicDataSourceContextHolder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * @author
 */
@Slf4j
public class DynamicDataSource extends AbstractRoutingDataSource {


    @Override
    protected Object determineCurrentLookupKey() {
        String dataSourceName = DynamicDataSourceContextHolder.get();
        logger.info("当前数据源是：" + dataSourceName);
        return DynamicDataSourceContextHolder.get();
    }
}
