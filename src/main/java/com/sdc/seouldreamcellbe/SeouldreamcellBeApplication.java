package com.sdc.seouldreamcellbe;

import jakarta.annotation.PostConstruct;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import java.util.TimeZone;

@EnableJpaAuditing
@SpringBootApplication
public class SeouldreamcellBeApplication {

    @PostConstruct
    public void init() {
        // Set default timezone to Asia/Seoul (KST)
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
    }

    public static void main(String[] args) {
        SpringApplication.run(SeouldreamcellBeApplication.class, args);
    }

}
