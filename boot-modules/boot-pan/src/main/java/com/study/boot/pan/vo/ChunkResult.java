package com.study.boot.pan.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

/**
 *
 * @author carlos
 */
@Data
@Builder
public class ChunkResult {

    private boolean skipUpload;

    private Long[] uploaded;

}
