package com.sdc.seouldreamcellbe;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing
@SpringBootApplication
public class SeouldreamcellBeApplication {

    public static void main(String[] args) {
        SpringApplication.run(SeouldreamcellBeApplication.class, args);
    }

}
