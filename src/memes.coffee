# Description:
#   Meme generator
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot meme list - List of memes and their codes
#   hubot meme show - Show all memes and their codes
#   hubot meme me (meme) "top message" "bottom message"
#
# Author:
#   lilybethshields
#   waynegraham

Util = require 'util'

memes =
  "aag": "Ancient Aliens Guy",
  "afraid": "'Afraid to Ask'",
  "ants": "Do You Want Ants? (archer)",
  "awesome": "Socially Awesome Penguin",
  "awkward": "Socially Awkward Penguin",
  "badchoice": "Milk Was a Bad Choice (anchorman)",
  "biw": "BABY Insanity Wolf",
  "blb": "Bad Luck Brian",
  "both": "Why Not Both?",
  "bs": "This is Bull, Shark",
  "buzz": "X, X Everywhere",
  "chosen": "You Were the Chosen One!",
  "crazypills": "I Feel Like I'm Taking Crazy Pills",
  "doge": "Doge",
  "elf": "You Sit on a Throne of Lies",
  "ermg": "Ermahgerd",
  "fa": "Forever Alone",
  "fetch": "Stop Trying to Make Fetch Happen",
  "fry": "Futurama Fry",
  "fwp": "First World Problems",
  "ggg": "Goog Guy Greg",
  "hipster": "Hipster Barista",
  "icanhas": "I can Has Cheezburger",
  "interesting": "The Most Interesting Man in the World",
  "iw": "Insanity Wolf",
  "jetpack": "Jetpack Guy / Nothing to Do Here",
  "jw": "Probably Not a Good Idea",
  "keanu": "Conspiracy Keanu",
  "kermit": "But That's None of My Business",
  "live": "Do It Live!",
  "ll": "Laughing Lizard",
  "mordor": "One Does Not Simply Walk into Mordor",
  "morpheus": "Matrix Morpheus",
  "officespace": "That Would be Great",
  "oprah": "Oprah You Get a Car",
  "philosoraptor": "Philosoraptor",
  "regret": "I Immediately Regret This Decision (anchorman)",
  "remembers": "Pepperidge Farm Remembers",
  "sarcasticbear": "Sarcastic Bear",
  "sb": "Scumbag Brian",
  "sf": "Sealed Fate",
  "ski": "Super Cool Ski Instructor (You're gonna have a bad time)",
  "sohappy": "I Would Be So Happy",
  "sohot": "So Hot Right Now",
  "ss": "Scumbag Steve",
  "success": "Success Kid",
  "tenguy": "[10] Guy",
  "toohigh": "The Rent is Too Damn High",
  "wonka": "Condescending Wonka",
  "xy": "X all the Y",
  "yallgot": "Y'All Got Anymore of",
  "yuno": "Y U NO?"

checkCode = (meme, memes) ->
  return meme of memes

module.exports = (robot) ->

  meme_choices = (meme for _, meme of memes).sort().join('|')

  robot.respond /meme list/i, (msg) ->
    memelist = ''
    memelist += "#{code} - #{meme}\n" for code, meme of memes
    msg.send memelist

  robot.respond /meme show/i, (msg) ->
    for code, meme of memes
      msg.send "http://memegen.link/#{code}/#{escape(code)}/#{escape(meme)}.jpg"

  robot.respond /meme me (\w+) (\"[^"]+\") (\"[^"]+\")/i, (msg) ->

    meme = if checkCode(msg.match[1].toLowerCase(), memes) then msg.match[1].toLowerCase() else 'doge'
    top    = msg.match[2].replace(/"/g, '').trim().replace(/\s+/g, '-')
    bottom = msg.match[3].replace(/"/g, '').trim().replace(/\s+/g, '-')

    msg.send "http://memegen.link/#{meme}/#{escape(top)}/#{escape(bottom)}.jpg"

