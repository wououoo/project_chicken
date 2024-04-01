package org.zerock;

import jakarta.servlet.http.HttpSessionListener;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class Ex02Application extends SpringBootServletInitializer {
	public static void main(String[] args) {
		SpringApplication.run(Ex02Application.class, args);
	}


}
