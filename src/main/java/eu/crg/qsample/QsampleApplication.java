package eu.crg.qsample;

import java.util.TimeZone;

import javax.annotation.PostConstruct;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class QsampleApplication {


	@PostConstruct
	void started() {
		//TimeZone.setDefault(TimeZone.getTimeZone("Europe/Madrid"));
  }

	public static void main(String[] args) {
		SpringApplication.run(QsampleApplication.class, args);
	}

}
