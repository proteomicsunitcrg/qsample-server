package eu.crg.qsample.security.config;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import eu.crg.qsample.security.JwtAuthenticationEntryPoint;
import eu.crg.qsample.security.JwtAuthenticationTokenFilter;
import eu.crg.qsample.security.services.UserDetailsServiceImpl;

import org.springframework.http.HttpMethod;

@SuppressWarnings("SpringJavaAutowiringInspection")
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserDetailsServiceImpl  userDetailsService;

    @Autowired
    private JwtAuthenticationEntryPoint unauthorizedHandler;

    // Comma-separated allowlist, fed from the QSAMPLE_CORS_ORIGINS env var (see application.yml)
    @Value("${cors.allowed-origins}")
    private List<String> allowedOrigins;

    @Bean
    public JwtAuthenticationTokenFilter authenticationJwtTokenFilter() {
        return new JwtAuthenticationTokenFilter();
    }

    @Override
    public void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
        authenticationManagerBuilder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity security) throws Exception {
        // CSRF safe to disable: stateless JWT in Authorization header,
        // CORS allowCredentials=false, no cookie-based session.
        security
                .csrf().disable()
                .httpBasic().disable()
                .formLogin().disable()
                .cors().and()
                .exceptionHandling().authenticationEntryPoint(unauthorizedHandler).and()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
                .authorizeRequests()
                .antMatchers(HttpMethod.OPTIONS, "/**").permitAll()
                .antMatchers("/api/auth/**").permitAll()
                .antMatchers(HttpMethod.GET,
                        "/",
                        "/index.html",
                        "/favicon.ico",
                        "/env.js",
                        "/api/config",
                        "/api/config/**",
                        "/login",
                        "/login/**",
                        "/wetlab",
                        "/wetlab/**",
                        "/request",
                        "/request/**",
                        "/settings",
                        "/settings/**",
                        "/help",
                        "/help/**",
                        "/favorite",
                        "/favorite/**",
                        "/*.js",
                        "/*.css",
                        "/*.map",
                        "/assets/**",
                        "/static/**"
                ).permitAll()
                .anyRequest().authenticated();

        security.addFilterBefore(authenticationJwtTokenFilter(), UsernamePasswordAuthenticationFilter.class);

    }
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        final CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(allowedOrigins);
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        // JWT travels in the Authorization header, no cookies involved
        configuration.setAllowCredentials(false);
        configuration.addExposedHeader("total");
        configuration.addExposedHeader("tokenexpiration");
        configuration.setAllowedHeaders(Arrays.asList("Authorization", "Content-Type", "Accept"));
        final UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

}