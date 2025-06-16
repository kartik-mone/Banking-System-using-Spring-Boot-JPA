package com.jpa_practice3.JPA.Practice._5.to._1.Controller;


import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.jpa_practice3.JPA.Practice._5.to._1.entities.Account;
import com.jpa_practice3.JPA.Practice._5.to._1.entities.AccountTransferWrapper;
import com.jpa_practice3.JPA.Practice._5.to._1.services.AccountServices;

@Controller
public class JPA_Controller {
		
	@Autowired
	AccountServices accServices;

	
	@GetMapping("/")
	public String homePage()
	{
	return "index.jsp";

	}
	
	@GetMapping("/newacc")
	public String newAccount(){
		return "NewAccount.jsp";
	}
	
	@PostMapping("/createAccount")
	public String addAccount (@ModelAttribute  Account obj, Model model){
		
		boolean success = accServices.insertNewAccount(obj);

		
		if (success) {
	            model.addAttribute("message", "Account Created successfully!");
	        } else {
	            model.addAttribute("error", "Failed to add user. Account No. is already exist.");
	        }

	     return "NewAccount.jsp";
	}
	
	@GetMapping("/allAccounts")
	public String showAllAccounts(Model model) {
		List<Account> accounts = accServices.getAllAccounts();
	    model.addAttribute("accounts", accounts);
	    return "accountdetails.jsp"; 
	
	}

	@PostMapping("/searchaccno")
	public String searchaccno(String accountNumber, Model model) {
		Account obj = accServices.searchAccountData(accountNumber);
		model.addAttribute("acc", obj);
	    return "index.jsp"; 

	}
	
	@GetMapping("/deposit")
	public String addmoney() {
		
	    return "DepositForm.jsp"; 

	}
	
	@PostMapping("/depositamount")
	public String accTransact (String accountNumber, Double balance, String amount, Model model){
		
		boolean success = accServices.updatebalance(accountNumber, balance, amount);
		
		if (success) {
			Account updatedAcc = accServices.searchAccountData(accountNumber); 
	        model.addAttribute("message", "Amount Deposited successfully!");
	        model.addAttribute("amount", updatedAcc);  
        } else {
            model.addAttribute("error", "Failed to add Amount. Account No. is Not exist.");
        }
		return "DepositForm.jsp";
	
	}
	  
	@GetMapping("/withdraw")
	public String withdrawpage() {
		return "WithdrawForm.jsp";
	}
	
	@PostMapping("/withdrawamount")
	public String withdrawamount(String accountNumber, Double balance, String amount, Model model) {
		
		boolean success = accServices.updatebalance(accountNumber, balance, amount);
		
		if (success) {
			Account updatedAcc = accServices.searchAccountData(accountNumber); 
	        model.addAttribute("message", "Withdraw Amount successfully!");
	        model.addAttribute("amount", updatedAcc);  
        } else {
            model.addAttribute("error", "Failed to Withdraw Amount. Account No. is Not exist.");
        }
		return "WithdrawForm.jsp";
	}
	
	@GetMapping("/transfer")
	public String transfer(){
		return "TransferForm.jsp";
	}
	
//	@PostMapping("/transferamount")
//	public String transferAmount(String fromaccount, String toaccount, float amount, Model model) {
//		
//	    boolean success = accServices.transamount(fromaccount, toaccount, amount);
//
//	    if (success) {
//	    	Account senderAccount = accServices.searchAccountData(fromaccount);
//
//	        model.addAttribute("message", "Amount transferred successfully!");
//	        model.addAttribute("amount", senderAccount);
//	    } else {
//	        model.addAttribute("error", "Failed to transfer amount. Please check account details or balance.");
//	    }
//	    return "TransferForm.jsp";
//	}
	
	@PostMapping("/transferamount")
	public String transferAmount(@ModelAttribute AccountTransferWrapper wrapper, Model model) {
	    boolean success = accServices.funtransfer(wrapper);

	    if (success) {
	        Account senderAccount = accServices.searchAccountData(wrapper.getFromaccount());
	        model.addAttribute("message", "Amount transferred successfully!");
	        model.addAttribute("amount", senderAccount);
	    } else {
	        model.addAttribute("error", "Failed to transfer amount. Please check account details or balance.");
	    }
	    return "TransferForm.jsp";
	}
	
	
	
	
	@GetMapping("/closeaccount")
	public String claseacc(){
		return "CloseAccountForm.jsp";
	}

	@PostMapping("/delacc")
	public String delacc(String accountNumber, Model model) {
		
	    boolean success = accServices.delacc(accountNumber);

	    if (success) {

	        model.addAttribute("message", "Account Delete successful!");
	        
	    } else {
	        model.addAttribute("error", "Failed to Delete Account. Account No. is Not Found.");
	    }
	    return "CloseAccountForm.jsp";
	}
	
	@GetMapping("/deduct")
	public String deduct(){
		return "DeductForm.jsp";
	}
	
	@PostMapping("/dedamt")
	public String deductAmount(String type, float amount, Model model) {
		
	    boolean success = accServices.deductAmount(type, amount);

	    if (success) {

	        model.addAttribute("message", "Amount Deducted successfully");
	        
	    } else {
	        model.addAttribute("error", "Failed to Deducted Amount");
	    }
	    return "DeductForm.jsp";
	}
}
