# BOA Loan App

## TODO

 - Make sure everything is responsive using bootstrap columns
 - Make and edit video
 - Write model tests for Box Adapter
 - Style X and Checkmark
 - Make tests pass again

## Summary

A digital portal that allows current Bank of America customers to login and
upload loan their applications to Bank of America's Box account. The portal
also extends to Bank of America employees. An employee can log into their
admin account and download uploaded files from customers.

## Models

### BoxAdapter

BoxAdapter is the gateway to Box. Within this model, customers make the
request to send a file, and employees can view all files or download them.
BoxAdapter relies on the Boxr gem.

### Document

Document model maintains a log of all filenames and creation data. The model is
used to keep track of every file uploaded.

### User

There are two types of users: Employess and Customers, or Users and Admin-Users.
The signup page can be used by both employees and customers. Employees will require
the IT department or Dev team to issue them an Admin account. Once equipped with an
admin account, an employee has access to view the uploads page (where customer files live).
Customers only have access to the uploading page and login page. 

## Views

### Uploads

Uploads is a customer-facing page that redirects to the login page if a user is not
logged in and to the uploading page a user is logged in, but does not have sufficient
permissions.

### Downloads

Downloads is an employee-facing page that a non-admin user would see.

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
 - Organize customer uploads into folders.
