package org.website.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@ComponentScan(basePackages = "org.website") // Quét tất cả các Service, Component (trừ Controller)
@PropertySource("classpath:application.properties") // Đọc file properties
public class AppConfig {
    // Nơi bạn có thể định nghĩa thêm các Bean dùng chung nếu cần
}
