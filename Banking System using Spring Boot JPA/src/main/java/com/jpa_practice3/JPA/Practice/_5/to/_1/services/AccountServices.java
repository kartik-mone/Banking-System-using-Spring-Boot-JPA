package com.jpa_practice3.JPA.Practice._5.to._1.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jpa_practice3.JPA.Practice._5.to._1.com.netbanking.jpaaccountadmin.repositories.AccountRepository;
import com.jpa_practice3.JPA.Practice._5.to._1.entities.Account;
import com.jpa_practice3.JPA.Practice._5.to._1.entities.AccountTransferWrapper;

@Service
public class AccountServices {
    
    @Autowired
    AccountRepository accRepo;
    
    public boolean insertNewAccount(Account obj) {
        try {
            accRepo.save(obj);  // Save account to the database
            return true;  
        } catch (Exception e) {
            System.out.println(e);
            return false;  
        }
    }
    
    public List<Account> getAllAccounts(){
    List<Account> accounts = accRepo.findAll();
    return accounts;
    
    }
    
    public Account searchAccountData(String accountNumber){
    
    	Account obj = accRepo.findByAccountNumber(accountNumber);
    	return obj;
    
    }
    
    public boolean updatebalance(String accountNumber, double balance, String amount) {
    	try {
    		Account obj = accRepo.findByAccountNumber(accountNumber);
    		
    		if(amount.equals("deposit")) {
    		obj.setBalance(obj.getBalance() + balance);
    			
    		}
    		else {
    		obj.setBalance(obj.getBalance() - balance);
    		
    		}
    		
    		accRepo.save(obj);
    		return true;
    	}
    	catch (Exception e) {
           System.out.println(e);
           return false;  
    	}
    }
    
 
//    public boolean transamount(String fromaccount, String toaccount, float amount) {
//        try {
//            Account sender = accRepo.findByAccountNumber(fromaccount);
//            Account receiver = accRepo.findByAccountNumber(toaccount);
//
//            if (sender == null || receiver == null) {
//                System.out.println("One of the accounts does not exist.");
//                return false;
//            }
//
//            if (sender.getBalance() < amount) {
//                System.out.println("Insufficient balance in sender's account.");
//                return false;
//            }
//
//            sender.setBalance(sender.getBalance() - amount);
//            receiver.setBalance(receiver.getBalance() + amount);
//
//            
//            accRepo.save(sender);
//            accRepo.save(receiver);
//
//            return true;
//        } catch (Exception e) {
//            System.out.println(e);
//            return false;
//        }
//    }
    
    public boolean delacc(String accountNumber) {
        try {
        	
            Account obj = accRepo.findByAccountNumber(accountNumber);
            
            if (obj != null) {
                System.out.println("Deleting account: " + obj.getHolder_name());
                accRepo.delete(obj);
                return true;
            } else {
                System.out.println("Account not found with account number: " + accountNumber);
                return false;
            }
            
        } catch (Exception e) {
            System.out.println("Error while deleting account: " + e.getMessage());
            return false;
        }
    }
    
    public boolean deductAmount(String type, float amount) {
        try {
            accRepo.deductAmountFromAccounts(type, amount);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
    public boolean funtransfer(AccountTransferWrapper wrapper) {
        try {
            String fromaccount = wrapper.getFromaccount();
            String toaccount = wrapper.getToaccount();
            float amount = wrapper.getAmount();

            if (accRepo.findByAccountNumber(fromaccount) != null &&
                accRepo.findByAccountNumber(toaccount) != null) {
                accRepo.transferMoneyBetweenAccounts(fromaccount, toaccount, amount);
            } else {
                throw new IllegalArgumentException("Either source or destination account does not exist.");
            }
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

}