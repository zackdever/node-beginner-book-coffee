# The Node Beginner Book, with Coffee

Examples completed in CoffeeScript while reading through [The Node Beginner Book][0].

## End Result
A node server which allows the user to upload a PNG file and displays it back to them.

## Development
Watches all `.coffee` in `src/` and updates `.js` in `lib/`:

    $ cake watch
    
Runs and automatically restarts server on change:

    $ npm install
    $ npm start

[0]: http://www.nodebeginner.org/