package br.com.fiap.MottuBracelet.repository;

import br.com.fiap.MottuBracelet.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    
    Optional<Usuario> findByUsername(String username);
    
    Optional<Usuario> findByEmail(String email);
    
    boolean existsByUsername(String username);
    
    boolean existsByEmail(String email);
    
    @Query("SELECT u FROM Usuario u JOIN FETCH u.roles WHERE u.username = :username")
    Optional<Usuario> findByUsernameWithRoles(@Param("username") String username);
}