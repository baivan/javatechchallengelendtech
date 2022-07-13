
package james.dtonechallenge.models;

/**
 *
 * @author james
 */
public class Transaction {
    int transactionId;
    int transactionTypeId;
    double amount;
    String benefitiaryName;
    String benefitiaryAccount;
    

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public int getTransactionTypeId() {
        return transactionTypeId;
    }

    public void setTransactionTypeId(int transactionTypeId) {
        this.transactionTypeId = transactionTypeId;
    }

    
    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getBenefitiaryName() {
        return benefitiaryName;
    }

    public void setBenefitiaryName(String benefitiaryName) {
        this.benefitiaryName = benefitiaryName;
    }

    public String getBenefitiaryAccount() {
        return benefitiaryAccount;
    }

    public void setBenefitiaryAccount(String benefitiaryAccount) {
        this.benefitiaryAccount = benefitiaryAccount;
    }
    
}
