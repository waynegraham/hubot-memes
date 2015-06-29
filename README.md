# Hubot Memes

Meme generator for hubot.

[![Build Status](https://travis-ci.org/waynegraham/hubot-memes.png)](https://travis-ci.org/waynegraham/hubot-memes) [![npm version](https://badge.fury.io/js/hubot-memes.png)](http://badge.fury.io/js/hubot-memes)

## Usage:
```
hubot meme list - List the available memes
hubot meme me (meme) "top message" "bottom message"
```

### Sample Interaction:
```
user1> hubot meme me afraid "hello" "world"
hubot> http://memegen.link/afraid/hello/world.jpg
```

## Installation

Add the package `hubot-memes` entry to the `external-scripts.json` file.
(you may need to creat this file).

```
"dependencies": {
  "hubot-memes": "^1.0.x"
}
```

Run the following command to ensure the module is installed.

  $ npm install -S hubot-memes

Ensure `hubot-memes` is listed in the dependencies in your
`package.json` file.

```
["hubot-memes"]
```
