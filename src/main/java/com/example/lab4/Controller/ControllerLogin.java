package com.example.lab4.Controller;


import com.example.lab4.Entity.User;
import com.example.lab4.Repository.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class ControllerLogin {

    final UserRepository userRepository;

    public ControllerLogin(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("")
    public String validarLogueo(@RequestParam("correo") String correo, Model model,@RequestParam("contraseña") String contraseña) {


        Optional<User> usuario = Optional.ofNullable(userRepository.findByCredentials(correo, contraseña));

        if (usuario.isPresent()) {
            User usuario_valido = usuario.get();


//            model.addAttribute("listaCategorias",categoryRepository.findAll());
            return "homePage";
        } else {
            return "redirect:/inicio";
        }


    }





}
