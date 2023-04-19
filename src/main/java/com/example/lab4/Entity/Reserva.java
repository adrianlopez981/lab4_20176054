package com.example.lab4.Entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Entity
public class Reserva {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idreserva;

    private Date fecha_reserva;
    private float precio_total;
    private String estado_pago;


    @ManyToOne
    @JoinColumn(name = "vuelo_id_vuelo")
    private Vuelo vuelo;

    @ManyToOne
    @JoinColumn(name = "user_iduser")
    private User user;





}
