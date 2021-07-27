package com.example.oss.service.impl;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.example.oss.service.OssService;
import com.example.oss.utils.ConstantPropertiesUtils;
import org.joda.time.DateTime;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

@Service
public class OssServiceImpl implements OssService {


    @Override
    public String uploadFile(MultipartFile file, String folderName) {
        String endpoint = ConstantPropertiesUtils.END_POINT;
        String accessKeyId = ConstantPropertiesUtils.ACCESS_KEY_ID;
        String accessKeySecret = ConstantPropertiesUtils.ACCESS_KEY_SECRET;

        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        InputStream inputStream = null;
        try {
            inputStream = file.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String dataPath = new DateTime().toString("yyyy/MM/dd");
        String filePath = dataPath + "/" + UUID.randomUUID().toString().replaceAll("-", "") + file.getOriginalFilename();

        ossClient.putObject(ConstantPropertiesUtils.BUCKET_NAME, folderName+"/" + filePath, inputStream);

        ossClient.shutdown();

        String url = "https://" + ConstantPropertiesUtils.BUCKET_NAME + "." + endpoint + "/"+folderName+"/" + filePath;

        return url;
    }
}
