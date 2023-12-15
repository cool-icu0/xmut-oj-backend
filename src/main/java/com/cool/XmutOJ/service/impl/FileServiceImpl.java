package com.cool.XmutOJ.service.impl;

import cn.hutool.core.date.DateTime;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.ObjectMetadata;
import com.cool.XmutOJ.service.FileService;
import com.cool.XmutOJ.utils.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.UUID;

/**
 * @author Shier
 * 阿里云对象存储实现类
 */
@Service
public class FileServiceImpl implements FileService {

    /**
     * 上传头像到OSS
     */
    @Override
    public String uploadFileAvatar(MultipartFile file) {

        //工具类获取值
        String endpoint = FileUtils.END_POINT;
        String accessKeyId = FileUtils.KEY_ID;
        String accessKeySecret = FileUtils.KEY_SECRET;
        String bucketName = FileUtils.BUCKET_NAME;
        String ossUrl =FileUtils.URL;
        InputStream inputStream = null;
        try {
            // 创建OSS实例
            OSS oss = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
            //获取上传文件输入流
            inputStream = file.getInputStream();
            //获取文件名称
            String fileName = file.getOriginalFilename();

            //1. 在文件名称里面添加随机唯一的值
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //拼接文件名
            fileName = uuid + fileName;

            //2 把文件按照日期进行分类
            //获取当前日期
            String newDate = new DateTime().toString("yyyy/MM/dd");
            //拼接文件名
            fileName = newDate + "/" + fileName;

            /**
             * 调用oss方法实现上传
             * 第一个参数  Bucket名称
             * 第二个参数  上传到oss文件路径和文件名称   aa/bb/1.jpg
             * 第三个参数  上传文件输入流
             */
            oss.putObject(bucketName,fileName,inputStream);

            // 关闭oss
            oss.shutdown();

            //把上传之后文件路径返回
            //需要把上传到阿里云oss路径手动拼接出来
            //  https://edu-guli-1010.oss-cn-beijing.aliyuncs.com/01.jpg
            String url = ossUrl+ "/" + fileName;
            return url;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Description: 判断OSS服务文件上传时文件的contentType
     *
     * @param filenameExtension 文件后缀
     * @return String
     */
    public static String getcontentType(String filenameExtension) {
        if (filenameExtension.equalsIgnoreCase("bmp")) {
            return "image/bmp";
        }
        if (filenameExtension.equalsIgnoreCase("gif")) {
            return "image/gif";
        }
        if (filenameExtension.equalsIgnoreCase("jpeg") || filenameExtension.equalsIgnoreCase("jpg")
                || filenameExtension.equalsIgnoreCase("png")) {
            return "image/jpeg";
        }
        if (filenameExtension.equalsIgnoreCase("html")) {
            return "text/html";
        }
        if (filenameExtension.equalsIgnoreCase("txt")) {
            return "text/plain";
        }
        if (filenameExtension.equalsIgnoreCase("vsd")) {
            return "application/vnd.visio";
        }
        if (filenameExtension.equalsIgnoreCase("pptx") || filenameExtension.equalsIgnoreCase("ppt")) {
            return "application/vnd.ms-powerpoint";
        }
        if (filenameExtension.equalsIgnoreCase("docx") || filenameExtension.equalsIgnoreCase("doc")) {
            return "application/msword";
        }
        if (filenameExtension.equalsIgnoreCase("xml")) {
            return "text/xml";
        }
        return "application/octet-stream";
    }
}