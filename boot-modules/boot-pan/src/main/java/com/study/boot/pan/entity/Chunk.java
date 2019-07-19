package com.study.boot.pan.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import org.springframework.data.annotation.Transient;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author carlos
 */
@Data
@TableName(value = "chunk")
public class Chunk extends Model<Chunk> {
     @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 当前文件块，从1开始
     */
    @TableField(value = "chunk_number")
    private Long chunkNumber;

    /**
     * 分块大小
     */
    @TableField(value = "chunk_size")
    private Long chunkSize;

    /**
     * 当前分块大小
     */
    @TableField(value = "current_chunk_size")
    private Long currentChunkSize;

    /**
     * 总大小
     */
    @TableField(value = "total_size")
    private Long totalSize;

    /**
     * 文件标识
     */
    @TableField(value = "identifier")
    private String identifier;

    /**
     * 文件名
     */
    @TableField(value = "filename")
    private String filename;

    /**
     * 相对路径
     */
    @TableField(value = "relative_path")
    private String relativePath;

    /**
     * 总块数
     */
    @TableField(value = "total_chunks")
    private Long totalChunks;

    @TableField(exist = false)
    private MultipartFile file;

    @TableField(exist = false)
    private Long parentId;

    public static final String COL_CHUNK_NUMBER = "chunk_number";

    public static final String COL_CHUNK_SIZE = "chunk_size";

    public static final String COL_CURRENT_CHUNK_SIZE = "current_chunk_size";

    public static final String COL_TOTAL_SIZE = "total_size";

    public static final String COL_IDENTIFIER = "identifier";

    public static final String COL_FILE_NAME = "file_name";

    public static final String COL_RELATIVE_PATH = "relative_path";

    public static final String COL_TOTAL_CHUNKS = "total_chunks";

}