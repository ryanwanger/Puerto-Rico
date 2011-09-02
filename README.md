Welcome to Puerto Rico, a game that has been #1 (or 2) on [http://boardgamegeek.com/browse/boardgame](Board Game Geek) for many, many years.

This is a big work in progress right now. The game is just starting to be playable in the command line, but I have no intention of making UI. Eventually, I'd like to be able to simulate thousands of games, testing the balance of various aspects of the game. The first goal is to show the true price of The University - which is known to be overpriced at 8 doubloons (even by admission of the designer himself).

If you haven't played the game before, it will be difficult to understand how this all works. Here is [ http://www.riograndegames.com/uploads/Game/Game_4_gameRules.pdf](a link to the pdf of the rules).

I'm also trying to code this in a way that will make it easily extendable, so that you could add your own buildings, roles, and resources types. But, that remains to be seen...

I have only implemented one or two buildings at this point. More to come.

It's very basic, and annoying to play in the command line right now (there is no way to check up on the state of the game). If you want to run it...

>  require './puerto_rico'
  
>  game = PuertoRico::Game.new 3
  
3 is the number of players. 4 or 5 should work also, but I haven't tested that.

>  game.play_round
  
Then just make choices about what each player should do as it approaches. After each player has chosen an role and everything is played out, you'll be returned back to the prompt. Just call game.play_round again.

Lots more to come!