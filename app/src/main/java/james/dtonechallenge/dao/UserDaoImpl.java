/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package james.dtonechallenge.dao;

import james.dtonechallenge.models.User;
import james.dtonechallenge.utils.Utility;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author james
 */
public class UserDaoImpl implements UserDao {

    /**
     *
     * @param id
     * @return User
     */
    @Override
   public User findById(int id) {
        Connection conn = null;
        PreparedStatement stmt;

        Utility utility = new Utility();
        try {
            conn = utility.getConnection();
            stmt = conn.prepareStatement("SELECT p.profileId,p.fullname,b.balance "
                    + "from profiles p join profile_balance b on "
                    + "p.profileId=b.profileId where p.profileId=?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("profileId"));
                user.setFullname(rs.getString("fullname"));
                user.setBalance(rs.getFloat("balance"));
                return user;
            }
            else {
                return null;
            }

        } catch (SQLException e) {
            // e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            utility.closeConnection(conn);
        }
    }

}
