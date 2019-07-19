package com.study.boot.common.oss.utils;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.jodconverter.JodConverter;
import org.jodconverter.office.LocalOfficeManager;
import org.jodconverter.office.OfficeException;
import org.jodconverter.office.OfficeManager;
import org.jodconverter.office.OfficeUtils;

import java.io.File;

/**
 * @author
 */
@Slf4j
public class Office2Pdf {

    private static final String PDF =  "pdf";


    /**
     * 转换
     *
     * @param sourceFilePath
     */
    public static File officce2Pdf(String sourceFilePath) {
        OfficeManager officeManager = null;
        if (StrUtil.isEmpty(sourceFilePath)) {
            log.error("源文件路径不能为空");
            return null;
        }

        File sourceFile = new File(sourceFilePath);

        //目标文件名
        String filename = FileUtil.getName(sourceFilePath)
                .replace(FileUtil.extName(sourceFilePath), PDF);

        File targetFile = new File(sourceFile.getParent() + StrUtil.SLASH + filename);
        if (!sourceFile.exists()) {
            log.error("源文件不存在");
            return null;
        }

        try {
            officeManager = LocalOfficeManager.install();

            officeManager.start();

            JodConverter.convert(sourceFile)
                    .to(targetFile)
                    .execute();

        } catch (OfficeException e) {
            log.error("转换失败", e);
            return null;
        } finally {
            OfficeUtils.stopQuietly(officeManager);
        }
        return targetFile;
    }


    public static void main(String[] args) {
        Office2Pdf.officce2Pdf("file-system/123.txt");
    }

}
