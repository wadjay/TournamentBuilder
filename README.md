# TournamentBuilder
SportsEngine Assignment

Hello Scott and Scott,

A few admissions with this bit of code - this is my first encounter with Ruby on Rails.  I work in a .NET stack right now, but for the sake of this exercise, I thought I'd try to learn something new and relevant to the position.
As such, the back end portion isn't very clean, but it does fulfill the stated requirements.  If you'd prefer to see something a bit more polished and with some of the below implemented, I'll happily re*write this in C#.

If this code were going to production I would

	*	Enforce authentication
	*	Add some validation/sanitizing on user supplied values
	*	If this were going to be an external facing endpoint, add some kind of security id/key
	*	Separate out the request from the logic and my additional 'Pool' and 'Game' classes from the Controller 
		*	(I would have done this anyways, but I'm not yet familiar with Ruby conventions on where things ought to go.)
	*	Re-style the UI
	*	Include error handling/logging

If the software needed to be maintained long term I would

	*	Consider expanding some of the class objects and maybe include a 'Team' class to store teams as more than just a string
	*	Write a unit test
	*	Potentially add some documentation (though I think this code is simple enough that that may be overkill)

Additional notes on the UI 

	*	Selecting a team will highlight all of the games for that team
	*	The game unique IDs can be viewed through the UI by hovering over the matchup.
