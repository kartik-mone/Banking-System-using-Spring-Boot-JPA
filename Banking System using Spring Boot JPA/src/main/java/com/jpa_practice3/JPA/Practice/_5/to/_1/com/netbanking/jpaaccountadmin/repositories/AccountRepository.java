package com.jpa_practice3.JPA.Practice._5.to._1.com.netbanking.jpaaccountadmin.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jpa_practice3.JPA.Practice._5.to._1.entities.Account;



@Repository
public interface AccountRepository extends JpaRepository<Account, Integer> {
	
	Account findByAccountNumber(String accountNumber);
	
	
	@Modifying // Indicates that this query is not a SELECT/READ operation, but an UPDATE/DELETE operation
	@Transactional // Ensures that the update happens inside a transaction (commit/rollback management)
	
	@Query("UPDATE Account a SET a.balance = a.balance - :amount WHERE a.account_type = :type") // JPQL(JPA Query Language) to update balances
	void deductAmountFromAccounts(String type, float amount);
	
	
	@Modifying
	@Transactional

	@Query(value="Call transfer(:fromaccount, :toaccount, amount)", nativeQuery = true)
	void transferMoneyBetweenAccounts(String fromaccount, String toaccount, float amount);

}
