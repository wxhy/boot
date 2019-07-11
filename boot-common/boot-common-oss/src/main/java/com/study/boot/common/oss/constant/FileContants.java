package com.study.boot.common.oss.constant;

import cn.hutool.core.io.FileUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * 文件类型常量
 * @author Administrator
 */
public class FileContants {

    public static final Map<String, FileType> fileTypeAccordingToSuffix = new HashMap<>(16);

    /**
     * 文件类型
     *
     * @author Administrator
     */
    public enum FileType {
        /**
         * 文件类型，例如FOLDER表示文件夹
         */
        DEFAULT, FOLDER, PDF, COMPRESS_FILE,
        VIDEO, AUDIO, PICTURE, DOC, PPT, TXT,
        TORRENT, WEB, CODE;


        @Override
        public String toString() {
            return name().toLowerCase();
        }
    }

    /**
     * 获取文件类型
     * @param fileName
     * @return
     */
    public static FileType getFileType(String fileName){
        String suffix = FileUtil.extName(fileName);
        return fileTypeAccordingToSuffix.getOrDefault(suffix,FileType.DEFAULT);
    }

    static {
        // pdf
        fileTypeAccordingToSuffix.put(".pdf", FileType.PDF);

        // compress_file
        fileTypeAccordingToSuffix.put(".tar.gz", FileType.COMPRESS_FILE);
        fileTypeAccordingToSuffix.put(".zip", FileType.COMPRESS_FILE);
        fileTypeAccordingToSuffix.put(".7z", FileType.COMPRESS_FILE);
        fileTypeAccordingToSuffix.put(".rar", FileType.COMPRESS_FILE);

        // video
        fileTypeAccordingToSuffix.put(".mp4", FileType.VIDEO);
        fileTypeAccordingToSuffix.put(".flv", FileType.VIDEO);
        fileTypeAccordingToSuffix.put(".rmvb", FileType.VIDEO);
        fileTypeAccordingToSuffix.put(".avi", FileType.VIDEO);
        fileTypeAccordingToSuffix.put(".mkv", FileType.VIDEO);

        // audio
        fileTypeAccordingToSuffix.put(".mp3", FileType.AUDIO);

        // picture
        fileTypeAccordingToSuffix.put(".png", FileType.PICTURE);
        fileTypeAccordingToSuffix.put(".jpg", FileType.PICTURE);
        fileTypeAccordingToSuffix.put(".jpeg", FileType.PICTURE);
        fileTypeAccordingToSuffix.put(".gif", FileType.PICTURE);
        fileTypeAccordingToSuffix.put(".ico", FileType.PICTURE);

        // doc
        fileTypeAccordingToSuffix.put(".doc", FileType.DOC);
        fileTypeAccordingToSuffix.put(".docx", FileType.DOC);

        // txt
        fileTypeAccordingToSuffix.put(".txt", FileType.TXT);

        // ppt
        fileTypeAccordingToSuffix.put(".ppt", FileType.PPT);
        fileTypeAccordingToSuffix.put(".pptx", FileType.PPT);

        // torrent
        fileTypeAccordingToSuffix.put(".torrent", FileType.TORRENT);

        // web
        fileTypeAccordingToSuffix.put(".html", FileType.WEB);
        fileTypeAccordingToSuffix.put(".htm", FileType.WEB);

        // code
        fileTypeAccordingToSuffix.put(".js", FileType.CODE);
        fileTypeAccordingToSuffix.put(".json", FileType.CODE);
        fileTypeAccordingToSuffix.put(".java", FileType.CODE);
        fileTypeAccordingToSuffix.put(".c", FileType.CODE);
        fileTypeAccordingToSuffix.put(".cpp", FileType.CODE);
        fileTypeAccordingToSuffix.put(".h", FileType.CODE);
        fileTypeAccordingToSuffix.put(".py", FileType.CODE);
        fileTypeAccordingToSuffix.put(".go", FileType.CODE);

    }


}
