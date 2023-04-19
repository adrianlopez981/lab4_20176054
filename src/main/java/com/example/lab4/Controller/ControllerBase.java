package com.example.lab4.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("")
@Controller

public class ControllerBase {

    @GetMapping("")
    public String vistaInicio() {
        return "inicio";
    }



}
