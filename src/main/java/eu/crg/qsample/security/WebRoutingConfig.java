package eu.crg.qsample.security;

import java.util.Arrays;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;

import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;

import org.springframework.boot.web.server.ErrorPage;

@Configuration 
public class WebRoutingConfig implements WebMvcConfigurer { 

  @Override 
  public void addViewControllers(ViewControllerRegistry registry) { 
      registry.addViewController("/urlNotFound") 
      // the viewName should be specified, in our case we forward to the index.html 
      .setViewName("forward:/"); 
  } 

  @Bean 
  public WebServerFactoryCustomizer<ConfigurableServletWebServerFactory> containerCustomizer() { 
      return container -> { 
        container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, 
          "/urlNotFound")); 
      }; 
  } 
}
