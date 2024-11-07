package com.usei.usei.util;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.stereotype.Component;

@Component
public class PasswordEncoderDecoder {
    private static final String SECRET_KEY = "Proyecto_USEI"; // 13 caracteres
    private static final String ALGORITHM = "AES";

    public String encode(String password) throws Exception {
        SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(StandardCharsets.UTF_8), ALGORITHM);
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] passwordBytes = password.getBytes(StandardCharsets.UTF_8);
        byte[] encryptedPasswordBytes = cipher.doFinal(passwordBytes);
        return Base64.getEncoder().encodeToString(encryptedPasswordBytes);
    }

    public String decode(String encryptedPassword) throws Exception {
        SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(StandardCharsets.UTF_8), ALGORITHM);
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, secretKey);
        byte[] decodedPasswordBytes = Base64.getDecoder().decode(encryptedPassword);
        byte[] originalPasswordBytes = cipher.doFinal(decodedPasswordBytes);
        return new String(originalPasswordBytes, StandardCharsets.UTF_8);
    }
}
