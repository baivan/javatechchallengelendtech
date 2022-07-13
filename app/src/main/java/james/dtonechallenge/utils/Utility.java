/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package james.dtonechallenge.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.InvalidKeyException;
import java.io.IOException;
import java.security.Key;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.time.Instant;
import static java.time.Instant.now;
import java.time.temporal.ChronoUnit;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author james
 */
public class Utility {

    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/dzemotechchallenge";
    private static final String ID = "dzemotechchallenge";
    private static final String PASS = "!23$QwerTR";
      private static final  String secret = "asdfSFS34wfsdfsdfSDSD32dfsddDDerQSNCK34SOWEK5354fdgdf4";

    public Connection getConnection() {
        try {
            return DriverManager.getConnection(DB_URL, ID, PASS);
        } catch (SQLException e) {
            // e.printStackTrace();
                    writeLogs(Level.SEVERE,e.toString());

            throw new RuntimeException(e);
        }
    }

    public void closeConnection(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                // e.printStackTrace();
                                    writeLogs(Level.SEVERE,e.toString());

                throw new RuntimeException(e);
            }
        }
    }

    public static boolean authenticateBearer(String bearerToken) {
        String[] parts = bearerToken.trim().split(" ");
        if (parts.length == 2) {
            Jws<Claims> claims=  parseJwt(parts[1]);
             
            if ( claims.getBody().get("email").equals("jamesnjuguna0@gmail.com") ) {
                return true;
            }

        }
        return false;
    }

    public static HashMap<String, String> unauthorisedError() {
        HashMap<String, String> message = new HashMap<>();
        message.put("code", "403");
        message.put("Message", "Please login to contunue ");
        writeLogs(Level.INFO,message.toString());

        return message;

    }

    public static HashMap<String, String> serverError() {
        HashMap<String, String> message = new HashMap<>();
        message.put("code", "500");
        message.put("Message", "An error occured please try again later  ");
        
        writeLogs(Level.SEVERE,message.toString());

        return message;

    }

    public static HashMap<String, String> dataError(String me) {
        HashMap<String, String> message = new HashMap<>();
        message.put("code", "402");
        message.put("Message", me);

        return message;

    }

    public static String generateToken() {

       Key hmacKey = new SecretKeySpec(Base64.getDecoder().decode(secret),
                SignatureAlgorithm.HS256.getJcaName());
         Instant now = Instant.now();
        try{
             String jwtToken = Jwts.builder()
                .claim("name", "James Njuguna")
                .claim("email", "jamesnjuguna0@gmail.com")
                .setSubject("james")
                .setId(UUID.randomUUID().toString())
                .setIssuedAt(Date.from(now))
                .setExpiration(Date.from(now.plus(5l, ChronoUnit.DAYS)))
                .signWith(hmacKey)
                .compact();
            return jwtToken;
           
        }
        catch (InvalidKeyException e){
            return e.toString();
        }
        
         
       
       
    }

    public static Jws<Claims> parseJwt(String jwtString) {
        String secret = "asdfSFS34wfsdfsdfSDSD32dfsddDDerQSNCK34SOWEK5354fdgdf4";
        Key hmacKey = new SecretKeySpec(Base64.getDecoder().decode(secret),
                SignatureAlgorithm.HS256.getJcaName());

        
        
        
        Jws<Claims> jwt = Jwts.parserBuilder()
                .setSigningKey(hmacKey)
                .build()
                .parseClaimsJws(jwtString);

        return jwt;
    }
    
    public static void writeLogs(Level level, String logMessage){
         FileHandler handler = null;
        try {
            handler = new FileHandler("system.log", true);
        } catch (IOException | SecurityException ex) {
            Logger.getLogger(Utility.class.getName()).log(Level.SEVERE, null, ex);
        }

         Logger logger = Logger.getLogger("james.dtonechallenge");
        logger.addHandler(handler);
        logger.log(level, logMessage);
    }
}
