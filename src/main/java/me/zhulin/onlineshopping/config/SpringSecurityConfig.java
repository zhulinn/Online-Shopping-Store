package me.zhulin.onlineshopping.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.sql.DataSource;

/**
 * Created By Zhu Lin on 3/10/2018.
 */
@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

    private static final String MD5KEY = "zhulin.me";

    @Autowired
    @Qualifier("dataSource")
    DataSource dataSource;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Value("${spring.queries.users-query}")
    private String usersQuery;

    @Value("${spring.queries.roles-query}")
    private String rolesQuery;


    // Spring Boot 5.0 Requirement
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();   // 使用 BCrypt 加密
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.
                jdbcAuthentication()
                .usersByUsernameQuery(usersQuery)
                .authoritiesByUsernameQuery(rolesQuery)
                .dataSource(dataSource)
                .passwordEncoder(passwordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests().antMatchers("/css/**", "/js/**", "/fonts/**", "/index").permitAll() // 都可以访问
                // Seller: Employee & Manager
                //TODO
                /**
                 * manager create product...
                 */
                .antMatchers("/seller/**").access("hasAnyRole('EMPLOYEE', 'MANAGER')")
                // Customer
                .antMatchers("/cart/checkout/**").access("hasAnyRole('CUSTOMER','EMPLOYEE', 'MANAGER')")
                .anyRequest().permitAll()
                .and()
                .formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/")
               .loginProcessingUrl("/login") // Submit URL
//                .failureUrl("/login-error")//
                .usernameParameter("email")//
                .passwordParameter("password")
                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/")
                .and()
                .rememberMe().key(MD5KEY)
                .and()
                .exceptionHandling().accessDeniedPage("/403");

    }

//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().disable()
//                .authorizeRequests().anyRequest().permitAll();
//    }
}
