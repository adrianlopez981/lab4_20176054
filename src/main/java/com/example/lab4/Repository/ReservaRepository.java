package com.example.lab4.Repository;

import com.example.lab4.Entity.Aerolinea;
import com.example.lab4.Entity.Reserva;
import jakarta.persistence.criteria.CriteriaBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface ReservaRepository extends JpaRepository<Reserva,Integer> {

    @Transactional
    @Modifying
    @Query(nativeQuery = true,value = "INSERT INTO reserva(fecha_reserva,precio_total,estado_pago,vuelo_idvuelo,user_iduser) values (now(),?1,'procesado',?2,?3)"
            )
    void ingresarNuevaReserva(int precio, int idvuelo, int iduser);


}
