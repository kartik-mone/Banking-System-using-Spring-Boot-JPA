# Banking System using Spring Boot JPA

## Overview

This project is a **Banking System** developed using **Spring Boot**, **Spring Data JPA**, and **MySQL**. It enables admin-level operations such as account creation, user management, fund transfers, and transaction history tracking. The system uses JSP for the frontend and follows a layered architecture (Controller → Service → Repository).

---

##  Tech Stack

- **Backend**: Java, Spring Boot, Spring Data JPA
- **Frontend**: JSP, HTML, CSS, Bootstrap
- **Database**: MySQL
- **Build Tool**: Maven
- **IDE**: IntelliJ IDEA / Eclipse

---

## Features

-  Open a new bank account
-  Deposit money
-  Withdraw and deduct funds
-  Transfer money between accounts
-  View account details by account number
-  Close an account
-  Clean JSP-based UI with dedicated forms for each action

---

## Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/banking-system-springboot.git
   cd banking-system-springboot

2. **Configure the database**

Create a MySQL database named banking_db

Update application.properties:
```bash
spring.datasource.url=jdbc:mysql://localhost:3306/banking_db
spring.datasource.username=root
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=update
```
3. **Run the application**
Using terminal:
```bash
bash
mvn spring-boot:run
Or run the BankingSystemApplication.java from your IDE
```
4. **Access the Application**
```bash
Navigate to http://localhost:8080/admin for admin login/dashboard
```

5. **Project Structure**
```bash
src/
└── main/
├── java/
│ └── com/jpa_practice3/JPA/Practice/_5/to/_1/
│ ├── Controller/
│ │ └── JPA_Controller.java
│ ├── entities/
│ │ ├── Account.java
│ │ ├── AccountTransferWrapper.java
│ ├── services/
│ │ └── AccountServices.java
│ └── Application.java
├── resources/
└── webapp/
├── index.jsp
├── NewAccount.jsp
├── accountdetails.jsp
├── DepositForm.jsp
├── WithdrawForm.jsp
├── DeductForm.jsp
├── TransferForm.jsp
└── CloseAccountForm.jsp
```
6. **Resources Included**

- Database.sql - SQL schema for accounts
- HELP.md - Quick notes about setup
- JPA Initial Stepup.pdf - Step-by-step JPA setup guide
- Notes.txt - Personal notes about the project

---

Author
Kartik Mone

