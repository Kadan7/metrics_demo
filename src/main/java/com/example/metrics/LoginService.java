package com.example.metrics;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.micrometer.core.instrument.MeterRegistry;

@RestController
public class LoginService {

	@Autowired
	private MeterRegistry meterRegistry;
	
	@RequestMapping("/login")
	public String login() {
		meterRegistry.counter("counter.login.success").increment();
		return "Login success";
	}
}
