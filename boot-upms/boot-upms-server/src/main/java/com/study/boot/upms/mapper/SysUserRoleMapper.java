package com.study.boot.upms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.study.boot.upms.api.entity.SysUserRole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author Administrator
 */
@Mapper
public interface SysUserRoleMapper extends BaseMapper<SysUserRole> {

    /**
     *
     * 根据用户Id删除该用户的角色关系
     * @param userId
     * @return
     */
    Boolean deleteByUserId(@Param("userId") Integer userId);
}