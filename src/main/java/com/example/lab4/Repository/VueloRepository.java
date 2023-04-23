package com.example.lab4.Repository;

import com.example.lab4.Entity.Aerolinea;
import com.example.lab4.Entity.User;
import com.example.lab4.Entity.Vuelo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface VueloRepository extends JpaRepository<Vuelo,Integer> {


    @Query(value= "select * from vuelo",
            nativeQuery = true)
    List<Vuelo> findByListaVuelos();
}
