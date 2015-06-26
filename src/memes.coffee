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

getCode = (meme, meemes) ->
  for code, meme of memes
    return code if meme.toLowerCase() is meme.toLowerCase()


module.exports = (robot) ->

  meme_choices = (meme for _, meme of memes).sort().join('|')

  robot.respond /meme list/i, (msg) ->
    for code, meme of memes
      msg.send "#{code} - #{meme}"

  robot.respond /meme me (\w+) (\"[^"]+\") (\"[^"]+\")/i, (msg) ->
    meme = if msg.match[1] isnt undefined then getCode(msg.match[0], memes) else 'doge'
    top = msg.match[2].replace(/"/g, '').replace(/\s+/g, '-').toLowerCase()
    bottom = msg.match[3].replace(/"/g, '').replace(/\s+/g, '-').toLowerCase()

    msg.send "http://memegen.link/#{meme}/#{top}/#{bottom}.jpg"
    #meme = if msg.match[0] isnt undefined then getCode(msg.match[0], memes) else 'doge'
    #top = "\"#{msg.match[1]?.trim()}\""
    #bottom = "\"#{msg.match[2]?.trim()}\""
