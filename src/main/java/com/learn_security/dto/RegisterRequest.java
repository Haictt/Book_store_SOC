package com.learn_security.dto;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class RegisterRequest {
    private String name;
    private String email;
    private String password;
    private String address;
    private String telephoneNumber;
}
