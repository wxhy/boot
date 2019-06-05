package com.study.boot.act.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.act.entity.LeaveBill;
import com.study.boot.act.mapper.LeaveBillMapper;
import com.study.boot.act.service.LeaveBillService;
import org.springframework.stereotype.Service;


/**
 * @author Administrator
 */

@Service
public class LeaveBillServiceImpl extends ServiceImpl<LeaveBillMapper, LeaveBill>  implements LeaveBillService {
}
