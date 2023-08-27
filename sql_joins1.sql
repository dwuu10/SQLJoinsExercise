/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select P.Name, C.Name
 from products as P
 inner join categories as C on C.CategoryID = P.CategoryID
 where C.Name = 'Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select P.Name, P.Price, R.Rating
 from products as P
 inner join reviews as R on R.ProductID = P.ProductID
 where R.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName, e.LastName, sum(s.Quantity) as total from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by total desc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select C.Name, D.Name
from categories as C
inner join departments as D on D.DepartmentID = C.DepartmentID
where C.Name = 'Appliances' or C.Name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select P.Name, sum(s.Quantity) as 'total sold', sum(s.Quantity * s.PricePerUnit) as 'total price' 
from products as P
inner join sales as s on s.ProductID = P.ProductID
where P.Name = 'Eagles: Hotel California';
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select P.Name, R.Reviewer, R.Rating, R.Comment
from products as P
inner join reviews as R on R.ProductID = P.ProductID
where P.Name = 'Visio TV' and R.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select e.EmployeeID, e.FirstName, e.LastName, p.Name, sum(s.Quantity) as totalSold
from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
inner join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID