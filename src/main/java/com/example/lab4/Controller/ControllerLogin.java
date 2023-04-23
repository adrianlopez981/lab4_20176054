package com.example.lab4.Controller;


import com.example.lab4.Entity.Aerolinea;
import com.example.lab4.Entity.User;
import com.example.lab4.Entity.Vuelo;
import com.example.lab4.Repository.UserRepository;
import com.example.lab4.Repository.VueloRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@RequestMapping("/login")
public class ControllerLogin {

    final UserRepository userRepository;
    final VueloRepository vueloRepository;

    public ControllerLogin(UserRepository userRepository, VueloRepository vueloRepository) {
        this.userRepository = userRepository;
        this.vueloRepository = vueloRepository;
    }

    @PostMapping("/inicioSesion")
    public String validarLogueo(Model model, @RequestParam("correo") String correo, @RequestParam("contrasena") String contrasena) {




        List<User> listaUser = userRepository.findByCredentials(correo,contrasena);

        User usuario = listaUser.get(0);



        if (listaUser.isEmpty()==false) {


            List<Vuelo> listaVuelos = vueloRepository.findByListaVuelos();

            model.addAttribute("listaVuelos", listaVuelos);
            model.addAttribute("user", usuario);

            System.out.println(usuario.getIduser());



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



