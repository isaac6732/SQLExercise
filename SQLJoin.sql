/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 Select products.Name, categories.Name From products
 inner join categories on products.CategoryID = categories.CategoryID
 Where categories.Name = "Computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
Select products.Name,products.Price,reviews.Rating From products
Inner Join reviews On products.ProductID = reviews.ProductID
Where reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

Select employees.FirstName, employees.EmployeeID, Sum(sales.Quantity) as sold From employees 
Inner Join sales On employees.EmployeeID = sales.EmployeeID
Group by sales.EmployeeID
Order by sold Desc 
Limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

Select categories.Name as "categories",departments.name as "departments" From categories
Left Join departments on categories.DepartmentID = departments.DepartmentID
Where categories.Name ="Appliances" Or categories.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

Select products.Name "Product", 
Sum(sales.Quantity) as "Total Sold",
Sum(sales.Quantity * sales.PricePerUnit) as "Total made" 
From products Inner Join sales On products.ProductID = sales.ProductID
WHERE products.Name LIKE '%Hotel%' OR products.Name LIKE '%California%'
GROUP BY products.Name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

select products.name, reviews.Reviewer, reviews.Rating, reviews.Comment From products 
Inner Join reviews On products.ProductID = reviews.ProductID 
Where products.name Like "%Visio%" And reviews.Rating = 1

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */