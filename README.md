# Mars Rover
Written in Ruby and tested with RSPEC

Problem: [read here](http://pastebin.com/raw/0ZB0FSLx)

## How to run

Run tests:
```
rspec
```
Launch by typing the following from the directory:
```
  ruby run.rb input.txt
  ```
or add your own txt file
```
  ruby run.rb foo.txt
```

## Description

**NASA Controller** receives the message at initialization, which will be 'input.txt' unless a different one is provided. The message is parsed through the parser class and, rovers are deployed and the plateau is set up.


**Rover** is its own entity - it can turn left, right and move. The position will change depending on the orientation.

**Plateau** is just a grid with a width and length provided as the first line of the input.

**Parser** gets the input and forms a consistent Hash with the Plateau key containing the plateau width and length, and the Rovers key containing an array with the rovers provided.
