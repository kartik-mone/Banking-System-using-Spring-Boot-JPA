<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Bank Accounts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 20px;
        }

        .header {
            background-color: #2c3e50;
            color: white;
            padding: 30px 20px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        .search-container {
            text-align: center;
            margin: 20px auto;
        }

        .search-container input[type="text"] {
            padding: 10px;
            width: 300px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #27ae60;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
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
    </style>
</head>
<body>

<div class="header">
    <h1>All Customer Accounts</h1>
    <div style="text-align: left; margin: 20px;">
        <a href="/" class="back-link">← Back to Index</a>
    </div>
</div>

<div class="search-container">
    <input type="text" id="searchInput" placeholder="Search by Account Number or Name">
</div>

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
        <c:forEach var="acc" items="${accounts}">
            <tr>
                <td>${acc.account_id}</td>
                <td>${acc.accountNumber}</td>
                <td>${acc.holder_name}</td>
                <td>${acc.account_type}</td>
                <td>${acc.balance}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<script>
    const searchInput = document.getElementById("searchInput");
    const table = document.getElementById("accountsTable");
    const rows = table.getElementsByTagName("tbody")[0].getElementsByTagName("tr");

    searchInput.addEventListener("keyup", function () {
        const filter = searchInput.value.toLowerCase();

        for (let i = 0; i < rows.length; i++) {
            const accountNumber = rows[i].cells[1].textContent.toLowerCase();
            const holderName = rows[i].cells[2].textContent.toLowerCase();

            if (accountNumber.includes(filter) || holderName.includes(filter)) {
                rows[i].style.display = "";
            } else {
                rows[i].style.display = "none";
            }
        }
    });
</script>

</body>
</html>
