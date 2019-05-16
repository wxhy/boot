package com.study.boot.upms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.study.boot.upms.api.entity.SysRole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Administrator
 */
@Mapper
public interface SysRoleMapper extends BaseMapper<SysRole> {

    /**
     * 通过用户ID，查询角色信息
     *
     * @param userId
     * @return
     */
    List<SysRole> listRolesByUserId(@Param("userId") Integer userId);
}