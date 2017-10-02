# Soding Task App

A simple application to manage tasks list.


## How To Use It

The application is deployed to [Heroku](https://shrouded-tor-71866.herokuapp.com/).

The user needs to sign up first. On successful signing up, the user can maintain his tasks list by clicking at the link 'Tasks' at top. In the task list page, the user can view all his added tasks. From the same page, the user can also create/modify new task and delete a task.


### Installing

A step by step process to get a development environment running

#### Prerequisite

* Ruby version: 2.3.1

* Rails version: 5.1.4

* Database Configuration: Used Postgresql. Setup postgres before installing the app


#### Setup in development

Firstly, clone from git and then run ``bundle install``

Next, create the database & migrate for development.

```
$ rails db:create
```

```
$ rails db:migrate
```

And then run the rails server by ``rails s``


## Running the tests

Migrate the database for test environment:

```
$ rails db:migrate test
```

Next, run the test by ``rspec``


## Author

* **Sajid Rabbani** - [sjdrabbani](https://github.com/sjdrabbani)

