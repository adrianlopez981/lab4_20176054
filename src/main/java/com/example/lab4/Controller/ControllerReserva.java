package com.example.lab4.Controller;

import com.example.lab4.Entity.User;
import com.example.lab4.Entity.Vuelo;
import com.example.lab4.Repository.ReservaRepository;
import com.example.lab4.Repository.UserRepository;
import com.example.lab4.Repository.VueloRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/reserva")
public class ControllerReserva {

    final VueloRepository vueloRepository;
    final ReservaRepository reservaRepository;

    final UserRepository userRepository;

    public ControllerReserva(VueloRepository vueloRepository, ReservaRepository reservaRepository, UserRepository userRepository) {
        this.vueloRepository = vueloRepository;
        this.reservaRepository = reservaRepository;
        this.userRepository = userRepository;
    }


    @PostMapping("/nuevaReserva")
    public String nuevaReserva(Model model, @RequestParam("id_vuelo") int id_vuelo, @RequestParam("precio") int precio,
                               @RequestParam("id_user") int id_user){


        Optional<User> usuario2= userRepository.findById(id_user);

        User usr = usuario2.get();


        List<User> listaUser = userRepository.findByCredentials(usr.getEmail(), usr.getPassword());

        User usuario = listaUser.get(0);

        List<Vuelo> listaVuelos = vueloRepository.findAll();





        System.out.println(precio);
        System.out.println(id_user);
        System.out.println(id_vuelo);

        reservaRepository.ingresarNuevaReserva(precio,id_vuelo,id_user);

        model.addAttribute("listaVuelos", listaVuelos);
        model.addAttribute("user", usuario);


        return "homePage";


    }
}
