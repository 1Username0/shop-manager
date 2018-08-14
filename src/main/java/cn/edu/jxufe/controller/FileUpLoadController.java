package cn.edu.jxufe.controller;

import com.aliyun.oss.OSSClient;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;

/**
 * Created by m1777 on 2018/8/14.
 */
@Controller
public class FileUpLoadController {

    @RequestMapping("udloadimage")
    @ResponseBody
    public Object uploadAdImage(@RequestParam("f")MultipartFile file){
        System.out.println("上传的文件名是"+file.getOriginalFilename());
        String endpoint="http://oss-cn-shenzhen.aliyuncs.com";
        String accessKeyId="LTAIb2zTkk3cHpQl";
        String accessKeySecret="HLPdM6yvPgqgTDtD8geV6A8nKy5qMG";
        String buckName="jc4hbsjava";
        OSSClient ossClient=new OSSClient(endpoint,accessKeyId,accessKeySecret);
        try {
            InputStream inputStream=file.getInputStream();
            ossClient.putObject(buckName,file.getOriginalFilename(),inputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            ossClient.shutdown();
        }
        System.out.println(endpoint);
        return endpoint.replace("http://","http://"+buckName+".")+"/"+file.getOriginalFilename();
    }
}
