
package james.dtonechallenge.dao;

import james.dtonechallenge.models.Transaction;
import java.util.List;

/**
 *
 * @author james
 */
public interface TransactionDao {
    public List<Transaction> getProfileTransactions(int profileId);
    public List<Transaction> getProfileTransactionsFetchedByDate(int profileId,String startDate,String endDate);
}
