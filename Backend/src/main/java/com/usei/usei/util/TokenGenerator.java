package com.usei.usei.util;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class TokenGenerator {

    private final SecretKey secretKey;

    public TokenGenerator() {
        // Generar una clave secreta. En un entorno de producción, deberías mantenerla segura y usar la misma clave cada vez.
        this.secretKey = Keys.secretKeyFor(SignatureAlgorithm.HS256);
    }

    public String generateToken(String id, String type, String username, int minutes) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("id", id);
        claims.put("type", type);
        claims.put("username", username);

        long expirationTime = minutes * 60 * 1000;  // Convertir minutos a milisegundos

        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + expirationTime))
                .signWith(secretKey)
                .compact();
    }

    public Jws<Claims> validateAndParseToken(String token) {
        if (token != null && token.startsWith("Bearer ")) {
            token = token.substring(7);
        }
        try {
            return Jwts.parserBuilder()
                    .setSigningKey(secretKey)
                    .build()
                    .parseClaimsJws(token);
        } catch (JwtException exception) {
            System.err.print("Token inválido: " + exception.getMessage());
            return null;
        }
    }
}
