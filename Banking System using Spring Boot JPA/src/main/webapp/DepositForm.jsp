<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deposit Amount</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .header {
            background-color: #2c3e50;
            color: white;
            padding: 30px 20px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .back-link {
            display: inline-block;
            background-color: #27ae60;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 20px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .back-link:hover {
            background-color: #1e8449;
            transform: translateY(-2px);
        }

        .form-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            padding: 30px;
        }

        .deposit-form {
            background: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
            margin-bottom: 20px;
        }

        .deposit-form h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        .btn-submit {
            background-color: #27ae60;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #1e8449;
        }

        .alert {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 6px;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }

        .account-details {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 25px;
            max-width: 600px;
            width: 100%;
        }

        .account-details h3 {
            margin-top: 0;
            color: #2c3e50;
        }

        .account-details p {
            margin: 10px 0;
            font-size: 16px;
        }
        
 		table {
		    width: 90%;
		    margin: 20px auto;
		    border-collapse: collapse;
		    background: #ffffff;
		    box-shadow: 0 0 10px rgba(0,0,0,0.1);
		    border-radius: 12px;
		    overflow: hidden;
		}
		
		th, td {
		    padding: 14px 18px;
		    text-align: left;
		    font-size: 16px;
		    border-bottom: 1px solid #ddd;
		}
		
		th {
		    background-color: #27ae60;
		    color: #ffffff;
		    font-size: 18px;
		}
		
		tr:hover {
		    background-color: #f9f9f9;
		}

    </style>
</head>
<body>

<div class="header">
    <h1>Deposit Amount</h1>
    <div style="text-align: left; margin: 20px;">
        <a href="/" class="back-link">← Back to Index</a>
    </div>
</div>

<div class="form-wrapper">
    <form action="/depositamount" method="post" class="deposit-form">
        <h2>Make a Deposit</h2>

        <!-- Alert messages inside the form -->
        <c:if test="${not empty message}">
            <div class="alert alert-success"><center> ${message} </center></div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="alert alert-danger"><center> ${error} </center></div>
        </c:if>

        <div class="form-group">
            <label for="accountNo">Account Number</label>
            <input type="text" id="accountNo" name="accountNumber" required>
        </div>
        <div class="form-group">
            <label for="amount">Amount</label>
            <input type="number" id="amount" name="balance" step="0.01" required>
			<input type="hidden" name="amount" value="deposit" />

        </div>
        <button type="submit" class="btn-submit">Deposit</button>
    </form>

  
    <c:if test="${not empty amount}">
        <table id="accountsTable">
		    <thead>
		        <tr>
		            <th>ID</th>
		            <th>Account Number</th>
		            <th>Holder Name</th>
		            <th>Account Type</th>
		            <th>Total Balance</th>
		        </tr>
		    </thead>
		    <tbody>
		        
		            <tr>
		                <td>${amount.account_id}</td>
		                <td>${amount.accountNumber}</td>
		                <td>${amount.holder_name}</td>
		                <td>${amount.account_type}</td>
		                <td>${amount.balance}</td>
		            </tr>
		    </tbody>
		</table>
    </c:if>
</div>

</body>
</html>
