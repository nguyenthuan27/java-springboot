package com.assignment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.assignment.Intercepter.LoginIntercepter;

@Configuration
public class BeanConfig implements WebMvcConfigurer{
	@Autowired
	LoginIntercepter loginIntercepter;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginIntercepter)
		.addPathPatterns("/admin/**")
		.addPathPatterns("/customer/oderfromcart","/customer/profile","/customer/oderDetails")
		.excludePathPatterns("/admin/home","/customer/home");
		
	}
}
