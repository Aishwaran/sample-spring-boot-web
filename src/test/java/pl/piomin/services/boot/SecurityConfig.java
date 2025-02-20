package pl.piomin.services.boot;  // Replace with your actual package name

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // Disables CSRF and allows all requests without authentication
        http.csrf().disable()
            .authorizeRequests()
            .anyRequest().permitAll();  // All endpoints are public
    }
}
