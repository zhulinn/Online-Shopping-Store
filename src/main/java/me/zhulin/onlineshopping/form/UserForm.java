package me.zhulin.onlineshopping.form;

import lombok.Data;
import me.zhulin.onlineshopping.entity.User;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

/**
 * Created By Zhu Lin on 3/13/2018.
 */
@Data
public class UserForm extends User{

    @Email
    @NotEmpty
    private String email;
    @NotEmpty
    @Size(min=6)
    private String password;
    @NotEmpty
    private String name;
    @NotEmpty
    private String phone;
    @NotEmpty
    private String address;
    @NotEmpty
    private boolean active;
    @NotEmpty
    private String role;

}
