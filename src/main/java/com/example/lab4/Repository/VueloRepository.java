package com.example.lab4.Repository;

import com.example.lab4.Entity.Aerolinea;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VueloRepository extends JpaRepository<Aerolinea,Integer> {
}
