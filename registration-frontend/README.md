# registration-frontend

## Notes that might be helpful when introducing people to elm
1. When running `elm init` mention how it mostly points you to the docs and why
1. The docs give tips on how to design your project structure (or rather that you shouldn't). Mention this and take it up again once the first file has grown in size (basically no premature optimization)
1. Create a `Main.elm` file
1. Run the compiler, write the sample code -> No `index.html` is present
1. Point to the docs and `Browser.sandbox`, start implementing and before it gets confusing, explain the Elm architecture
1. Once the basic form is finished:

    1. We are using every type we can (Msg and Model), but none of them have anything to do with HTTP calls. So apparently we are at an end with Browser.sandbox and have to switch to the next level (reference to project structure design)
    1. Switch to Browser.element -> Great example of refactoring via compiler driven development