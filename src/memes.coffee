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
  "awesome-awkward": "Socially Awesome Awkward Penguin",
  "awkward": "Socially Awkward Penguin",
  "awkward-awesome": "Socially Awkward Awesome Penguin",
  "bad": "You Should Feel Bad",
  "badchoice": "Milk Was a Bad Choice (anchorman)",
  "bd": "Butthurt Dweller",
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
  "dodgson": "See? Nobody Cares",
  "doge": "Doge",
  "dsm": "Dating Site Murderer",
  "dwight": "Schrute Facts",
  "elf": "You Sit on a Throne of Lies",
  "ermg": "Ermahgerd",
  "fa": "Forever Alone",
  "fbf": "Foul Bachelor Frog",
  "fetch": "Stop Trying to Make Fetch Happen",
  "fmr": "F*** Me, Right?",
  "fry": "Futurama Fry",
  "fwp": "First World Problems",
  "ggg": "Goog Guy Greg",
  "hipster": "Hipster Barista",
  "icanhas": "I can Has Cheezburger",
  "inigo": "Inigo Montoya",
  "interesting": "The Most Interesting Man in the World",
  "its-happening": "It's Happening",
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
  "money": "Shut Up and Take My Money!",
  "mordor": "One Does Not Simply Walk into Mordor",
  "morpheus": "Matrix Morpheus",
  "oag": "Overly Attached Girlfriend",
  "officespace": "That Would be Great",
  "older": "An Older Code Sir, But It Checks Out",
  "oprah": "Oprah You Get a Car",
  "philosoraptor": "Philosoraptor",
  "red": "Oh, Is that what we're going to do today?",
  "regret": "I Immediately Regret This Decision (anchorman)",
  "remembers": "Pepperidge Farm Remembers",
  "sad-biden": "Sad Joe Biden",
  "sad-boehner": "Sad John Boehner",
  "sad-bush": "Sad George Bush",
  "sad-clinton": "Sad Bill Clinton",
  "sad-obama": "Sad Barack Obama",
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
  "tried": "At Least You Tried",
  "winter": "Prepare yourselves, winter is coming",
  "wonka": "Condescending Wonka",
  "xy": "X all the Y",
  "yallgot": "Y'All Got Anymore of",
  "yodawg": "Xzibit Yo Dawg",
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
    memelist = ''
    memelist += "http://memegen.link/#{code}/#{escape(code)}/#{escape(meme)}.jpg\n" for code, meme of memes 
    msg.send memelist

  robot.respond /meme me ([\w-]+) ([\"\“\”][^\"\“\”]+[\"\“\”]) ([\"\“\”][^\"\“\”]+[\"\“\”])/i, (msg) ->
    meme = if checkCode(msg.match[1].toLowerCase(), memes) then msg.match[1].toLowerCase() else 'doge'
    top    = msg.match[2].replace(/"|“|”/g, '').trim().replace(/\s+/g, '-').replace(/\’/g, '\'')
    bottom = msg.match[3].replace(/"|“|”/g, '').trim().replace(/\s+/g, '-').replace(/\’/g, '\'')

    msg.send "http://memegen.link/#{meme}/#{escape(top)}/#{escape(bottom)}.jpg"
