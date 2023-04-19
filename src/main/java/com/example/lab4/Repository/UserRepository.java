package com.example.lab4.Repository;

import com.example.lab4.Entity.Aerolinea;
import com.example.lab4.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserRepository extends JpaRepository<Aerolinea,Integer> {

    @Query(value= "select * from user where correo = ?1 and password = ?2",
            nativeQuery = true)
    User findByCredentials(String correo, String password);



}
