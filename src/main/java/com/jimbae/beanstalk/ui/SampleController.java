package com.jimbae.beanstalk.ui;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SampleController {

    @GetMapping("/")
    public ResponseEntity<String> main() {
        return ResponseEntity.ok("OK");
    }
}
