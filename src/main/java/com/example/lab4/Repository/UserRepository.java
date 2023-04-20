package com.example.lab4.Repository;

import com.example.lab4.Entity.Aerolinea;
import com.example.lab4.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserRepository extends JpaRepository<User,Integer> {

    @Query(value= "select * from user where email = ?1 and password = ?2",
            nativeQuery = true)
    List<User> findByCredentials(String correo, String password);



}
