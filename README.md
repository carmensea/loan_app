# BOA Loan App

## Summary

A digital portal that allows Bank of America customers to login and
upload their loan applications to Bank of America's Box account. The portal
also extends to Bank of America employees, allowing them to log into their
admin account and download files uploaded by customers.
![Box-App](https://github.com/carmensea/loan_app/blob/master/upload_page.png)
## Models

### BoxAdapter

BoxAdapter is the gateway to Box by relying on the Boxr gem. This model
supports sending a file, downloading a file, and viewing all files.

### Document

Document model is used to keep track of every file uploaded to the server,
regardless of a successful Box upload.  This could later be used for logging and upload metrics.

### User

There are two types of users: Employess and Customers, or Users and Admin-Users.
The signup page can be used by both employees and customers. Employees will require
the IT department or Dev team to update their account to become an admin. Once equipped with an
admin account, an employee has access to view the uploads page to view all customer files.
Customers only have access to the uploading page and login page. 

## Views

### Uploads

Uploads is an admin-facing page that lists all files that are stored in Box.
It redirects to the login page if a user is not logged in and to the file uploading
page if a user is logged in as a customer.

### Downloads

Downloads is a customer-facing page that allows users to upload to Box.

### Signup & Login

Signup and Login are both employee-facing and customer-facing. Users are redirected
to their appropriate view based on permissions.

## Controllers

### Users

The Users controller is used for creating new users.

### Sessions

The Sessions controller is used for signing users in and redirecting
if they somehow return to a login page while being logged in.

### Documents

The Documents controller has two before filters. If a non-admin user
attempts to view the uploads page, they are redirected to the uploading
page. If a non-user attempts to view any page, they are redirected to login.

## Post MVP
 - Organize customer uploads into customer specific folders.
