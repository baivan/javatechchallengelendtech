
package james.dtonechallenge.dao;

import james.dtonechallenge.models.User;

/**
 *
 * @author james
 */
public interface UserDao {
   
    public User findById(int id);
}
