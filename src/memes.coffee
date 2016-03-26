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
  "ackbar":"Ackbar (It's a trap)",
  "afraid": "'Afraid to Ask'",
  "alwaysonbeat": "Always On Beat",
  "ants": "Do You Want Ants? (archer)",
  "awesome": "Socially Awesome Penguin",
  "awkward": "Socially Awkward Penguin",
  "badchoice": "Milk Was a Bad Choice (anchorman)",
  "biw": "BABY Insanity Wolf",
  "blb": "Bad Luck Brian",
  "boat": "I should buy a boat cat",
  "both": "Why Not Both?",
  "bs": "This is Bull, Shark",
  "buzz": "X, X Everywhere",
  "captain": "I'm the captain now",
  "cb": "Confession Bear",
  "cbg": "Comic Book Guy",
  "ch": "Captain Hindsight",
  "chosen": "You Were the Chosen One!",
  "crazypills": "I Feel Like I'm Taking Crazy Pills",
  "doge": "Doge",
  "dwight": "Schrute Facts",
  "elf": "You Sit on a Throne of Lies",
  "ermg": "Ermahgerd",
  "fa": "Forever Alone",
  "fbf": "Foul Bachelor Frog",
  "fetch": "Stop Trying to Make Fetch Happen",
  "fry": "Futurama Fry",
  "fwp": "First World Problems",
  "ggg": "Goog Guy Greg",
  "hipster": "Hipster Barista",
  "icanhas": "I can Has Cheezburger",
  "interesting": "The Most Interesting Man in the World",
  "ive": "Jony Ive Redesigns Things",
  "iw": "Insanity Wolf",
  "jetpack": "Jetpack Guy / Nothing to Do Here",
  "joker": "It's Simple, Kill the Batman",
  "jw": "Probably Not a Good Idea",
  "keanu": "Conspiracy Keanu",
  "kermit": "But That's None of My Business",
  "live": "Do It Live!",
  "ll": "Laughing Lizard",
  "mmm": "Minor Mistake Marvin",
  "mordor": "One Does Not Simply Walk into Mordor",
  "morpheus": "Matrix Morpheus",
  "officespace": "That Would be Great",
  "oag": "Overly Attached Girlfriend",
  "oprah": "Oprah You Get a Car",
  "philosoraptor": "Philosoraptor",
  "red": "Oh, Is that what we're going to do today?",
  "regret": "I Immediately Regret This Decision (anchorman)",
  "remembers": "Pepperidge Farm Remembers",
  "sadfrog": "Sad Frog / Feels Bad Man",
  "sarcasticbear": "Sarcastic Bear",
  "sb": "Scumbag Brain",
  "sf": "Sealed Fate",
  "ski": "Super Cool Ski Instructor (You're gonna have a bad time)",
  "sohappy": "I Would Be So Happy",
  "sohot": "So Hot Right Now",
  "ss": "Scumbag Steve",
  "success": "Success Kid",
  "tenguy": "[10] Guy",
  "toohigh": "The Rent is Too Damn High",
  "winter": "Prepare yourselves, winter is coming",
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

  robot.respond /meme me (\w+) ([\"\“\”][^\"\“\”]+[\"\“\”]) ([\"\“\”][^\"\“\”]+[\"\“\”])/i, (msg) ->
    meme = if checkCode(msg.match[1].toLowerCase(), memes) then msg.match[1].toLowerCase() else 'doge'
    top    = msg.match[2].replace(/"|“|”/g, '').trim().replace(/\s+/g, '-')
    bottom = msg.match[3].replace(/"|“|”/g, '').trim().replace(/\s+/g, '-')

    msg.send "http://memegen.link/#{meme}/#{escape(top)}/#{escape(bottom)}.jpg"
