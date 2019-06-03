package com.study.boot.act.dto;


import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author Administrator
 */
@Data
public class ModelForm {
    @NotBlank
    private String name;
    @NotBlank
    private String key;
    @NotBlank
    private String category;
    private String desc;
}
