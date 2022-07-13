/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package james.dtonechallenge.dao;

import james.dtonechallenge.models.Transaction;
import james.dtonechallenge.utils.Utility;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author james
 */
public class TransactionDaoImpl implements TransactionDao {
    private final String getTransactionQuery = "SELECT t.transactionId,t.amount,b.account,"
            + "b.benefitiaryName,wt.walletName,tt.type_name,tt.transactionTypeId "
            + "FROM `transactions` t join benefitiaries b on t.benefitiaryId=b.benefitiaryId "
            + "join wallet_types wt on b.walletTypeId=wt.walletTypeId join transaction_types tt "
            + "on t.transactionTypeId=tt.transactionTypeId WHERE t.profileId=? order by t.transactionId desc";
    
     private final String getTransactionDateQuery = "SELECT t.transactionId,t.amount,b.account,"
            + "b.benefitiaryName,wt.walletName,tt.type_name,tt.transactionTypeId "
            + "FROM `transactions` t join benefitiaries b on t.benefitiaryId=b.benefitiaryId "
            + "join wallet_types wt on b.walletTypeId=wt.walletTypeId join transaction_types tt "
            + "on t.transactionTypeId=tt.transactionTypeId WHERE t.profileId=? and Date(t.createdAt) between Date(?) and Date(?) order by t.transactionId desc";
    
    /**
     *
     * @param profileId as integer 
     * @return List<Transaction
     */
    @Override
    public List<Transaction> getProfileTransactions(int profileId) {
       
        Connection conn = null;
        PreparedStatement stmt;
         List<Transaction> transactions = new ArrayList<>();

        Utility utility = new Utility();
        try {
            conn = utility.getConnection();
            stmt = conn.prepareStatement(getTransactionQuery);
            stmt.setInt(1, profileId);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt("transactionId"));
                transaction.setAmount(rs.getFloat("amount"));
                transaction.setBenefitiaryAccount(rs.getString("account"));
                transaction.setBenefitiaryName(rs.getString("benefitiaryName"));
                transaction.setTransactionTypeId(rs.getInt("transactionTypeId"));
                
                transactions.add(transaction);
                
            }
           return transactions;

        } catch (SQLException e) {
            // e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            utility.closeConnection(conn);
        }
    
    }
    /**
     *
     * @param profileId as integer 
     * @param startDate as String
     * @param endDate as String
     * @return List<Transaction
     */
    @Override
    public List<Transaction> getProfileTransactionsFetchedByDate(int profileId, String startDate, String endDate) {
         Connection conn = null;
        PreparedStatement stmt;
         List<Transaction> transactions = new ArrayList<>();

        Utility utility = new Utility();
        try {
            conn = utility.getConnection();
            stmt = conn.prepareStatement(getTransactionDateQuery);
            stmt.setInt(1, profileId);
            stmt.setString(2, startDate);
            stmt.setString(3, endDate);
            System.out.println(stmt.toString());
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt("transactionId"));
                transaction.setAmount(rs.getFloat("amount"));
                transaction.setBenefitiaryAccount(rs.getString("account"));
                transaction.setBenefitiaryName(rs.getString("benefitiaryName"));
                transaction.setTransactionTypeId(rs.getInt("transactionTypeId"));
                
                transactions.add(transaction);
                
            }
           return transactions;

        } catch (SQLException e) {
            // e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            utility.closeConnection(conn);
        }
    }

   
    
}
