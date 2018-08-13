# README

Here's a basic (and far from complete) version of Minesweeper. YESYESYESYES

The game is being saved on the session and can be initialized with board size and amount of mines (althoug UI for this is not implemented).

I decided to build first the logic for the game, and later the UI.

I wasn't able to correctly reveal adjacent tiles without going into a `stack level too deep` error.

Right now you only now when you lost, but not when you have won.

No tests were written due to the lack of time.

The UI was built with a basic form full of buttons. Each click triggers a page reload. Ideally this would be done with JS to avoid reloading. Probably a good use for Turbolinks here.

Game persistance would be better if stored on the DB. A table with an ID and the game data would suffice for the initial version. This way we could access something like `/games/:id` and see that game. Once user account were added, we could show the user a list of past games and let him see it (and finish it if needed).

Building an API on top of this would not be difficult.

Total time spent (including writing this README) was a little more than 4h30m.
