# Description:
# Meme generator
#
# Dependencies:
# None
#
# Configuration:
# None
#
# Author:
# lilybethshields

Util = require 'util'

memes =
  "afraid": "'Afraid to Ask'",
  "blb": "Bad Luck Brian",
  "wonka": "Condescending Wonka",
  "keanu": "Conspriracy Keanu",
  "live": "Do It Live!",
  "doge": "Doge",
  "ermg": "Ermahgerd",
  "fwp": "First World Problems",
  "fa": "Forever Alone",
  "fry": "Futurama Fry",
  "ggg": "Goog Guy Greg",
  "icanhas": "I can Has Cheezburger",
  "iw": "Insanity Wolf",
  "ll": "Laughing Lizard",
  "morpheus": "Matrix Morpheus",
  "mordor": "One Does Not Simply Walk into Mordor",
  "oprah": "Oprah You Get a Car",
  "remember": "Pepperidge Farm Remembers",
  "philosoraptor": "Philosoraptor",
  "sb": "Scumbag Brian",
  "ss": "Scumbag Steve",
  "fetch": "Stop Trying to Make Fetch Happen",
  "success": "Success Kid",
  "officespace": "That Would be Great",
  "interesting": "The Most Interesting Man in the World",
  "toohigh": "The Rent is Too Damn High",
  "xy": "X all the Y",
  "elf": "You Sit on a Throne of Lies",
  "chosen": "You Were the Chosen One!",
  "10guy": "[10] Guy"

checkCode = (meme, memes) ->
  return meme of memes

module.exports = (robot) ->

  meme_choices = (meme for _, meme of memes).sort().join('|')

  robot.respond /meme list/i, (msg) ->
    for code, meme of memes
      msg.send "#{code} - #{meme}"

  robot.respond /meme me (\w+) (\"[^"]+\") (\"[^"]+\")/i, (msg) ->

    meme = if checkCode(msg.match[1], memes) then msg.match[1] else 'doge'
    top    = msg.match[2].replace(/"/g, '').trim().replace(/\s+/g, '-')
    bottom = msg.match[3].replace(/"/g, '').trim().replace(/\s+/g, '-')

    msg.send "http://memegen.link/#{meme}/#{top}/#{bottom}.jpg"

