package com.study.boot.pan.service;

import com.study.boot.pan.entity.Chunk;
import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.pan.vo.ChunkResult;

/**
 * @author carlos
 */
public interface ChunkService extends IService<Chunk>{


    /**
     * 上传chunk
     * @param chunk
     * @return
     */
    Boolean uploadChunk(Chunk chunk);

    /**
     * 合并文件
     * @param md5
     * @param parentId
     * @return
     */
    Boolean mergeChunk(String md5,Long parentId,String name);


    /**
     * 检查chunk，是否上传过
     * @param chunk
     * @return
     */
    ChunkResult checkChunk(Chunk chunk);


}
