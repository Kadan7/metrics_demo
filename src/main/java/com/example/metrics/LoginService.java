package com.example.metrics;

import java.util.Calendar;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.micrometer.core.instrument.MeterRegistry;

@RestController
public class LoginService {

	@Autowired
	private MeterRegistry meterRegistry;
	
	@RequestMapping("/login")
	public String login() throws InterruptedException {
		long start = Calendar.getInstance().getTimeInMillis();
		Thread.sleep(2000);
		meterRegistry.counter("counter.login.success").increment();
		long end = Calendar.getInstance().getTimeInMillis();
		meterRegistry.timer("timer.login").record(end-start, TimeUnit.MILLISECONDS);;
		return "Login success";
	}
}
