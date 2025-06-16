<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Close Account - NetBanking Admin</title>
    <style>
        /* --- Same Styling as Fund Transfer Page --- */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #2c3e50;
            color: white;
            padding: 30px 20px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .header h1 {
            margin: 0;
            font-size: 2.4rem;
        }

        .container {
            max-width: 700px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
            padding: 30px;
        }

        h2 {
            color: #2c3e50;
            margin-top: 0;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            font-size: 1rem;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #c0392b;
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
        }

        .back-link:hover {
            background-color: #1e8449;
            transform: translateY(-2px);
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
    </style>
</head>
<body>

<div class="header">
    <h1>Close Account</h1>
    <p>Delete an existing account securely.</p>
    <div style="text-align: left; margin-top: 10px;">
        <a href="/" class="back-link">← Back to Index</a>
    </div>
</div>

<div class="container">
    <div class="card">
        <h2>Close Account Form</h2>

        <!-- Show success or error messages -->
        <c:if test="${not empty message}">
            <div class="alert alert-success">
                <center> ${message} </center>
            </div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                <center> ${error} </center>
            </div>
        </c:if>

        <form action="/delacc" method="post">
            <div class="form-group">
                <label for="accountNumber">Account Number</label>
                <input type="text" name="accountNumber" id="accountNumber" required />
            </div>

            <center><button type="submit" class="btn">Close Account</button></center>
        </form>
        
    </div>
</div>

</body>
</html>
