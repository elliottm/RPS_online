// Player class
function Player(name) {
  this.name = name
}

Player.prototype.picks = function(pick) {
  this.pick = pick;
}
// defines picks method within Player class
// sets an instance variable of Player class to pick 

Player.prototype.picksAI = function() {
	var AISelector = ['rock', 'scissors', 'paper', 'lizard', 'spock'];
	this.pick = AISelector[Math.floor(Math.random() * AISelector.length)];
}

//Game class
function Game(player1, player2) {
	this.player1 = player1;
	this.player2 = player2;

	// initialize with two players equivalent
}

// Game.prototype.winner = function() {
// 	console.log(".winner method was called");
// 	var pairs = { 'rock': { 'beats': 'scissors'},
// 					 'paper': { 'beats': 'rock'}, 
// 					   'scissors': { 'beats': 'paper'}};

//     if(this.player1.pick == this.player2.pick) {
//     	return null }
//     else if(pairs[this.player1.pick]['beats'] == this.player2.pick) {
//     	return this.player1 }
//     else {
//     	return this.player2 }
//     }

Game.prototype.winner = function() {
    var pairs = { 'rock': { 'beats': ['scissors', 'lizard'] },
    			  'paper': { 'beats': ['rock', 'spock'] },
    			  'scissors': { 'beats': ['paper', 'lizard'] },
    			  'spock': { 'beats': ['scissors', 'rock'] },
    			  'lizard': { 'beats': ['paper', 'spock'] }};

    if(this.player1.pick == this.player2.pick) {
    	return null 	
    }

    else if(pairs[this.player1.pick]['beats'][0] == this.player2.pick) {
    	return this.player1 }
    else if(pairs[this.player1.pick]['beats'][1] == this.player2.pick) {
    	return this.player1 }
    else {
    	return this.player2 }

   }

Game.prototype.message = function() {
   
   var message = { 'wins': 'The winner was: ',
					'draw': 'The game was a draw'};

   

}






