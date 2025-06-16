<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f4f4;
            padding-top: 40px;
        }

        .brand-bar {
            background-color: white;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            padding: 15px 30px;
            
        }

        .brand-bar h3 {
            margin: 0;
            color: #27ae60;
            font-weight: bold;
        }

        .nav-options {
            background-color: #f0f0f0;
            padding: 10px 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .nav-options .nav-link {
            color: #333;
            font-weight: 500;
            padding: 10px 20px;
        }

        .nav-options .nav-link:hover {
            background-color: #e2e6ea;
            border-radius: 5px;
        }

        .search-form {
            max-width: 500px;
            margin: 30px auto 20px;
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .table-container {
            margin-top: 30px;
        }

        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 7px 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-weight: bold;
        }

        th {
            background: #27ae60;
            color: white;
            font-weight: bold;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
        
        .btn-submit {
            background-color: #27ae60;
            color: white;
            border: none;
            padding: 8px;
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
    </style>
</head>
<body>

<!-- Branding Bar -->
<div class="brand-bar">
    <center><h3>Admin Dashboard</h3></center>
</div>

<!-- Navigation Bar -->
<div class="nav-options d-flex justify-content-center">
    <a class="nav-link" href="/newacc">Open Account</a>
    <a class="nav-link" href="/allAccounts">View Accounts</a>
    <a class="nav-link" href="/deposit">Deposit</a>
    <a class="nav-link" href="/withdraw">Withdraw</a>
    <a class="nav-link" href="/transfer">Transfer Money</a>
    <a class="nav-link" href="/closeaccount">Close Account</a>
    <a class="nav-link" href="/deduct">Deduct Charges from Accounts</a>
</div>

<!-- Search Form -->
<form action="/searchaccno" method="post" class="search-form">
    <label for="accountNumber" class="form-label fw-semibold">Search by Account Number</label>
    <input type="text" id="accountNumber" name="accountNumber" required class="form-control mb-3" placeholder="Enter Account Number" autocomplete="off">
    <input type="submit" value="Search" class="btn-submit">
</form>

<!-- Accounts Table -->
<div class="table-container">
    <table id="accountsTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Account Number</th>
                <th>Holder Name</th>
                <th>Account Type</th>
                <th>Balance</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${acc.account_id}</td>
                <td>${acc.accountNumber}</td>
                <td>${acc.holder_name}</td>
                <td>${acc.account_type}</td>
                <td>${acc.balance}</td>
            </tr>
        </tbody>
    </table>
</div>

</body>
</html>
