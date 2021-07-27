package com.example.oss.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;

public interface OssService {
    String uploadFile(MultipartFile file,String folderName);

}
