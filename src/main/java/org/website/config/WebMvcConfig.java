package org.website.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc // Bật tính năng Spring Web MVC
@ComponentScan(basePackages = "org.website.controller") // Quét các Controller
public class WebMvcConfig implements WebMvcConfigurer {

    // Cấu hình ViewResolver để Spring biết tìm các file giao diện (JSP) ở đâu
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setViewClass(JstlView.class);
        resolver.setPrefix("/WEB-INF/views/"); // Thư mục chứa file giao diện
        resolver.setSuffix(".jsp"); // Đuôi file của giao diện
        return resolver;
    }

    // Cấu hình để Spring cho phép truy cập các file tĩnh (css, js, hình ảnh...)
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");
    }
}
