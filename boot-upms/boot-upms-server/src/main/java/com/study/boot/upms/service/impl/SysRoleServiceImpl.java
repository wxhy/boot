package com.study.boot.upms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.upms.api.entity.SysRole;
import com.study.boot.upms.mapper.SysRoleMapper;
import com.study.boot.upms.service.SysRoleService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Administrator
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService{



    @Override
    public List<SysRole> listRolesByUserId(Integer userId) {
        return baseMapper.listRolesByUserId(userId);
    }

}
