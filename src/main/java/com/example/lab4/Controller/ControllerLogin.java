package com.example.lab4.Controller;


import com.example.lab4.Entity.User;
import com.example.lab4.Repository.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("/login")
public class ControllerLogin {

    final UserRepository userRepository;

    public ControllerLogin(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping("/inicioSesion")
    public String validarLogueo(@RequestParam("correo") String correo, @RequestParam("contrasena") String contrasena) {




        List<User> listaUser = userRepository.findByCredentials(correo,contrasena);



        if (listaUser.isEmpty()==false) {

            return "homePage";
        } else {
            return "redirect:/inicio";
        }
    }


    @GetMapping("/homePage")
    private String Inicio() {

        return "homepage";
    }


}



