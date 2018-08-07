package cn.edu.jxufe;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Created by m1777 on 2018/8/2.
 */
@SpringBootApplication
@MapperScan("cn.edu.jxufe.dao")
public class StartWebApp {
    public StartWebApp(){
        System.out.println("服务器启动");
    }

    public static void main(String[] args) {
        SpringApplication.run(StartWebApp.class,args);
    }


}
