package com.study.boot.upms.config;

import com.study.boot.upms.support.DataSourceContants;
import com.study.boot.upms.support.DynamicDataSourceContextHolder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * @author
 */
@Slf4j
public class DynamicDataSource extends AbstractRoutingDataSource {


    @Override
    protected Object determineCurrentLookupKey() {
        DataSourceContants dataSourceContants = DynamicDataSourceContextHolder.get();
        log.info("切换成功，当前库为：" + dataSourceContants.getValue());
        return dataSourceContants;
    }
}
