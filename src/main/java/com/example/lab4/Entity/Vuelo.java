package com.example.lab4.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;


@Getter
@Setter
@Entity
public class Vuelo {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idvuelo;
    private String origen;

    private String destino;
    private Date fecha_salida;

    private Date fecha_llegada;

    private int duracion;

    private float precio;

    private int asientos_disponibles;

    private String descripcion;

    @ManyToOne
    @JoinColumn(name = "aerolinea_idaerolinea")
    private Aerolinea aerolinea;






}
