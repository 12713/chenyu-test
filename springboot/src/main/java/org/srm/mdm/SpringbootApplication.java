package org.srm.mdm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.web.bind.annotation.RestController;

/*(exclude ={DataSourceAutoConfiguration.class})*/
@SpringBootApplication
@MapperScan("org.srm.mdm.infra.mapper")
public class SpringbootApplication {
	public static void main(String[] args) {
		SpringApplication.run(SpringbootApplication.class, args);
		System.out.println("启动成功");
	}
}

