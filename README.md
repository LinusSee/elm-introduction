# elm-introduction
This is a simple project to introduce people to Elm.

For viewing the project without any changes switch to the branch [feature/base-project](https://github.com/LinusSee/elm-introduction/tree/feature/base-project).

For viewing the final result after finishing the introduction switch to the branch [feature/full-implementation](https://github.com/LinusSee/elm-introduction/tree/feature/full-implementation).

## Project descriptions
### 1. angular-shell-application
This project exists only to include an elm application. It is to demonstrate how easy to is to either replace small elements of an existing codebase with elm or write standalone features in elm and integrate it in an existing codebase.

For the introduction, you only have to write or copy some javascript code for loading your elm javascript-file and include it in your angular application.


### 2. elm-buttons
This is a finished elm application and basically the elm [buttons example](https://guide.elm-lang.org/architecture/buttons.html).

You can use it as an example to integrate in your `angular-shell-application`


### 3. images
This simply contains some images that might be helpful during the presentation.

Right now the images are all about how strong elms error messages are.


### 4. registration-backend
This is the backend for the frontend we will be writing in the introduction.

It is kept simple by providing an endpoint to create a user via `POST localhost:8080/users` and returns a random UUID. It does not save any data.

You do not have to implement anything here.


### 5. registration-frontend
The main part of the introduction. The project folder is merely an empty husk to show where the project should be.

Start the introduction by deleting the husk and create a new project using `elm init`.
Then write a simple user registration form.

It should contain:
- Input fields for `username`, `password` and `password confirmation`
- An button to create the user
- An HTTP call to the `registration-backend` and display the resulting UUID

Optionally you can add a simple validations that the password and its confirmation match.



## Introduction structure
1. Start with a verbal introduction about elm. What do people already know, what do they want to know and what do you intend to show them
2. Implement the registration-frontend step by step. Starting with a `Browser.sandbox` project and moving to a `Browser.element` only when necessary is a good idea. Also compiler driven developement help give the introduction a well structured format and shows off elm error messages
3. Include either `elm-buttons` or your `registration-frontend` into the `angular-shell-application`
4. Either in the end or spread out during the talk, show the example images about elms error messages and add whatever experiences you made with elm or experiences others share in their talks about elm