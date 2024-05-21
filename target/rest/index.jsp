<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
            color: #495057;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        h2 {
            font-weight: 600;
            color: #343a40;
            text-align: center;
            margin-bottom: 30px;
        }
        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .card-header {
            background-color: #6c757d;
            color: #fff;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            padding: 20px;
            margin: 0;
        }
        .card-body {
            padding: 20px;
        }
        .input-field input[type="text"],
        .input-field input[type="number"] {
            border: 2px solid #6c757d;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            font-weight: 500;
            color: #495057;
            margin-bottom: 10px;
        }
        .input-field input[type="text"]:focus,
        .input-field input[type="number"]:focus {
            border-color: #5a6268;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .btn {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .check-link {
            text-align: center;
            margin-top: 20px;
        }
        .check-link a {
            color: #007bff;
            text-decoration: none;
            font-size: 16px;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        .check-link a:hover {
            color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 2px solid #dee2e6;
            padding: 12px;
            text-align: left;
            font-size: 16px;
            font-weight: 500;
            color: #343a40;
        }
        th {
            background-color: #6c757d;
            color: #fff;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script type="text/javascript">
    function addEmployee() {
        var employeeId = document.getElementById("employeeId").value;
        var firstname = document.getElementById("firstname").value;
        var lastname = document.getElementById("lastname").value;
        var points = document.getElementById("points").value;
        var website = document.getElementById("website").value;

        // Perform validation if needed

        // Send AJAX request to add employee
        $.ajax({
            type: "POST",
            url: "webapi/employees/employee",
            contentType: "application/json",
            data: JSON.stringify({
                "id": employeeId,
                "firstname": firstname,
                "lastname": lastname,
                "points": points,
                "website": website
            }),
            success: function(response) {
                // Handle success response
                M.toast({html: 'Employee added successfully!', classes: 'green'});
                console.log("Employee added successfully:", response);
                // Optionally, you can update the UI to reflect the addition
            },
            error: function(xhr, status, error) {
                // Handle error response
                M.toast({html: 'Error adding employee!', classes: 'red'});
                console.error("Error adding employee:", error);
                // Optionally, you can show an error message to the user
            }
        });
    }

    function updateEmployee() {
        var employeeId = document.getElementById("updateId").value;
        var firstname = document.getElementById("updateFirstname").value;
        var lastname = document.getElementById("updateLastname").value;
        var points = document.getElementById("updatePoints").value;
        var website = document.getElementById("updateWebsite").value;

        // Perform validation if needed

        // Send AJAX request to update employee
        $.ajax({
            type: "PUT",
            url: "webapi/employees/edit",
            contentType: "application/json",
            data: JSON.stringify({
                "id": employeeId,
                "firstname": firstname,
                "lastname": lastname,
                "points": points,
                "website": website
            }),
            success: function(response) {
                // Handle success response
                M.toast({html: 'Employee updated successfully!', classes: 'green'});
                console.log("Employee updated successfully:", response);
                // Optionally, you can update the UI to reflect the update
            },
            error: function(xhr, status, error) {
                // Handle error response
                M.toast({html: 'Error updating employee!', classes: 'red'});
                console.error("Error updating employee:", error);
                // Optionally, you can show an error message to the user
            }
        });
    }

    function deleteEmployee() {
        var employeeId = document.getElementById("updateId").value;

        // Perform validation if needed

        // Send AJAX request to delete employee
        $.ajax({
            type: "DELETE",
            url: "webapi/employees/delete/" + employeeId,
            success: function(response) {
                // Handle success response
                M.toast({html: 'Employee deleted successfully!', classes: 'green'});
                console.log("Employee deleted successfully:", response);
                // Optionally, you can update the UI to reflect the deletion
            },
            error: function(xhr, status, error) {
                // Handle error response
                M.toast({html: 'Error deleting employee!', classes: 'red'});
                console.error("Error deleting employee:", error);
                // Optionally, you can show an error message to the user
            }
        });
    }

    function checkDatabase() {
        window.location.href = "webapi/employees";
    }

    document.addEventListener('DOMContentLoaded', function() {
        var elems = document.querySelectorAll('.tooltipped');
        var instances = M.Tooltip.init(elems, {});
    });
</script>
</head>
<body>
    <div class="container">
        <h2>Employee Management</h2>

        <!-- Form to add employee -->
        <div class="card">
            <div class="card-header">
                <h4>Add Employee</h4>
            </div>
            <div class="card-body">
                <form id="addEmployeeForm">
                    <div class="input-field">
                        <input id="employeeId" type="number" class="validate">
                        <label for="employeeId">ID</label>
                    </div>
                    <div class="input-field">
                        <input id="firstname" type="text" class="validate">
                        <label for="firstname">First Name</label>
                    </div>
                    <div class="input-field">
                        <input id="lastname" type="text" class="validate">
                        <label for="lastname">Last Name</label>
                    </div>
                    <div class="input-field">
                        <input id="points" type="number" class="validate">
                        <label for="points">Points</label>
                    </div>
                    <div class="input-field">
                        <input id="website" type="text" class="validate">
                        <label for="website">Website</label>
                    </div>
                    <button type="button" onclick="addEmployee()" class="btn">Add Employee</button>
                </form>
            </div>
        </div>

        <!-- Link to check the database -->
        <div class="check-link">
            <a href="javascript:void(0)" onclick="checkDatabase()">Check Database</a>
        </div>

        <!-- Employee table -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Points</th>
                    <th>Website</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="number" id="updateId" placeholder="Employee ID"></td>
                    <td>
                        <input type="text" id="updateFirstname" placeholder="First Name">
                    </td>
                    <td>
                        <input type="text" id="updateLastname" placeholder="Last Name">
                    </td>
                    <td>
                        <input type="number" id="updatePoints" placeholder="Points">
                    </td>
                    <td>
                        <input type="text" id="updateWebsite" placeholder="Website">
                    </td>
                    <td>
                        <button onclick="updateEmployee()" class="btn">Update</button>
                        <button onclick="deleteEmployee()" class="btn red">Delete</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
