"Escapade!" by Juhana Leinonen

Volume 0 - Meta

Book 1 - License

[---
Copyright (C) 2008 Juhana Leinonen <juhana [dot] if [at] nitku [dot] net>

 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:

 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
---]

Book 2 - Version History

[---

Release 3 (2010-01-11)
	- Updated to work with Inform 7 build 5Z71.
	- Changed the license to the more permissive MIT license.
	- Minor refactoring of the source code, eg. actions and things are now in alphabetical order.
	- The last puzzle is reworked so that it's more clear what's in the glass at a given moment (implicit actions made it too easy to miss a vital part being removed from the glass).
	- Modified the window description accordingly when clouds have blocked the moon. Removed the moon from play when this happens. Added a description to the clouds.
	- Added the command HIT X WITH Y
	- Fixed a bug where showing or giving things to the guard would give an inappropriate response if the item wouldn't have any special conversation text
	- Removed the HR, SING command and accompanying conversation options, and clarified that you can't command people directly in this game.
	- Fixed NPC, FOO giving the standard "there is no reply" response.
	- The game doesn't let you close the encyclopedia anymore when the light bulb is inside.
	- Other minor bug fixes.

Release 2 (2009-03-29)
	- Released for the ClubFloyd session (http://www.allthingsjacq.com/interactive_fiction.html#clubfloyd)
	- Fixed a bug that made the hints repeat a solution to an already solved puzzle at one point.
	- Other minor bug fixes. 

Release 1 (2008-11-23)
	- Initial competition release.
	
---]


Book 3 - Note about compiling

[---

The source code is currently just large enough to fit into the Z-machine. With Inform debugging tools, it doesn't. That means you can release the source into a working .z8 file, but if you try to compile it inside Inform's IDE, it will fail. If you wish to work on the entire source code you can for example comment out the large blocks of text in Volume 6 - Menus.

Migrating to Glulx would requre at least changing the text coloring codes to Glulx's corresponding methods.

---]


Volume 1 - Settings

Book 1 - Extensions

[these extensions are built-in.]
Include Basic Screen Effects by Emily Short.
Include Plurality by Emily Short.

[The following extensions can be found from http://www.inform-fiction.org/I7/Download%20-%20Extensions.html]
Include Bulky Items by Juhana Leinonen.
Include Default Messages by David Fisher.
Include Disambiguation Control by Jon Ingold.
Include Epistemology by Eric Eve.
Include Far Away by Jon Ingold.
[Far Away seemed to conflict with the rest of the code or with some other extension. I had to replace "far-away message" with "far-away-message" to get it to work.]
Include Implicit Actions by Eric Eve.
Include version 2 of Object Response Tests by Juhana Leinonen.
Include Pronouns by Ron Newcomb.
Include Secret Doors by Andrew Owen.
Include Unicode Interrogation by Michael Martin.

[The following can be downloaded from http://www.nitku.net/if/extensions/]
Include Modified Menus by Juhana Leinonen.
[Modified Menus is essentially Menus by Emily Short with minor alterations (read: convoluted hacks) to allow intro text in selection menus.]


Book 2 - General

Use American dialect and serial comma. 

[The room name while looking is quite unnecessary in a one-room game.]
The room description heading rule is not listed in any rulebook.

Rule for deciding whether all includes fixed in place things:
	it does not.

["Bulky" property is defined in the Bulky Items extension.]
Definition: a thing is normal-sized if it is not bulky.

To say interrobang:
	if unicode 8253 is supported:
		say "[unicode 8253]";
	otherwise:
		say "!?[run paragraph on]";
		
A thing can be useful. A thing is usually not useful.	[We can't trade useful things. I'd rather have this rule with other trading rules, but seems like it has to be defined before any things use it.]

[distant items are usually scenery.]
Should the game suggest doing something to something distant:
	it is a bad suggestion.


Part Bibliographic data

The release number is 3.
The story genre is "Comedy". 
The story creation year is 2008.
The story description is "While Captain McBrawn is after the bombers it is up to you now to find your way to the President of the World and warn him of the impending attack. Finally some responsibility after all these years! Unfortunately being captured by the Screaming Communists is a slight hindrance to the plan."

[Cover art can be downloaded from http://nitku.net/if/escapade and it's in Public Domain.]
Release along with cover art, the source text, and a website.


Part Taking all

[This rule removes bulky things from get all.] 
Should the game suggest taking a bulky thing: 
	it is a bad suggestion.

[Multiple taking is defined in the Bulky Items extension. The rule must be "every turn" so that it'll print only once.]
Every turn when multiple taking:
	if a bulky handled thing is in the cell and the current action is taking:
		say "(bulky items, i.e. [the list of bulky handled things in the cell], were ignored)[line break]";


Part Status line

Rule for constructing the status line:
	fill status bar with Table of Statusline;
	rule succeeds.	

Table of Statusline
left	central	right
" Escapade!"	""	"[if the score > 0]Escapes: [score] [end if]"


Part Screen clearing

[originally screen clearing was on by default; text was unfortunately cut at times when played with WinFrotz. This might have been related to another bug that messed up the memory system, so it might not be an issue anymore, but on the other hand it possibly annoys a lot less people if it's turned off by default.]
screen clearing is a truth state that varies. Screen clearing is false.

Cls switching on is an action out of world.
Cls switching off is an action out of world.

Understand "cls on" and "clear screen on" as cls switching on.
Understand "cls off" and "clear screen off" as cls switching off.

Carry out cls switching on:
	change screen clearing to true;
	say "Screen clearing is now enabled."
	
Carry out cls switching off:
	change screen clearing to false;
	say "Screen clearing is now disabled."
	
To pause the cutscene:
	if screen clearing is true:
		pause the game;
	otherwise:
		say "[paragraph break]Please press SPACE to continue.[paragraph break]";
		wait for the SPACE key.


Part Disabled rules

The examine described devices rule is not listed in any rulebook.

Procedural rule while eating or taking off: 
	ignore the carrying requirements rule.

Procedural rule while asking someone to try eating:
	ignore the carrying requirements rule.
	

Part Listing contents of empty containers and supporters

Rule for printing room description details: stop.


Part Inserting stuff

To decide whether (insertee - a thing) is too large to insert:
	if the insertee is:
		-- the encyclopedia:
			decide yes;
		-- the whiskey bottle:
			decide yes;
	if the insertee is bulky: 
		decide yes;
	decide no.

Before inserting something into a normal-sized container when the noun is too large to insert:
	say "It doesn't fit." instead.
	
[the next rule is crafted basically to make it work so that if you try to put something in the drinking glass when there's a container (i.e. the tin foil) inside it, instead of getting a "no more room" message, it just puts the thing inside the other container.]
Before inserting something into a container (called the original box):
	if a container is in the original box and the carrying capacity of the original box is 1:
		let the inner box be a random container in the original box;
		say "([the inner box])[command clarification break]";
		try inserting the noun into the inner box instead;
	continue the action.
	

Part Liquids

Liquid is a kind of thing.

Understand "liquid" as a liquid.



Book 3 - Scoring

Use no scoring. [this disables the default visible mechanisms so that we can build a custom one instead. The built-in score counter is still available.]

To decide whether the score is the maximum:
	if the score is 11:
		decide yes;
	decide no.

Requesting the full score is an action out of world.
 
Understand "full" or "full score" or "escapes" or "escapades" as requesting the full score.
Understand the command "notify" as something new.

Instead of requesting the score:
	try requesting the full score.

The score printing rule is listed instead of the announce the score rule in the carry out requesting the score rules.

Carry out requesting the full score (this is the score printing rule):
	if the score is 0:
		say "So far you have scored zero points.[if the creature is present][line break][c]Whoopee. There's my great adventurer,' [the creature] comments." instead;
	if the score is 1:
		choose row 1 in the Table of Accomplished escapes;
		say "You have escaped once by [method entry].";
	otherwise:
		say "You [if the game ended in victory or the game ended in death][otherwise]have [end if]escaped [if the score is 2]twice[otherwise][score in words] times[end if]:[line break]";
		repeat through Table of Accomplished escapes:
			say " - by [method entry][line break]";
	if the creature is present:
		say "[line break]";
		if the score < 3, say "[c]I bet if I put you in a paper bag and gave you scissors you couldn't find your way out,' [the creature] speculates." instead;
		if the score < 5, say "[c]On the other hand you have been caught [italic type][score + 1 in words][roman type] times now,' [the creature] remarks." instead;
		say "[c]Impressive. Now, to escape [italic type]without[roman type] getting caught...' [the creature] muses." instead;

	
Table of Accomplished escapes
Method
text
with 12 blank rows.


To mark the escape down as ( feat - text ):
	choose a blank row in Table of Accomplished escapes;
	change method entry to feat;
	award 1 point;
	if the score is 4:
		the dark clouds gather in three turns from now;
	if the score is 5:
		the food is delivered to the cell in two turns from now.
		
At the time when the dark clouds gather:
	say silent c; [no H.R. quips this turn]
	say "Dark clouds gather in the sky and block the moonlight.";
	now the clouds are in the cell;
	remove the moon from play.

At the time when the food is delivered to the cell:
	say silent c; 
	if the electrical wire is boobytrapping the door:
		say "There's a knock on the door. The guard doesn't wait for a response but starts turning the key in the lock and shouts: 'Your DINNER IS...'
		
*kZap*

The electrical wire gives a good shock to the guard and he flies backwards to the opposite wall. You go see if the door opened - and it did! You take off into the corridors.";
		pause the cutscene;
		say "After wandering around the castle for some while you realize you have no idea where you are. The corridors and staircases create a maze where you just can't know where you're going[if the player is naked]. The coldness makes you soon wish you had clothes on[end if].
		
You turn around a corner and bump into the guard who is still a bit dazed. He reacts quickly now and grabs a hold of you. 'And STAY THERE!' he shouts when he throws you back in the cell.

A plate with a tin foil bundle on it has been left in the cell.";
		zap the guard;
	otherwise:
		say "There's a knock on the door. Not waiting for a response the guard opens the door and shouts: 'Your DINNER IS HERE!' He throws a plate in the cell with a silvery package on it and locks the door again.";
	now the dinner plate is in the cell.	
	
Book 4 - Winning


To do the final escape:
	say "Captain McBrawn's silhouette reflects clearly to the clouds above. You hold the glass in your hand for several minutes, then support it in the window sill and leave it there.[paragraph break]";
	say "'What happens now?' [the creature] asks. [if the player is naked]'Is this the cue for you to put on your clothes?'[paragraph break]'No! [otherwise][paragraph break]'[end if]We wait. Captain McBrawn will be here any minute now.' [The creature] shrugs and stays silent.";
	pause the cutscene;
	say "You wait, and wait, and wait. You pace the room from one end to the other again and again. Finally the light bulb flickers ominously and finally burns out completely.[paragraph break]A dreadful darkness falls into the cell but it doesn't last long when the moon comes back from behind the clouds and lights the room with an eerie glow. You give a defeated sigh. [The creature] gives you a melancholic look.";
	pause the cutscene;
	say "A bit later you hear muffled sounds from the corridor. They seem to get louder and louder and you can make out screams and thuds and thumps. You glance hopefully at [the creature] who grins and gives you a thumbs-up.
	
*khaZAM!* 

The door practically EXPLODES inwards when the guard's unconscious body flies through it and bright light flows in the cell. You recognize the shadow of the man standing in the door frame.
	
Yes. It is Captain McBrawn.

'Fear NOT! For I, Captain McBrawn, am here!' He comes in and stands tall in front of you, hands by his waist and holding his sculpture-like chin high. 'Let us leave this dreadful place!'

You lower your head. 'I have to confess... You told me to go find the President. I didn't get there. The Screaming Communists captured me right away and I failed the mission.' The Captain laughs warmly. 'Do not worry! I foiled their evil plot with little trouble and came looking for you. The searchlight was very clever of you.'

'Well, I had some help...' you say and point at [the creature] - but it's gone. You're almost sure you see the tip of its tail disappearing in the ventilation duct. The Captain isn't paying much attention. 'Let's go home,' he says.

You step over the knocked-out guard and leave[If the player is naked]. 'You could wear some clothes the next time,' the Captain says[end if].";
	mark the escape down as "calling Captain McBrawn to the rescue";
	now the creature is absent; [no more H.R.'s quips]
	end the game in victory.
	
	
After printing the player's obituary when the game ended in victory:
	say "You managed to find [the score] escapes out of total 11 possible."
	

Table of Final Question Options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"review your SCORE"	true	"score"	score printing rule	--
"see all available ESCAPES (includes spoilers)"	true	"escapes"	show all available escapes rule	--

This is the show all available escapes rule:
	say "You can escape the cell in following ways:[paragraph break]	
 - unscrew the door hinges with the free sample[line break]
- pour H.R.[']s spit on the window bars[line break]
- attach the toilet hole to the door and unlock it[line break]
- accelerate to 88 mph while holding the flux capacitor[line break]
- trap the cell door's lock with an exposed live wire[line break]
- bribe the guard with the whiskey bottle[line break]
- enter the air ducts[line break]
- move the trapdoor opening sticker to the cell door[line break]
- cheat the guard by drinking the magic potion[line break]
- repair the trebuchet and break the door down with it[line break]
- build a searchlight and call McBrawn for help[line break]
";


Test finale with "test scissors/cut photo/put foil in glass/get lamp/put lamp in glass/put photo in glass".

	

Book 5 - Moving around

Chapter I - Disabling compass directions

Going north is compass-going.
Going south is compass-going.
Going east is compass-going.
Going west is compass-going.
Going northwest is compass-going.
Going northeast is compass-going.
Going southwest is compass-going.
Going southeast is compass-going.

Instead of compass-going:
	say "You have absolutely no sense of compass directions in here. Even if you knew where [noun] was, going that way would mean hitting either a stone wall or the metal door."
	
Instead of examining a direction when the noun is not inside and the noun is not outside and the noun is not up and the noun is not down:
	try going north. [this will fire the rule above.]

Before exiting:
	say "Yes, that would be the general idea. You just have to be a bit more specific." instead.

Before going up:
	try jumping instead.


Chapter II - Moving inside the cell

Internal position is a kind of value. The internal positions are unspecified, the middle, by the window and by the door. Everything has an internal position. The internal position of a thing is usually unspecified.

A room has an internal position.
A direction has an internal position. [these are necessary only because without them the game throws run-time errors with commands that have non-things as nouns.]

The internal position of the player is by the door.

After dropping:
	now the internal position of the noun is the internal position of the player;
	continue the action.
	
After taking:
	now the internal position of the noun is unspecified;
	continue the action.
	

Definition: a thing is across the room if the internal position of the player is not the internal position of it and it is at the extremes and the player is at the extremes.

Definition: a thing is at the extremes if the internal position of it is by the window or the internal position of it is by the door.

Ktonked is a truth state that varies. Ktonked is false. [so that we ktonk only once per turn]

The ktonk count is a number that varies. The ktonk count is 0.

This is the ktonk rule:
	if a random chance of 1 in 3 succeeds:
		continue the action;
	if the light bulb is not part of the electrical wire or the electrical wire is pulled out:
		continue the action;
	let obj be nothing;
	if the noun is not nothing and the noun is across the room:
		let obj be the noun;
	if the second noun is not nothing and the second noun is across the room:
		let obj be the second noun;
	if obj is not nothing and the current action is not unktonking and ktonked is false and not multiple taking and the cell is not dark:
		say "[one of]You move across the room toward [the obj]. The lamp hanging from the ceiling is just on the right height to bonk you on the forehead on your way. (ktonk!)[or]You move across the room to get closer to [the obj]. The lamp hits you on the forehead again. (ktonk)[line break][or]You remember the low-hanging lamp mere milliseconds before it hits you on the forehead. (ktonk)[line break][or](ktonk)[line break][or](ktonk)[line break][or]You move across the room, now remembering that devilish lamp and going around it! Take that, lamp![or](ktonk)[line break][or](ktonk)[line break][or](ktonk)[line break][or](ktonk) ...damn lamp...[or](ktonk)[line break][or](ktonk)[line break][or](ktonk)[line break][paragraph break]You make a solemn oath that if the lamp hits you even once more, you'll rip it right off, mercilessly.[or](ktonk)[line break][stopping]";
		increase the ktonk count by 1;
		if the noun is not nothing and ( the noun is at the extremes or the internal position of noun is the middle ):
			now the internal position of the player is the internal position of the noun;
		if the second noun is not nothing and ( the second noun is at the extremes or the internal position of the second noun is the middle ):
			now the internal position of the player is the internal position of the second noun;
		change ktonked to true;
	continue the action.

Every turn:
	change ktonked to false.

The ktonk rule is listed first in the before rulebook.



Book 6 - Discussion

A thing can be a conversable. A thing is usually conversable.

A thing can be conversed or unconversed. A thing is usually unconversed.

Definition: A thing is discussable if it is a conversable or it is known.

Understand the command "ask" as something new.
Understand the command "tell" as something new.
Understand the command "say" as something new.

A thing has some text called creature response. The creature response of a thing is usually "".
A thing has some text called guard response. The guard response of a thing is usually "".


To say self-talking:
	say "You discuss the subject with yourself for a while."
	
To say inanimate-talking:
	say "'Hello there, [noun],' you say.[if the creature is present][one of][line break][question intelligence] [the creature] says.[or][stopping][end if]"




Discussing with it about is an action applying to two visible things.

Discussing with something about something is unktonking. [this just means we don't move towards an object before we talk about it]


Understand "ask [something]" as discussing with it about.
Understand "tell [something]" as discussing with it about.
Understand "ask [something] about [any discussable thing]" as discussing with it about.
Understand "ask [something] about [text]" as babbling to it that.
Understand "ask [something] for [any discussable thing]" as discussing with it about.
Understand "ask [something] for [text]" as babbling to it that.
Understand "tell [something] that [any discussable thing]" as discussing with it about.
Understand "tell [something] that [text]" as babbling to it that.
Understand "tell [something] about [any discussable thing]" as discussing with it about.
Understand "tell [something] that [text]" as babbling to it that.
Understand "talk to [something] about [any discussable thing]" as discussing with it about.
Understand "talk to [something] about [text]" as babbling to it that.
Understand "talk to" as babbling to it that.
Understand "talk to [something]" as discussing with it about.


Rule for supplying a missing second noun when discussing with about:
	say "[italic type]You must be more specific about what you want to discuss.[roman type][line break]" instead;
	
Should the game suggest discussing with something about something conversable:
	it is a good suggestion.

Should the game suggest targetless discussing something conversable:
	it is a good suggestion.
	

Before discussing with about:
	now the second noun is hinted;
	continue the action.

Check discussing with it about:
	if the noun is the player, say "[self-talking]" instead;
	if the noun is not the guard and the noun is not the creature, say "[inanimate-talking]" instead;
	if the second noun is not discussable, try babbling to the noun that instead;
	if the noun is the creature and the creature response of the second noun is "": 
		try babbling to the noun that instead;
	if the noun is the guard and the guard response of the second noun is "":
		try babbling to the noun that instead.

Carry out discussing with the creature about:
	if the creature response of the second noun is not "":
		say "[creature response of the second noun][line break]";
		now the creature is spoken;
	otherwise:
		try babbling to the creature that instead.
		
Carry out discussing with the guard about:
	if the guard response of the second noun is not "":
		say "[guard response of the second noun][line break]";
		now the guard is spoken;
	otherwise:
		try babbling to the guard that instead.
		

Does the player mean discussing with about the noun: it is very likely. [helps with topics like "himself"]


Targetless discussing is an action applying to one visible thing.
Targetless babbling is an action applying to one topic.
Targetless discussing something is unktonking.

Understand "a [any discussable thing]" as targetless discussing.
Understand "a [text]" as targetless babbling.
Understand "t [any discussable thing]" as targetless discussing.
Understand "t [text]" as targetless babbling.
Understand "t" as targetless discussing.
Understand "talk about [any discussable thing]" as targetless discussing.
Understand "talk about [text]" as targetless babbling.
Understand "ask about [any discussable thing]" as targetless discussing.
Understand "ask about [text]" as targetless babbling.
Understand "tell about [any discussable thing]" as targetless discussing.
Understand "tell about [text]" as targetless babbling.
Understand "ask for [any discussable thing]" as targetless discussing.
Understand "ask for [text]" as targetless babbling.


Rule for supplying a missing noun when targetless discussing:
	say "[italic type]You must be more specific about what you want to discuss.[roman type][line break]" instead;

Check targetless discussing:
	if the guard is in the cell, try discussing with the guard about the noun instead;
	if the creature is in the cell, try discussing with the creature about the noun instead;
	try babbling to the player that "foo" instead.

Check targetless babbling:
	if the guard is in the cell:
		try babbling to the guard that "[the topic understood]" instead;
	if the creature is in the cell:
		try babbling to the creature that "[the topic understood]" instead;
	try babbling to the player that "foo" instead.



Instead of asking someone (called the talker) to try discussing with the player about something (called the chat-topic):
	try discussing with the talker about the chat-topic.

Instead of asking someone (called the talker) to try targetless discussing something (called the chat-topic):
	try discussing with the talker about the chat-topic.


Part Babbling

Babbling to it that is an action applying to one thing and one topic. [shown when the topic is not understood]

Check babbling to:
	if the noun is the player, say "[self-talking]" instead;
	if the noun is not a person and the noun is not an animal, say "[inanimate-talking]" instead;


Part Keyword hinting

Thing can be hinted or unhinted. Thing is usually unhinted.

Hint style start is text that varies. Hint style start is "[bold type]".
Hint style end is text that varies. Hint style end is "[roman type]".


To say key ( x - a thing ):
	if x is unhinted:
		say "[hint style start]".
	
To say endkey ( x - a thing ):
	if x is unhinted:
		say "[hint style end]";
		now x is hinted.


Book 7 - Disabled commands

[consulting]
Understand the command "look" as something new. [disables "look up x in y"]
Understand "look" as looking. [...then we have to enable the other look -commands one by one. Yay.]
Understand "look [something]" as examining.
Understand "look at [something]" as examining.
Understand "look under [something]" as looking under.
Understand the command "consult" as something new.

[disabling the verbose and shortened room description preference commands]
Understand the command "verbose" as something new.
Understand the command "long" as something new.
Understand the command "brief" as something new.
Understand the command "normal" as something new.
Understand the command "superbrief" as something new.
Understand the command "short" as something new.

[some troublesome or unnecessary commands]
Understand the command "clear" as something new.
Understand the command "cover" as something new.
Understand the command "feed" as something new.
Understand the command "fix" as something new.
Understand the command "pay" as something new.
Understand the command "screw" as something new.
Understand the command "torture" as something new.
Understand the command "uncover" as something new.
Understand the command "unwrap" as something new.
Understand the command "unscrew" as something new.
Understand the command "wave" as something new.
Understand the command "burn" as something new.
Understand the command "light" as something new.
Understand the command "buy" as something new.
Understand the command "purchase" as something new.
Understand the command "swing" as something new.

Understand "verbose" as a mistake ( "Uh... Ok, the game is now in 'verbose' mode.[if the creature is present][paragraph break][c]An optimist, I see,[c] [the creature] remarks." ).
Understand "brief" as a mistake ( "Uh... Ok, the game is now in 'brief' mode.[if the creature is present][paragraph break][c]This is a one-room game, you do know that?' [the creature] wonders." ).
Understand "superbrief" as a mistake ( "Uh... Ok, the game is now in 'superbrief' mode.[if the creature is present][paragraph break][c]Dude, there are no other locations,[c] [the creature] says." ).



Book 8 - Old verbs


Understand "kiss [something]" as kissing.

Understand "x cell" and "examine cell" and "l at cell" and "look at cell" as looking.

Understand the command "lick" as "taste".

Understand the command "clip" as "cut".

Understand the command "rub" as something new.
Understand the command "rub" as "touch".
Understand the command "swing" as something new.
Understand the command "swing" as "push".

Understand the command "flip" as "switch".

[SHOW == GIVE]
Understand the command "show" as something new.
Understand the command "show" as "give".
Understand the command "display" as something new.
Understand the command "display" as "give".
Understand the command "present" as something new.
Understand the command "present" as "give".

Understand "climb in [something]" as entering.
Understand "climb on [something]" as climbing.

Understand the command "escape" as "exit".

Understand "climb out/outside" as out-climbing.

Out-climbing is an action applying to nothing.

Before out-climbing: try climbing through the barred window.

[afaik this is a bug in I7: you have to jump through hoops to get CLIMB OUT etc to work]


Understand the command "search" as something new.
Understand the command "search" as "examine".

Understand the command "load" as "restore".

[for some reason "insert" breaks miserably; this fixes it.]
Understand the command "insert" as something new.
Understand the command "insert" as "put".

Understand the command "slap" as "attack".
Understand "bang on [something]" as attacking.

Understand "slap [something] on [something]" as putting it on.
Understand "slap [something] in [something]" as inserting it into.

Understand the command "scoop" as "take".

Understand "drink from [something]" as drinking.

Instead of tasting something:
	try eating the noun.
	
Instead of drinking a liquid:
	try tasting the noun.
	

[ASK <npc> TO <action> requires regexp hackery; courtesy of example 399 in the Inform manual (with minor bug fixes by me)]

After reading a command: 
	let N be indexed text; 
	let N be the player's command; 
	replace the regular expression "\b(ask|tell|order|command) (.+?) to\b" in N with "\2,"; 
	change the text of the player's command to N.



Book 9 - New verbs


Part Bribing

Bribing it with is an action applying to two things.

Understand "bribe [something] with [something]" as bribing it with.

Check bribing with:
	if the noun is yourself:
		say "Bribe yourself? That wouldn't work.";
	otherwise:
		if the noun is not a person:
			say "[The noun] [if the noun is plural-named]don't[otherwise]doesn't[end if] have anything to give in return." instead.
			

Part Climbing through

Climbing through is an action applying to one thing.

Understand "climb through/out [something]" as climbing through.

Check climbing through:
	say "You can't climb through that." instead.
		

Part Cutting with


Cutting it with is an action applying to one touchable thing and one carried thing.

Understand "cut [something] with [something preferably held]" as cutting it with.

Check cutting it with:
	if the second noun is the player:
		say "You're not sharp enough." instead;
	if the noun is the second noun:
		say "That can't cut itself!" instead;
	say "[The second noun] is not suitable for cutting." instead.
 
Instead of cutting yourself:
	say "The situation is not that dire yet."
	
[see the nail scissors for more]



Part Dancing

Dancing with is an action applying to one thing.
Understand "dance", "dance by yourself", "dance alone" and "dance with [something]" as dancing with.

Rule for supplying a missing noun while dancing with:
	change the noun to the player.
	
Check dancing with:
	if the noun is the player and the player is naked and the creature is present:
		say "You dance a short slip jig with extra sets of jumps and twists.[paragraph break][c]That's it. I have lost my will to live,' [the creature] moans." instead;
	if the noun is the player, say "You take a few steps to the tune you hear only in your head." instead;
	if the noun is not a person, say "You can't dance with inanimate objects!" instead;
	say "[The noun] doesn't seem to be in the mood for dancing."
	

Before dancing with the creature when the creature is present:
	say "[c]I would rather not. And by rather not I mean you will die a horrible death if you even think of such thing,[c] [the creature] says." instead.
	
Before dancing with the guard:
	say "He will probably not be very enthusiastic about the idea." instead.
	
	
Part Emptying

Emptying is an action applying to one thing.

Understand "empty [something]" as emptying.

Should the game choose emptying a container:
	it is an excellent choice.
	
Should the game choose emptying a supporter:
	it is an excellent choice.
	

Check emptying:
	if the number of things in the noun is 0:
		say "There's nothing to empty in [the noun]." instead;
	if the noun is in a container (called the bucket):
		try emptying the bucket instead;
	if the noun is on a supporter (called the surface):
		try emptying the surface instead.
		
Carry out emptying:
	say "You remove [the list of things in the noun] from [the noun].";
	repeat with x running through the list of things in the noun:
		silently try taking x.



Part Flirting with

Flirting with is an action applying to one visible thing.

Understand "flirt with [something]" as flirting with.
Understand "come on to [something]" as flirting with.

Carry out flirting with:
	if the noun is the guard:
		say "Better not. He doesn't look like he would like that.";
	otherwise if the noun is the creature:
		say "'So, um..'[paragraph break][c]You can stop right there right now,[c] the creature says.";
	otherwise:
		say "'Hey there beautiful,' you say to [the noun].[if the creature is present][line break][The creature] rolls its eyes.";
		say silent c.


Part Flushing

Flushing is an action applying to one thing.

Understand "flush [something]" as flushing.

Check flushing:
	if the noun is the toilet hole:
		say "There's no visible mechanism to flush it. Considering that it's just a hole, it probably doesn't work with water.";
	otherwise if the noun is the player:
		say "You can't flush yourself!";
	otherwise:
		say "You can't flush [that-those of the noun]."
		

Part Greeting

[new for release 2]

Greeting is an action applying to one visible thing.

Understand "greet [something]" as greeting.
Understand "greet" as greeting.

Understand the commands "greetings" and "hi" and "hey" and "hello" as "greet".


Rule for supplying a missing noun while greeting:
	if the player can see the guard:
		change the noun to the guard;
	otherwise if the player can see the creature:
		change the noun to the creature;
	otherwise:
		change the noun to the player.
		


Check greeting:
	if the noun is not the guard and the noun is not the creature and the noun is not the player:
		say inanimate-talking instead.
		
Carry out greeting the player:
	if the cell is dark:
		say "'Hello? Anyone?' you say quietly but get no answer.";
	otherwise:
		say "'Hi Scotty,' you say. 'Well, hello there, Scotty,' you reply.[if the creature is present][one of][line break][question intelligence] [the creature] says.[or][stopping]".
		

Part Hitting with

Hitting it with is an action applying to one thing and one carried thing.

Understand "attack [something] with [something]" as hitting it with.

A thing can be sturdy or fragile. A thing is usually sturdy.

Check hitting with:
	say "If bare hands won't work, [the second noun] [is-are of the second noun] not likely to help either." instead.
	
Check hitting something with a fragile thing:
	say "[The second noun] would surely break!" instead.
	
Check hitting a fragile thing with something:
	say "[The noun] would surely break!" instead.
		
		
Part Knocking on

Knocking on is an action applying to one touchable thing.
Understand "knock on/at [something]" and "knock [something]" as knocking on.

Carry out knocking on: 
	say "It doesn't knock." 


Part Looking through

Looking through is an action applying to one visible thing.
Understand "look through/in [something]" as looking through.

Carry out looking through:
	say "[The noun] [is-are] opaque."
	
		
Part Oiling

Oiling it with is an action applying to one thing and one carried thing.

Understand "oil [something] with [something]" as oiling it with.
Understand "oil [something]" as oiling it with.

Understand the command "lubricate" as "oil".

Rule for supplying a missing second noun while oiling:
	if the player can see the motor oil:
		change the second noun to the motor oil;
	otherwise:
		say "You don't have anything to oil [it-them of the noun] with." instead.
		
Check oiling it with:
	if the second noun is not the motor oil:
		say "[The second noun] is not lubricant enough." instead.
		
Carry out oiling it with:
	try pouring the motor oil on the noun instead.


Part Pointing at

Pointing it at is an action applying to one thing and one visible thing.

Understand "point [something preferably held] at/to/toward/towards [something]" as pointing it at.
Understand "point [something preferably held] out/from [something]" as pointing it at.
Understand "point [something preferably held] out from/of [something]" as pointing it at.
Understand "point [something preferably held]" as pointing it at.
Understand "point at/to/toward/towards/out/from [something] with [something preferably held]" as pointing it at (with nouns reversed).

Understand the command "shine" as something new.
Understand the command "shine" as "point".

Check pointing it at:
	if the noun is the player:
		say "You can't point yourself!" instead;
	if the player is not carrying the noun:
		say "(first taking [the noun])[command clarification break]";
		silently try taking the noun;
		
Carry out pointing it at:
	say "You point [the noun] at [the second noun]."
	


Part Pouring on

Pouring it on is an action applying to one carried thing and one touchable thing.

Understand "pour [something] on/in [something]" as pouring it on.
Understand "pour [something]" as pouring it on.

Rule for supplying a missing second noun while pouring:
	change the second noun to the floor.
	

Check pouring:
	if the noun is not liquid:
		say "You can only pour liquids." instead;
	say "That would just make a mess." instead.


Part Reaching through

Reaching through is an action applying to one thing.

Understand "reach through/in [something]" and "reach hand through/in [something]" and "reach your hand through/in [something]" and "put hand through/in [something]" and "put your hand through/in [something]" and "feel through [something]" as reaching through.


Carry out reaching through something:
	say "That's not something you could put your hand through."
	

Part Reading

[this is copied almost word-for-word from the Inform manual chapter 16.3]
A thing has some text called printing. The printing of a thing is usually "".

Understand the command "read" as something new. Understand "read [something]" as reading. Reading is an action applying to one thing requiring light.

Check reading (this is the nothing written rule):
	if the printing of the noun is "":
		say "There's nothing written on [the noun]." instead.

Carry out reading:
	say "[printing of the noun][line break]". 


Part Readying

Readying is an action applying to one thing.

Understand "ready [something]" as readying.
Understand "load [something]" as readying.

Check readying:
	if the noun is the trebuchet:
		try turning the winch;
	otherwise:
		say "You can't ready that."
		

Part Rubbing on

Rubbing it on is an action applying to one carried thing and one touchable thing.

Understand "rub [something] on [something]" as rubbing it on.
Understand "rub [something] to [something]" as rubbing it on.
Understand the command "smear" as "rub".

Carry out rubbing it on:
	say "That's not something you can rub on anything."
	

Part Screwing

Screwing is an action applying to one thing.

Understand "screw [something]" as screwing.
Understand "screw [something] in" as screwing.
Understand "screw in [something]" as screwing.
Understand "tighten [something]" as screwing.

Carry out screwing:
	try turning the noun instead.
	

Screwing it with is an action applying to two things.

Understand "screw [something] with/in [something]" as screwing it with.
Understand "screw [something] in with [something]" as screwing it with.
Understand "tighten [something] with/in [something]" as screwing it with.

Check screwing it with:
	if the second noun is not the Skindude:
		say "[The second noun] is not suitable for that." instead.
		
Carry out screwing it with:
	try screwing the noun instead.


Part Singing

A tune is a kind of thing. A tune is usually not conversable.

Instead of singing:
	try singing to a random generic song.

Singing to is an action applying to one visible thing.

Understand "sing [something]" as singing to.
Understand "sing [any known tune]" as singing to.
Understand "sing about [any known tune]" as singing to.


Check singing to:
	if the noun is not a tune:
		say "You can't sing that!" instead.
		
[each tune will have the carry out rule written with the rest of its code]


The song-disambig is a tune. The printed name is "some generic tune". Understand "some" and "generic" and "tune" and "song" as the song-disambig. It is familiar. It is proper-named.
Rule for printing the name of the song-disambig while asking which do you mean: say "[the random generic song]".

Carry out singing to the song-disambig:
	try singing to a random generic song instead.
		
A generic song is a kind of tune. It is always familiar. It is usually proper-named.


I am the very model of a modern Major-General is a generic song. 

Carry out singing to the I am the very model of a modern Major-General:
	say "[italic type]'I am the very model of a modern Major-General,[line break]
I've information vegetable, animal, and mineral,[line break]
I know the kings of England, and I quote the fights historical[line break]
From Marathon to Waterloo, in order categorical;[line break]
I'm very well acquainted, too, with matters mathematical,[line break]
I understand equations, both the simple and kumquatical,[line break]
About binocular theorem I'm teeming with a lot o['] news,[line break]
With many cheerful facts about the square of the hippopotamus.'[roman type][line break][if the creature is present][line break][c]You're not the very model of a modern English major, that's for sure,[c] [the creature] says."


Mary Had a Little Lamb is a generic song.

Carry out singing to the Mary Had a Little Lamb:
	say "[italic type]'Mary had a little lamb...'[roman type][paragraph break]That's all you remember now. It's a stressful situation after all.[if the creature is present][line break][c]Thank the heavens,[c] [the creature] sighs."


The Captain McBrawn Theme Song is a generic song. It is improper-named.

Carry out singing to the Captain McBrawn Theme Song:
	say "You proudly hum Captain McBrawn's theme song and regain a good dose of courage and morale."
	

I'm a Little Teapot is a generic song. It is improper-named.

Carry out singing to the I'm a Little Teapot:
	say "[italic type]'I'm a little teapot, short and stout. Here is my handle, here is my spout.'[roman type][line break][if the creature is present and the player is naked][line break][c]Oh for the love of everything that's good and holy! You [italic type]really[roman type] don't need to point out your spout!' [the creature] begs."
	

Part Swimming

Swimming in is an action applying to one thing. 

Understand "swim" as swimming in.
Understand "swim in [something]" as swimming in.

Should the game choose swimming in a liquid:
	it is an excellent choice.
	
Check swimming in:
	if the noun is a container:
		if a random thing in the noun is not a liquid:
			say "There's nothing in there to swim in and it would be too small anyway.";
		otherwise:
			say "It's too small to swim in.";
	otherwise if the noun is not a liquid:
		say "That's not liquid!";
	otherwise:
		say "There's not enough of it to go swimming in.";
	stop the action.



Part Tearing

Tearing is an action applying to one thing. 
Understand "tear [something]" and "tear [something] off" and "tear [something] out" as tearing.
Understand the command "rip" as "tear".

Carry out tearing: 
	say "That's not something you can tear."
	

Part Touching with

Touching it with is an action applying to two touchable things.

Understand "touch [something] with [something]" as touching it with.
Understand "touch [something] to [something]" as touching it with (with nouns reversed).
Understand "stick [something] in/to/inside/into [something]" as touching it with (with nouns reversed).

Carry out touching something with something:
	say "That wouldn't solve anything."


Part Ungluing

Ungluing it with is an action applying to two things.

Understand "unglue [something] with [something]" as ungluing it with.
Understand "remove [something] with [the glue remover]" as ungluing it with.

Rule for supplying a missing second noun while ungluing with:
	if the player can see the glue remover:
		change the second noun to the glue remover;
	otherwise:
		say "You don't have anything to unglue [it-them of the noun] with." instead.

Check ungluing it with:
	if the second noun is not the glue remover:
		say "You can't use that to unglue anything!" instead.
		
Carry out ungluing it with:
	try pouring the glue remover on the noun instead.


Part Unscrewing

Unscrewing is an action applying to one thing.

Understand "unscrew [something]" as unscrewing. 
Understand "loosen [something]" as unscrewing.

Carry out unscrewing:
	try turning the noun instead.
	

Unscrewing it with is an action applying to two things.

Understand "unscrew [something] with [something]" as unscrewing it with.
Understand "loosen [something] with [something]" as unscrewing it with.

Check unscrewing with:
	if the second noun is not the Skindude:
		say "[The second noun] is not suitable for that." instead.
		
Carry out unscrewing with:
	try unscrewing the noun instead.
	

Part Urinating

[I'm not a big fan of toilet humor but since there's a toilet hole so I guess this must be here as well.]

Urinating is an action applying to one thing.

Understand "urinate" as urinating.
Understand "urinate on [something]" as urinating.
Understand "urinate in [something]" as urinating.

Understand the command "pee" and "piss" and "wee" and "tinkle" and "whizz" as "urinate".
Understand the command "shit" as something new.
Understand the command "defecate" and "poop" and "shit" and "shite" and "crap" as "urinate".

Rule for supplying a missing noun while urinating:
	if the player can see the toilet hole:
		change the noun to the toilet hole;
	otherwise:
		change the noun to the floor. [this can be anything because the response is always the same.]

Check urinating:
	if the noun is not the toilet hole:
		say "That would just make a mess." instead.

Carry out urinating:
	say "You don't really need to go now[if the creature is in the cell]. And you couldn't, not with the creature looking[end if].[if the creature is present][line break][c]You can be 100 % sure that I wouldn't look,' [the creature] says and shakes its head."
	

Part Whimpering

Whimpering is an action applying to nothing.

Understand "whimper" and "bawl" and "blubber" and "howl" and "sob" and "wail" and "weep" and "cry" as whimpering.

Carry out whimpering:
	if the cell is dark:
		say "Oh well, no harm done, right? You let out a whimper.";
	otherwise:
		say "You whimper a bit.[if the creature is present][one of][insult wimpiness][or][stopping]".
		

Part Whistling

Whistling is an action applying to nothing.

Understand "whistle" as whistling.

Report whistling:
	say "You whistle a bit."
	

Part Yelling

Yelling is an action applying to one topic.

Understand "yell [text]" and "yell" as yelling.
Understand the command "shout" as something new.
Understand the commands "shout" and "scream" as "yell".

Carry out yelling:
	try calling the guard.
	


Book 10 - Inventory listing

Definition: A thing is cell inventory if it is in the cell and it is handled.

Instead of taking inventory:
	say "You are carrying [a list of things carried by the player including contents] and wearing [a list of things worn by the player].";
	if a cell inventory thing is in the cell, say "[line break]Also, [a list of cell inventory things in the cell including contents] [if the number of cell inventory things in the cell > 1 or a random cell inventory thing in the cell is plural-named]are[otherwise]is[end if] on the floor."



Book 12 - Lighting the cell

[These rules make it so that only the part that's on the window side is dark when the cell goes dark.]

A thing can be self-lit. A thing is usually not self-lit. ["self-lit" things are visible even if they are not under the moonlight (for example, the moon and the window)]
A thing can be hidden in dim light. A thing is usually not hidden in dim light. [these items are never in the scope while in darkness (unless carried)]

Definition: A thing is seen in darkness if it is enclosed by the cell and it is not hidden in dim light and (it is by the door or it is the middle or it is self-lit).
	
After deciding the scope of the player while in darkness:
	repeat with x running through every seen in darkness things:
		place x in scope, but not its contents;
	if the ominous shapes is in the cell:
		place the ominous shapes in scope.
		
The sticker is hidden in dim light.

Visibility rule when in darkness (this is the always light rule):
	if the current action is reading:
		there is insufficient light;
	there is sufficient light.

The look around once light available rule is not listed in any rulebook.



Book 11 - Default messages

[1. End of game messges]
Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <you have won>   	 " You have escaped "


[3. Prompts and Input]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <empty line>   	 "[if the creature is present][c]I beg your pardon?[c] [the creature] asks.[otherwise]I beg your pardon?[end if][line break]"
LibMsg <confirm Quit>   	 "The life of the President depends on you! Are you sure you want to quit? "
	

[4. Undo]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <undo succeeded>   	 "Due to some mysterious bump in time-space continuum, you find yourself in the exact situation you were just a minute ago.[if the creature is present][/p][silent c][one of]'Talk about Deus ex Machina,[c] [the creature] remarks.[or][The creature] digs a portable karaoke set from its bag and sings: [italic type]'If I could turn back time...'[roman type] It then puts the machine back in the bag.[or][c]You do know that whatever you do, you can't really get stuck?[c] [the creature] remarks.[or][c]No reason to get that dramatic,' [the creature] says. 'It's just UNDO.'[at random][end if][/p][bracket]Previous turn undone.[close bracket][/n]"
LibMsg <undo failed>   	 "'Undo' failed. [bracket]Not all interpreters provide it.[close bracket][/n][if the creature is present][/n][c]Let's see, I may have a [italic type]real[roman type] interpreter somewhere here...' [the creature] says and digs through its bag. [c]Nope. Sold the last one in 1987.'[/n]"
LibMsg <undo not provided>   	 "[bracket]Your interpreter does not provide 'undo'. Sorry![close bracket][/n][if the creature is present][/n][c]Let's see, I think I have a [italic type]real[roman type] interpreter somewhere here...' [the creature] says and digs through its bag. [c]Nope. Sold the last one in 1987.'[/n]"

[7. Syntax errors]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <command not understood>   	 "That command is too complex.[/n]"
LibMsg <command partly understood>   	 "That command is too complex; you might want to try to just "
LibMsg <command badly ended>   	 "The command's last part was too complex.[/n]"
LibMsg <command cut short>   	 "(Since something dramatic has happened, your list of commands has been cut short.)[/n]"
LibMsg <number not understood>   	 "That number was not understood.[/n]"
LibMsg <cannot begin at comma>   	 "You can't begin a command with a comma.[/n]"
LibMsg <extra words before comma>   	 "To command someone, try 'x, do this' or 'ask x to do this'.[/n]"


[8. Illegal commands]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <unknown object>   	 "There's no such thing here now.[/n]"
LibMsg <object not held>   	 "You need to take it first.[/n]"
LibMsg <unknown verb>   	 "That verb is not available.[if the cell is dark][one of][or][paragraph break][italic type](If you're not sure what to do, type HELP.)[roman type][or][stopping][end if][/n]"
LibMsg <verb cannot have inanimate object>   	 "You can only do that to a living thing.[/n]"
LibMsg <noun needed>   	 "The noun part was missing from that command.[/n]"
LibMsg <something more substantial needed>   	 "You can't do that to insubstantial things.[/n]"


[9. Multiple Objects]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <no objects available>   	 "You seem to be holding just about everything there is to take in the cell[if a bulky handled thing is in the cell]. Except [the list of bulky handled things in the cell], which [end if][if the number of bulky handled things in the cell > 1 or a random bulky handled thing in the cell is plural-named]are[otherwise if the number of bulky handled things in the cell is 1]is[end if][if a bulky handled thing is in the cell] so bulky they have to be picked up separately[end if].[/n]"


[13. Pronouns]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <pronoun not set>   	 "At there moment that pronoun doesn't seem to refer to anything."


[14. Commanding People]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <person ignores command>   	 "(You cannot command other characters directly in this game.)[/n]" 


[17. Transcripts]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <end of transcript>   	 "End of transcript.[if the creature is present][/p]'Can I get a copy of that transcript so I can check that it doesn't twist my words? No? Well, you'll be hearing from my lawyer,' [the creature] says and crosses its hands.[/n]"



[19. Darkness]

Table of custom library messages (continued)
Message Id		Message Text
LibMsg <dark description>	"The moonlight isn't sufficient enough for that.[/n]"


[20. Take]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <cannot take yourself>	"Alas, you are not Baron von Münchhausen.[/n]"
LibMsg <cannot take component parts>	"You can't pry [it-them of the noun] loose.[/n]"
LibMsg <cannot reach within closed containers>	"[The main object] isn't open.[/n]"
LibMsg <cannot take scenery>	"[Cap that-those of the noun] [is-are of the noun] not something you would carry around.[/n]"
LibMsg <cannot take something fixed>	"[Cap that-those of the noun] [is-are of the noun] not something you would carry around.[/n]"


[23. Insert]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <cannot insert something not held>   	 "You need to take [the main object] before you can put [it-them of the noun] into something else.[/n]"
LibMsg <cannot insert into something not a container>   	 "[Cap that-those of the noun] [is-are of the noun] not something you could put stuff into.[if the creature is present][one of][paragraph break][c]Hey, watch those stranded prepositions,' [the creature] points out.[or][stopping][end if][/n]"
LibMsg <cannot insert something into itself>   	 "It's not a Klein bottle.[/n]"


[26. Put on]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <cannot put something not held>   	 "You need to be take [the main object] before you can put [it-them of the noun] on top of something else."
LibMsg <cannot put something on it-self>   	 "[if the noun is not handled]You can't put something on top of itself.[otherwise if the creature is not present]You try for a good while, but you don't seem to get that idea to work.[otherwise]You try for a good while, but you don't seem to get that idea to work.[one of][paragraph break][question intelligence] [the creature] wonders.[or][stopping][end if][/n]"
LibMsg <cannot put onto something not a supporter>   	 "Putting things on [the main object] would probably not get you any closer to escaping.[/n]"
LibMsg <cannot put onto something being carried>   	 "You're too clumsy for that to work.[/n]"


[24. Give]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <cannot give to yourself>   	 "'Here you go, Scotty.' 'Why thank you, Scotty!' [if the creature is present][one of][paragraph break][question intelligence] [the creature] wonders.[or][stopping][end if][/n]"


[37. Unlock]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <cannot unlock without a lock>   	 "There's no lock on [it-them of the noun].[/n]"
LibMsg <cannot unlock something already unlocked>   	 "[Cap it-they of the noun] [is-are of the noun] already unlocked.[/n]"
LibMsg <cannot unlock without the correct key>   	 "That doesn't unlock [it-them of the main object].[/n]"


[38. Switch on ]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <cannot switch on unless switchable>   	 "There's no switch which to switch![/n]"


[39. Switch off]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <cannot switch off unless switchable>   	 "There's no switch which to switch![/n]"


[40. Wear]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <cannot wear something not clothing>   	 "[Cap that-those of the noun] [is-are of the noun] not clothing![/n]"


[42. Senses]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <cannot eat unless edible>   	 "You have eaten a lot of strange stuff, but [the noun] [is-are of the noun] not something you want to put in your mouth.[/n]"
LibMsg <block drinking>   	 "[Cap it-they of the noun] [is-are of the noun] not liquid.[/n]"
LibMsg <block tasting>   	 "You lick [the noun]. It's definitely not [one of]strawberry[or]banana[or]chocolate[or]cherry[or]blueberry[at random].[/n]"
LibMsg <block smelling>   	 "There's no distinguishable smell to [it-them of the noun].[/n]"
LibMsg <block listening>   	 "[if the noun is plural-named]They don't[otherwise]It doesn't[end if] make a sound.[/n]"


[43. Touching]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <report player touching things>   	 "It feels like [a main object].[/n]"


[48. Rhetorical Commands]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <block saying yes>	"[if the guard is in the cell][g]OK THEN,' the guard roars.[otherwise if the creature is present][silent c][The creature] gives you a thumbs-up and a grin.[otherwise]Nobody asked a question.[end if][/n]"
LibMsg <block saying no>	"[if the guard is in the cell][g]RIGHT-O,' the guard roars.[otherwise if the creature is present][silent c][The creature] gives you a quizzical look.[otherwise]Nobody asked a question.[end if][/n]"
LibMsg <block saying sorry>	"[if the creature is present][c]Yeah, I'd be sorry too,' [the creature] says.[otherwise]You are forgiven.[end if][/n]"
LibMsg <block swearing obscenely>	"Such language! What would your mother think of you?[if the creature is present][one of][line break][your mom joke][or][/n][stopping][otherwise][/n]"
LibMsg <block swearing mildly>	"Very much so.[/n]"


[49. Body Movement]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <block climbing>   	 "That wouldn't help you escape.[/n]"
LibMsg <block swinging>   	 "It wouldn't be sensible to swing that here.[/n]"


[50. Physical Interaction]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <block attacking>   	 "You would possibly hurt yourself more than [the main object].[/n]"
LibMsg <block setting to>   	 "That's unsettable.[if the creature is present][paragraph break][c]Is that even a word?' [the creature] wonders.[end if][/n]"
LibMsg <block tying>   	 "You can't attach them together.[/n]"
LibMsg <report player squeezing>   	 "That wouldn't solve anything.[/n]"
LibMsg <block throwing at>   	 "That wouldn't solve anything.[/n]"
LibMsg <throw at inanimate object>   	 "That wouldn't solve anything.[/n]"
LibMsg <block jumping>	"You jump up and down.[if the creature is present and the player is naked][paragraph break][c][one of]Oh dear god. Please don't do that again[or]That's just too disturbing[stopping],' [the creature] says.[end if][/n]"
LibMsg <block cutting>   	 "[if the player can see the nail scissors]Cutting [that-those of the noun] wouldn't solve anything.[otherwise]You don't have anything to cut with.[end if][/n]"


[51. Push, Pull, Turn]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <report player pushing>   	 "That wouldn't solve anything.[/n]"
LibMsg <report player pulling>   	 "That wouldn't solve anything.[/n]"
LibMsg <report player turning>   	 "That wouldn't solve anything.[/n]"
LibMsg <cannot push something fixed in place>   	 "That wouldn't solve anything.[/n]"
LibMsg <cannot pull something fixed in place>   	 "That wouldn't solve anything.[/n]"
LibMsg <cannot turn something fixed in place>   	 "That wouldn't solve anything.[/n]"
LibMsg <cannot push scenery>   	 "That wouldn't solve anything.[/n]"
LibMsg <cannot pull scenery>   	 "That wouldn't solve anything.[/n]"
LibMsg <cannot turn scenery>   	 "That wouldn't solve anything.[/n]"
LibMsg <cannot push people>   	 "That wouldn't solve anything.[/n]"
LibMsg <cannot pull people>   	 "That wouldn't solve anything.[/n]"
LibMsg <cannot turn people>   	 "That wouldn't solve anything.[/n]"

[52. Speech]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <block answering>    	 "(Conversation in this game is handled with the command TALK ABOUT.)[/n]"
LibMsg <block asking>    	 "(Conversation in this game is handled with the command TALK ABOUT.)[/n]"

[53. Mental Actions]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <block thinking>   	 "You think as hard as you can, but nothing particular comes to mind.[/n][if the creature is present][line break][one of][c]I'm not at all that surprised,' [the creature] says.[or][c]Looking for a hint, eh?' [the creature] says.[or][c]Don't force it. It's not something that comes naturally to all people,' [the creature] says.[at random][/n][end if]"


[54. Sleep And Waiting]

Table of custom library messages (continued)
Message Id   	 Message Text
LibMsg <block sleeping>   	 "Now is not the time to sleep! And there's no bed here, either.[/n]"
LibMsg <block waking up>   	 "If this were a dream, at this point you would have already awakened and would be on your way to the laundry room.[/n]"
LibMsg <report player waiting>   	 "You wait for a while.[if the creature is present and a random chance of 1 in 10 succeeds][paragraph break][c]Booooring,' [the creature] says and yawns.[end if][/n]"


Part Disambiguation control

[
There's a fatal bug somewhere - if the following code is added, the game crashes when trying to access in-game menu items. (You can believe this was a pain to locate.) I've changed these by hand right into the Disambiguation Control source.

Release 2: There's a new release of the extension, don't know if that has fixed the problem.

Table of Disambiguation Messages (amended)
message-id   	 message text
1   	 "Please be more specific - "
2   	 "Whom do you mean: "
3   	 "Which do you mean: "
4   	 "Which person do you mean?[paragraph break]"
5   	 "Which object do you mean?[paragraph break]"
6   	 "whom do you mean: "
7   	 "which do you mean: "
8   	 "whom do you mean?[paragraph break]"
9   	 "which object do you mean?[paragraph break]"
]



Part Easter eggs and the like


Understand "escapade" as a mistake ( "That's not a verb." ).

Understand "xyzzy" and "plugh" as a mistake ( "[if the creature is present][The creature]'s voice says, [c]Oh come on! Talk about beating a dead horse!'[otherwise]You try to teleport yourself in front of the White House with magic words, but it doesn't work." ).

Understand "frotz" as a mistake ( "[if the cell is lit]The cell is already lit.[otherwise]You try to make some light with magic, but not surprisingly, it doesn't work." ).

Understand "rezrov" and "rezrov [the celldoor]" and "rezrov [the trapdoor]" as a mistake ( "You try to open the door with magic, but not surprisingly, it doesn't work." ).

Understand "heteronormativity off" as a mistake ( "That verb is not available, sugar puffs." ).

Understand "roll" as a mistake ( "[if the creature is present]'This is how I roll.'[paragraph break][c]Good for you,' [the creature] says.[otherwise]That's how you roll." ).

Understand "die" as a mistake ( "The situation is not that bad yet." ).

Understand "use [text]" as a mistake ( "'Use' is too vague; you need to be more specific." ).

Understand "pause" and "pause game" and "pause the game" as a mistake ( "The game is now paused. Type any command to continue." ).

Understand "i [text]" and "i'm [text]" as a mistake ( "That command isn't understood. If you're not sure what to do, type HELP." ). [for those "I don't know what to do" commands.]

Understand "spit" as a mistake ( "That's a nasty habit.[if the creature is present][paragraph break][c]Yeah, and your [key acidic spit]spit[endkey acidic spit] isn't as cool as mine,' [the creature] comments." ).



Volume 2 - The World

Book 1 - When play begins

When play begins:
	say "'We'll have to split up. I'll go after the bombers, you find the fastest way out of here. Tell the President he has to evacuate, immediately!'
	
Those were the last words you heard from Captain McBrawn before he rode away hanging on the skid of a helicopter with one hand, his muscular arm gleaming in the light of the setting sun. It is up to you now to find your way to the President of the World and warn him of the impending attack. Finally, some responsibility after all these years!

You descend from the rooftop planning the trip to the drop-off point. At the base of the building the Screaming Communists capture you. Figures.";
	pause the cutscene;
	say "A group of stern, vicious looking Screaming Communists march through the barren land, dragging you behind them. Their destination is a gloomy medieval castle. The commander shouts orders to one of the soldiers who grabs you by the collar of your sweater and escorts you inside.
	
After a long climb through dark corridors and endless staircases the guard throws you in a dark, cold cell and slams the door shut. A chill runs down your spine and desperation starts to creep in.[line break][line break]"


Before looking for the first time:
	say "[command clarification break]";

After looking for the first time:
	say "[italic type](For more information about the game, type ABOUT.)[roman type][line break]".
	

The mark items as seen when looking rule is listed in the when play begins rules. [this makes sure the items initially in the cell are marked as "known"]



Book 2 - The player


Understand "scotty" as yourself.
Understand "you" as yourself.


The description of yourself is "[one of]You're the hero of the day, the man everyone looks up to, the uncontested champion of the Free World, the celebrated superstar - Captain McBrawn.[paragraph break]Or at least you would like to be. The truth is that y[or]Y[stopping]ou are Scotty, Captain McBrawn's short and a bit round sidekick. You have followed him on his adventures and helped him mostly by staying out of his way, but now you have a mission of your own."

The creature response of yourself is "'My name is Scotty,' you introduce yourself.[paragraph break]'Nice to meet you, monkey boy,' [the creature] says.[paragraph break]'Scotty.'[paragraph break]'What did you say, monkey boy?'".

The guard response of yourself is "'Don't you know who I am[interrobang]' you demand.[paragraph break]'NO,' the guard replies.[paragraph break]'Well... uh... I'm Scotty,' you say."

After examining yourself:
	try taking inventory.
	
Instead of attacking yourself:
	say "You slap yourself silly for not finding an escape yet."
	
Instead of listening to yourself:
	say "That's a good advice."
	
Instead of smelling yourself:
	say "You don't smell that bad.[if the creature is present][line break][c]Well, everyone is entitled to their opinion,' [the creature] says."
	
Instead of eating or tasting yourself:
	say "You lick yourself but don't taste anything out of the ordinary."
	
Instead of looking through yourself:
	say "You can't see through yourself.[if the creature is present][line break][c]No, but if you turn your head a little I can see from your left ear through the right,' [the creature] comments."

Instead of touching or rubbing yourself:
	if the player is naked and the creature is present:
		say "You rub yourself all over with care and dedication.[paragraph break][c]Oh man, I'm going to vomit right now,' [the creature] squeals.";
	otherwise:
		say "You give yourself a thorough touching."
		

Part Clothing


The adventuring clothes is wearable thing. It is plural-named, self-lit and bulky. The description is "[if the adventuring clothes are worn]You are wearing[otherwise]They are[end if] a pair of green pocketless pants and a gray wool sweater. Your adventuring clothes - that's what mom said when she bought them. They've turned out being not very well suited for the purpose though. They're very thick and a bit too big."

Instead of examining the adventuring clothes when the creature is present for the first time:
	say "[the description of the adventuring clothes][line break][your mom joke]".
	
The player wears the adventuring clothes.

Understand "clothing/cloth" and "adventure" and "pant/pants" and "sweater" and "shirt" and "gray" and "green" and "wool" and "pair" and "pair of" as the adventuring clothes.

The indefinite article of the adventuring clothes is "your".


Instead of eating the adventuring clothes:
	say "Let's leave that to orcs and such.".

Instead of opening the adventuring clothes:
	say "They don't have buttons.".

After wearing the adventuring clothes when the creature is present:
	say "[one of][c]Thank heavens,' [the creature] sighs when you put on your clothes.[or]You put your clothes on.[paragraph break][c]I and my eyes thank you, good sir,' [the creature] says.[or]You put your clothes back on.[paragraph break][c]Best idea you have had yet,' [the creature] says.[at random]".

After taking off the adventuring clothes:
	say "You strip naked.[if the creature is present][line break][one of][c]That's so very much unnecessary,' [the creature] remarks dryly.[or][c]Oh for crying out loud!' [the creature] yells. 'That's [italic type]really[roman type] not something I would have wanted to see.'[or][c]Ok, I don't mind you taking your clothes off, really,' [the creature] says. 'But could you [italic type]please[roman type] stop dancing while doing it?'[or][c]I've always wondered why humans wear clothes,' [the creature] says. 'I wonder no more.'[or][The creature] sighs. [c]Ok, go ahead, take [']em all off, see if I care!'[stopping]";
	now the clothes are in the cell.



Instead of attacking the adventuring clothes:
	say "It'd be best not to destroy the only clothes you have here.".

Instead of touching the adventuring clothes when the creature is present for the first time:
	say "Mmm. Mom has used the good fabric softener.[your mom joke]".

Instead of touching the adventuring clothes:
	say "Mmm. Mom has used the good fabric softener.".

Instead of squeezing the adventuring clothes:
	say "They're all dry already.".

Instead of smelling the adventuring clothes:
	say "They smell like... you.".

Instead of rubbing the adventuring clothes:
	say "They're clean enough.".

Instead of climbing the adventuring clothes when the adventuring clothes are not worn:
	say "They don't form a pile that high.".
	
The printing of the the adventuring clothes is usually "There are no care labels. Mom knows how to wash them even without."
Instead of reading the the adventuring clothes when the creature is present for the first time:
	say "[printing of the noun][line break][your mom joke]".

Instead of looking under the adventuring clothes when the adventuring clothes are worn:
	say "Under your clothes is... you![if the creature is present][line break]'Found anything? I didn't think so,' [the creature] remarks.";
	
Instead of looking under the adventuring clothes when the adventuring clothes are in the cell:
	say "Nothing has magically appeared under the clothes after you put them on the floor."



To decide whether the player is naked: 
	if the player is wearing something, decide no;
	decide yes.
	
To decide whether the player is clothed:
	if the player is naked, decide no;
	decide yes.
	

[
In the early drafts the initial puzzle was to turn the light bulb *off*, and that required protecting your hands with a piece of clothing because the light bulb was too hot to touch. When the puzzle changed, individual pieces of clothing were dropped as well for the sake of simplicity.

Chapter Sweater

The sweater is clothing worn by the player. The description is "It's your adventuring sweater. It is actually not very well suited for adventuring, being thick and a bit too big, but that's what your mom said it was when she gave it to you. It has long sleeves that can be pulled over your hands if it gets too cold."

Instead of examining the sweater when the creature is present for the first time:
	say "[the description of the sweater][line break][your mom joke]";

Instead of looking under the sweater when the sweater is worn:
	say "Under your clothes is... you![if the creature is present and clothing are worn][line break]'Found anything? I didn't think so,' [the creature] remarks.[otherwise if the creature is present][line break]'Good, that's a start. The next step is to actually pick them up and [italic type]wear them[roman type],' [the creature] says.".

Instead of looking under the sweater when the player is not carrying the sweater:
	say "Nothing has magically appeared under [the noun] after you put it on the floor."



Section Sleeves

The sleeves are part of the sweater. The sleeves can be rolled or pulled over hands. 




Chapter Pants

The pants are clothing worn by the player. They are plural-named. The indefinite article is "a pair of". The description is "Your green pants. Very comfortable. No pockets, though, which is a real inconvenience."

Understand "trousers" and "pair of" and "pair" as the pants.

Instead of searching the pants when the pants are worn:
	say "That's Little Scotty in there.[if the creature is present and the pants are worn][line break][c]Find anything? I didn't think so,[c] [the creature] remarks."
	
Instead of searching the pants when the player does not have the pants:
	say "****.[if the creature is present][line break][c]Good, that's a start. The next step is to actually pick them up and [italic type]wear them[roman type],[c] [the creature] says.".
	

]


	


Part Body parts

Chapter Tongue

The tongue is part of the player. The description is "You can't see it without a mirror."

The creature response of the tongue is "'Blaah,' you blurt out and show your tongue to the creature. 'What the [bowdler],' [the creature] says."

The tongue can be numb. It is not numb.


The Numbed Tongue is a recurring scene.

The Numbed Tongue begins when the tongue is numb.

The Numbed Tongue ends when the time since The Numbed Tongue began is 8 minutes.

When the Numbed Tongue ends:
	if the tongue is numb:
		say "The numbness on your tongue subsides and some sense returns to it[if the creature is present][one of]. [c]Too bad that doesn't apply to the rest of your head,[c] [the creature] quips[or][stopping][end if].";
		now the tongue is not numb.
	

Instead of touching something with the tongue:
	try tasting the noun.

Instead of tasting the tongue:
	say "No, you taste things [italic type]with[roman type] a tongue."
	
Instead of eating the tongue:
	say "It would choke you."
	
Instead of looking through the tongue:
	try examining the tongue.
	



Chapter Nails

The nails are a part of the player. They are plural-named.

Instead of touching something with the nails:
	try touching the noun.
	

	
Instead of cutting the nails when the player can see the nail scissors:
	say "The scissors seem to be so dull you can't cut your nails with them.[if the creature is present][line break]'Hey!' you exclaim. [The creature] pretends to not notice." instead.



Book 3 - The Cell

The cell is a room. "The cell walls are of gray stone and a small barred window leads outside to freedom. A silvery air vent runs right above the window[if the toilet hole is not handled] and there's a hole in the floor under it in the corner, apparently to be used as a toilet[end if]. [if the light bulb is part of the electrical wire and the electrical wire is not pulled out]A light bulb hangs from the ceiling illuminating the cell[otherwise if the light bulb is part of the electrical wire and the electrical wire is pulled out]A light bulb attached to an electrical wire illuminates the cell[otherwise if the player has the light bulb]The light bulb you carry illuminates the cell[otherwise]The light bulb illuminates the cell[end if]. [if the trapdoor is unrevealed]A simple rug is on the floor[otherwise if the trapdoor is open][paragraph break]There's an open trapdoor on the floor[otherwise][paragraph break]There's a closed trapdoor on the floor[end if]."

Rule for printing the name of a room:
	do nothing. [this is mainly for UNDO]

Rule for listing nondescript items of the cell: 
    say "On the floor "; 
    list the contents of the cell, as a sentence, 
        tersely, listing marked items only, prefacing with is/are, 
        including contents and giving brief inventory information; 
    say "."


The cell is dark.

Rule for printing the description of a dark room:
	say "The moonlight gives dim illumination to the front part of the cell, leaving the opposite wall completely in the dark. There's [if the light bulb is part of the wire]an unlit light bulb hanging from the ceiling and [end if]a heavy steel door on the wall opposite to the barred window, but the room is otherwise featureless.

You can barely make out the outlines of some dark shapes in one dark corner of the cell.[if a handled thing is in the cell][line break]The light is just enough for you to see [the list of handled things in the cell] on the floor.".


Instead of smelling the cell:
	say "The air smells weird, like the cell has never been cleaned."
	
Instead of listening to the cell:
	say "The cell is ominously silent."
	

Part Door

The celldoor is a thing in cell. It is scenery and by the door. The printed name is "door". The description is "The door is made of heavy reinforced steel plates, attached with large bolts. The hinges are on the left side and on the right side is the keyhole.

There's a small rectangular metal plate in the middle of the door.".
The celldoor can be insulated. It is not insulated.

The creature response of the celldoor is "'How am I supposed to get that door open?'[paragraph break]'I think you're [italic type]not[roman type] supposed to get it open,' the creature replies."

The guard response of the celldoor is "'Could you please open the door?' you ask.[paragraph break]'HA! HA! HA HA HA! HA! HA HA!' is all he replies."

Understand "heavy" as the celldoor.
Understand "reinforced" as the celldoor.
Understand "steel" as the celldoor.
Understand "door" as the celldoor.

Instead of taking the celldoor:
	say "You can't even open it, even less carry it around.".

Instead of eating the celldoor:
	say "If your teeth would only bite through steel, you'd happily gnaw your way through.".

Instead of looking under the celldoor:
	say "There's no gap at all between the door and the floor.".

Instead of locking the celldoor with:
	try locking the keyhole with the second noun.

Instead of unlocking the celldoor with:
	try unlocking the keyhole with the second noun.

Instead of opening or unbolting the celldoor:
	say "You don't have the key.".

Instead of closing the celldoor:
	say "It's already closed.".

Instead of touching the celldoor:
	say "It feels hard and smooth.".
	
Instead of looking through the celldoor:
	try looking through the keyhole.
	
Instead of attacking the celldoor:
	say "You pound the door but it doesn't give in. 'Let me out!' you scream.[paragraph break][if the guard is in the cell][g]STOP THAT,' the guard shouts.[otherwise]'KEEP THE NOISE DOWN IN THERE,' you hear from the other side."

Instead of hitting the celldoor with a sturdy thing:
	try attacking the celldoor.

Instead of pushing the celldoor:
	say "You push, but it doesn't open. Possibly because the hinges are on this side."


Instead of pulling the celldoor:
	say "There's nothing to get a handle on.".

Instead of tasting the celldoor:
	say "You lick the door a bit. It tastes icky.[if the creature is present][one of][line break][question intelligence] [the creature] taunts you.[or][stopping]".
	

Chapter Keyhole

The keyhole is a part of the celldoor. It is by the door. The description is "There's a tiny keyhole in the cell door[if the cell is dark] where from a faint beam of light enters the cell[end if]. Too bad you don't have the key."

Understand "lock" and "key hole" as the keyhole.

Instead of looking under the keyhole:
	say "There's nothing under it but the door."
	
Instead of looking through the keyhole:
	if the guard is in the cell:
		say "You can't see anything through the keyhole. The guard's in the way.";
	otherwise:
		say "Through the keyhole you see a small part of the corridor behind the door. Sweet freedom!";

Instead of locking the keyhole with:	
	say "The idea would be to [italic type]unlock[roman type] it.".
	
Instead of unlocking the keyhole with:
	say "That's not something that you could use to pick the lock. Not that you knew how even with a real set of lockpicks."
	
Instead of smelling or touching the keyhole:
	say "You can feel fresh air flowing through from the other side. Well, fresh compared to the air on this side."
	
Instead of climbing through the keyhole:
	say "The keyhole is obviously way too small for climbing through it."

Understand "pick [keyhole] with [something]" as unlocking it with.




Chapter Metal plate

The metalplate is part of the celldoor. It is scenery and by the door. The printed name is "metal plate". The description is "[if the metalplate is shut]There's a metal plate embedded in the door on the eye level, about three centimeters high and thirty centimeters wide.[otherwise]Where there used to be a metal plate now two eyes stare at you.".

Definition: The metalplate is slid open rather than shut if the guard is in the cell.

Understand "rectangular" as the metalplate.
Understand "metal" as the metalplate.
Understand "plate" as the metalplate.
Understand "eye hole" and "eyehole" as the metalplate.
Understand "metal" and "plate" as the metalplate.


Instead of taking the metalplate:
	say "There's nothing to get a hold of. It doesn't seem like it could be removed.".

Instead of entering the metalplate:
	say "It's way too small.[if the creature is present][paragraph break][c]Or you're just way too big,' [the creature] notes.".

Instead of searching or looking through the metalplate when the metalplate is slid open:
	try examining the guard.

Instead of opening the metalplate:
	say "[if the metalplate is shut]There's no obvious mechanism to open it from this side.[otherwise]It's already open.".

Instead of closing the metalplate:
	say "[if the metalplate is slid open]There's no obvious mechanism to close it from this side.[otherwise]It's already closed.".

Instead of attacking the metalplate:
	try knocking on the celldoor.

Instead of touching the metalplate:
	if the metalplate is shut:
		say "It feels metallic.";
	otherwise:
		try touching the guard.

Instead of pushing, pulling or turning the metalplate:
	if the metalplate is shut:
		say "It doesn't move.";
	otherwise:
		try pushing the guard.

Instead of smelling the metalplate:
	if the metalplate is slid open:
		try smelling the guard;
	otherwise:
		try smelling the celldoor.	

Instead of tasting the metalplate:
	try tasting the celldoor.

Instead of rubbing the metalplate:
	say "It's a bit shinier now.".
	
Instead of knocking on the metalplate:
	if the metalplate is shut:
		try knocking on the celldoor;
	otherwise:
		try knocking on the guard.




Chapter Hinges

The doorhinges is a thing. It is plural-named. It is part of celldoor. It is by the door and scenery. The printed name is "hinges". The description is "The hinges of the door are [if the doorhinges are bolted]bolted[otherwise]screwed[end if] into the wall.". They can be tightened or bolted. They are tightened.

Understand "screw/screws" as the doorhinges.
Understand "hinge/hinges/doorhinge" as the doorhinges.
Understand "door hinge/hinges" as the doorhinges.
Understand "bolt/bolts" as the doorhinges when the doorhinges are bolted.

Instead of taking the doorhinges:
	say "The hinges don't come off with bare hands.".

Instead of attacking the doorhinges:
	say "You pound the hinges with your fists. Nothing happens.".

Instead of pushing, pulling or turning the doorhinges:
	if the player is carrying the multitool:
		try unscrewing the doorhinges;
	otherwise if the player can see the multitool:
		say "(first taking [the multitool])[command clarification break]";
		silently try taking the multitool;
		try unscrewing the doorhinges;
	otherwise:
		say "The hinges don't come off with bare hands.".

Instead of tasting the doorhinges:
	say "Unsurprisingly, licking the hinges does not make them come off.[if the creature is present][line break][c]Hey, [italic type]I'm[roman type] the one with [key acidic spit]acidic spit[endkey acidic spit],[c] [the creature] hollers.".

Instead of screwing the doorhinges:
	if the doorhinges are tightened:
		say "The screws are already screwed in all the way.";
	otherwise:
		say "They changed the screws to bolts."
	
Check unscrewing the doorhinges:
	if the doorhinges are bolted:
		try screwing the doorhinges instead;
	if the player does not have the Skindude multitool:
		try turning the doorhinges instead.
		
Carry out unscrewing the doorhinges:
	say "You take the Skindude[tm] multitool and loosen the screws on the hinges.[paragraph break]After a good push the door falls open without its hinges. You run through it and turn left in the corridor - and end up in the arms of the guard. 'HOW THE... DID THE DOOR JUST FALL DOWN?' he shouts.[paragraph break]The guard grabs you and takes you to what's probably a break room. There are a dozen Screaming Communists sitting there, watching you suspiciously and shouting a word or two at times[if the player is naked]. Mostly what they say doesn't make much sense, but 'WHY IS HE NAKED' and 'THAT'S DISTURBING' seem to be common topics[end if].";
	pause the cutscene;
	say "[c]Congratulations on your [italic type]escape[roman type],' [the creature] mocks you when they return you to the cell. The door seems to be fixed now.
	
You wave the screwdriver victoriously. 'They didn't take this away! I'll just unscrew the hinges again!' 

'Oh, by the way, they bolted the hinges while you were away. Sorry, what were you saying?'";
	mark the escape down as "unscrewing the hinges on the door";
	now the doorhinges are bolted;
	now the multitool is not useful;
	stop the action.
	

Test screws with "test c/a free/unscrew screws".



Chapter Unlocking the door when the toilet hole is attached to it


Instead of unbolting or opening the celldoor when the toilet hole is part of the celldoor:
	if the guard is in the cell:
		say "Better not do that now when the guard is right on the other side.";
	otherwise:
		say "[one of]You reach through the toilet hole and reach for the keyhole on the other side. You are delighted to find the key in the lock![or]You reach for the key again.[stopping][line break]";
		if the electrical wire is boobytrapping the door:
			say "As you touch the key, the electrical wire attached to the keyhole gives you a good zap. You quickly pull your hand away.[if the creature is present][one of][line break][question intelligence] [the creature] says.[or][stopping]";
		otherwise:
			say "The key turns easily and you open the door very very carefully. You sneak into the corridor and close the door again.";
			pause the cutscene;
			say "The guard stands behind the door with his arms crossed.[paragraph break]'Do you REALLY THINK I wouldn't NOTICE A HAND REACHING THROUGH THE DOOR?' he roars.[paragraph break]'Well I kinda assumed so,' you say.[paragraph break]He squints his eyes and takes a step forward. You open the door again, step inside and close the door.[paragraph break]The guard grabs the hole and pulls it off. 'NO MORE TRICKS!' he yells.[silent c]";
			remove the toilet hole from play;
			remove the doorkey from play;
			mark the escape down as "unlocking the door through the hole".
	




Part Floor

The floor is scenery in the Cell. It is unspecified and self-lit. The description is "The stone floor is a dirty and cold."

Understand "ground" and "down" and "stone" and "dirty" and "cold" as the floor.

Instead of examining down:
	try examining the floor.
	
Report touching the floor:
	say "It feels cold." instead.
	
Instead of listening to the floor:
	say "You go down on your knees and put your ear against the floor, but you can't hear anything from below.".
	 
Instead of pushing the floor:
	say "You don't manage to push through."
	
Instead of looking under the floor:
	say "You can't look [italic type]under[roman type] the floor!"
	
Instead of climbing the floor:
	say "It's vertical. You can't climb that."
	


Instead of getting off the floor:
	say "Yes, you would very much like to get off the floor and out the cell."
	
	


Part Walls

The walls are scenery in the Cell. It is unspecified, self-lit and plural-named. The description is "The gray stone walls surround you from all directions."

Understand "wall" and "gray" and "stone" as the walls.

The creature response of the walls is "'It's not very nice being trapped between four walls,' you confess.[paragraph break][The creature] shrugs. 'I only see three.'".

The guard response of the walls is "'You have to let me out! I'm claustrophobic!' you beg.[paragraph break]'LIFE SUCKS doesn't it, but WHAT CAN YOU DO?'"

Instead of listening to the walls:
	say "You put your ear against the wall and listen carefully. There's no sound whatsoever.[if the creature is present][line break][c]The [key walls]walls[endkey walls] are at least half a meter thick. You ain't gonna hear a thing,' [the creature] tells you."
	
Instead of pushing the walls:
	say "You push, but the walls don't budge.[if the creature is present][line break][c]No surprises there,' [the creature] comments."
	
Instead of looking under the walls:
	say "There are no cracks or anything else to look under."



Part Ceiling

The ceiling is scenery in the cell. It is unspecified, self-lit and distant. The description is "The ceiling is far above the ground. [description of the ceiling-trapdoor]"

Understand "roof" as the ceiling.

Instead of examining up:
	try examining the ceiling.
	


Chapter Ceiling-trapdoor

The ceiling-trapdoor is scenery in the cell. The printed name is "[if the cell is dark]largish square[otherwise]wooden square[end if]". It is unspecified, self-lit and distant. The description is "[if the cell is dark]There's a largish square up in the ceiling on one side[otherwise if the trapdoor is not open]There's a wooden square up in the ceiling on one side[otherwise if the trapdoor is familiar and the trapdoor is in the middle]The trapdoor hangs open in the ceiling right above itself. Oof, your head hurts[otherwise if the trapdoor is familiar]The trapdoor hangs open in the ceiling on the opposite side of itself. Which is a bit strange, but hey[end if]."

Understand "square" and "largish" and "wooden" as the ceiling-trapdoor.





Part Window

The barred window is scenery supporter in the Cell. The carrying capacity is 2. It is by the window and self-lit. The description is "The window is nothing but a hole in the wall with [if the iron bars are part of the window]three iron bars running across it[otherwise]thick slab of transparent plexiglas installed to it[end if]. Through it you see [if the clouds are in the cell]dark clouds blocking the moonlight[otherwise]a beautiful moonlit night sky[end if]."

Carry out looking through the barred window:
	try examining the window instead.

Carry out reaching through the barred window:
	say "You put your hand through the window and wave a bit. Nothing happens."

Instead of smelling the window:
	say "Ah. The smell of freedom."
		
Should the game choose when comparing the flux capacitor against the barred window:
	never.

Instead of opening the window:
	say "There's nothing to open. It's just a barred hole in the wall."
	
Instead of looking under the window:
	say "The wall is under the window."
	
Instead of listening to the window:
	say "Through the window you hear the sounds of the night: the wind, the crickets, yells of Screaming Communists..."
	
Instead of entering or climbing through the barred window:
	say "The window would be big enough to crawl through, but [if the iron bars are part of the barred window]the bars are[otherwise]the plexiglas is[end if] on the way."
	
Instead of climbing outside:
	try climbing through the barred window.
	
Instead of eating or tasting the barred window:
	say "It's just a hole in the wall. Not much to eat."
	
Instead of screwing or unscrewing the barred window:
	try unscrewing the iron bars.
	
Before pushing something when the noun is on the barred window:
	say "It would fall out the window, and you wouldn't get it back.";
	stop the action.
	
Instead of pushing or pulling or turning the window:
	try pulling the iron bars.
	
Instead of climbing the window:
	say "It's not so high that you would have to climb."




Chapter Bars

The iron bars are part of the barred window. They are plural-named, by the window and self-lit. 
The description is "[if the iron bars are part of the window]Three iron bars prevent anyone from climbing out the window.[otherwise if the iron bars are part of the winch]The iron bars are set in the holes of the winch, creating handy handles.[otherwise]The bars used to be in the window before you corroded them off. They seem to have replaced the bars in the window but left the old ones behind.";

The iron bars can be acidproof. They are not acidproof.
The iron bars can be known to be acidproof. They are not known to be acidproof.

Understand "rod/rods" and "bar" as the iron bars.

The creature response of the iron bars is "[if the iron bars are part of the window]'There are bars on the window.'[paragraph break]'Well, duh,' [the creature] replies.[otherwise]'I didn't know there would be a moat.'[paragraph break]'Yes, a [key castle]castle[endkey castle] with a moat is totally unheard of.'".

Instead of putting acidic spit on the iron bars:
	try pouring the acidic spit on the iron bars.
	
Instead of pulling or pushing or turning the iron bars:
	try taking the iron bars.

Instead of pouring acidic spit on the iron bars for the first time:
	say "Carefully applying the creature's spit on both ends of the bars, one after another they corrode off and fall on the cell floor. You climb out through the window. It's hard to see in the dark, but the ground doesn't seem to be that far away so you just jump.
	
'[if the tongue is numb]Fheeom! Fheeom! Fhee--[otherwise]Freedom! Freedom! Free--[end if]' you rejoice just before landing in a moat. Your are in the water by the neck and your feet are stuck in the mud. '[if the tongue is numb]Uh... Hehho? Hoehohe[otherwise]Uh... Hello? Someone[end if]? ...'";
	pause the cutscene;
	say "The Screaming Communists find you after a couple of hours, pull you out from the moat and return you back to the cell.
	
[c]How was the freedom?' [the creature] asks.";
	mark the escape down as "climbing through the window";
	remove the acidic spit from play;
	now the plexiglas is part of the window;
	now the iron bars are in the cell;
	now the tongue is not numb.
	
Instead of screwing or unscrewing the iron bars:
	say "The bars are welded, not screwed."
	
Instead of opening the iron bars:
	say "They don't have any visible mechanism to open them. In fact they look like they're welded in the frame."
	
Test bars with "test encyclopedia/open book/put spit in glass/pour spit on bars".


Chapter Plexiglas

The plexiglas is a thing. The description is "The Screaming Communists have replaced the iron bars with thick transparent plexiglas while you were away. At least it'll keep the cold away better than before."

Understand "plexi" and "plexiglass" and "plexi glass" and "plexi-glass" and "plastic" as the plexiglas.

The printing of the plexiglas is "It reads 'ACIDPROOF plexiglas'."

The creature response of the plexiglas is "'What's with the plastic in the window?' you ask.[paragraph break]'Well, uh, the [key screaming communists]Screaming Communists[endkey screaming communists] have, in course of time, noticed that there are certain... problems with [key acidic spit]spit[endkey acidic spit] in the [key castle]castle[endkey castle]. So they use glass, which does not corrode,' [the creature] explains."

Instead of attacking the plexiglas:
	say "You can't even scratch it. It looks very sturdy."
	
Instead of looking through the plexiglas:
	try looking through the window.
	
Instead of opening the plexiglas:
	say "It's firmly attached to the frame with no opening mechanism."
	
Instead of pouring acidic spit on the plexiglas:
	say "The acid doesn't do anything to the plexiglas.[if the creature is present][line break]'Smart guys those [key screaming communists]Screaming Communists,' [the creature] comments."

[
The bars were replaced with another set of bars, which caused problems with ambiguation. Christopher suggested the glass version.

Chapter Removed bars

The iron rods are a thing. They are plural-named. The description is "The rods used to be in the window before you corroded them off. They seem to have replaced the bars in the window but left the old ones behind."

Understand "rod" as the iron rods.

Should the game choose when comparing iron rods against iron bars:
	it is a good choice.
	
Before taking the iron rods when the iron rods are part of the winch:
	now the iron rods are in the cell; [circumvents the "You can't take what's part of something" rule]
	continue the action.

Instead of turning the iron rods when the iron rods are part of the winch:
	try turning the winch.
	]



Part Trapdoor

The trapdoorposition is a kind of value. The trapdoorpositions are left side, mid-cell, and right side. [This is just a hack to overcome a bug in I7]

The trapdoor is a secret door. It is not conversable. It is middle. It is scenery, openable, and locked. The description is "It's a wooden trapdoor set in the floor[if the trapdoor is open]. Looking closely you can see a small switch on the side of it[otherwise if the sticker is a part of the trapdoor]. It looks like there's some sort of sticker on it[end if].".
The trapdoor has a trapdoorposition called the pos. The pos of the trapdoor is left side.
A secret door can be ventured or unventured. A secret door is usually unventured.

Trapdoor is down of the cell. Through it is the cell.

Understand "trap" as the trapdoor.
Understand "trap door" and "hatch" and "wood/wooden" as the trapdoor.

The creature response of the trapdoor is "[if the trapdoor is unventured]'Hee. I'll just escape through the trapdoor,' you plan.[paragraph break]'We'll see about that,' the creature replies.[otherwise]'That's a curious trapdoor,' you muse.[paragraph break]'Yeah, things tend to be like that in [key castle]here[endkey castle],' [the creature] says."

The guard response of the trapdoor is "[if the trapdoor is unventured]'Uh.. you do know that there's a trapdoor here? Maybe I'll just, you know, slip through it and escape?'[paragraph break]'HA! HA HA! I DOUBT IT,' the guard roars.[otherwise]'Hey! What's the deal with that trapdoor?' you demand to know.[paragraph break]'HA! HA HA! HA!' the guard laughs."


Instead of taking the trapdoor:
	say "It's attached to the floor.".

Instead of looking under the trapdoor:
	say "[if the trapdoor is closed]You'll see what's under it once you've opened it.[otherwise]There's the floor under it.".

Instead of searching the trapdoor:
	say "It's just a plain old trapdoor.".

Instead of opening the trapdoor when the trapdoor is locked:
	say "It is tightly locked.".
	
Before pushing the trapdoor:
	say "You push hard on random places a couple of times, but it doesn't open.";
	stop the action.

Instead of attacking the trapdoor:
	say "It resists your every attempt to break it.".

Instead of touching the trapdoor:
	say "Rough wooden texture.".

Instead of smelling the trapdoor:
	say "It smells like wood.".

Instead of listening to the trapdoor:
	say "You put your ear on the trapdoor and listen carefully but hear nothing.[if the trapdoor is open and the creature is present][one of] 'Usually when you listen through doors they are [italic type]closed[roman type].'[or][stopping][otherwise if the trapdoor is open] Since the trapdoor is open it might be surprising if you [italic type]did[roman type] hear something.".

Instead of going down when the guard is not away:
	say "Better not to try that while the guard is watching."

After going down:
	if the pos of the trapdoor is right side or the pos of the trapdoor is left side:
		say "You jump down the trapdoor and land back into the cell.";
	otherwise:
		say "You jump down the trapdoor and find yourself back in the cell. Since the trapdoor is in the middle of the room, you fall through it again. And again. And again.[paragraph break][A little help to get out of the portal]";
		now the pos of the trapdoor is left side;
		now the pos of the switch is left side.
	

After going down when the trapdoor is unventured and the player is not carrying the flux capacitor:
	if the pos of the trapdoor is not mid-cell:
		if the tongue is numb:
			say "You jump down the trapdoor to the room below, thumping down on your feet and facing a stone wall. 'Ow, eh ee ef heh hoom eh eahieh ho ehahe hah he hah ohe,' you say to yourself. [c]Nice try, monkey boy. You dropped down the hatch in the ceiling the moment you went through the trapdoor,[c] the creature grunts behind you.";
		otherwise:
			say "You jump down the trapdoor to the room below, thumping down on your feet and facing a stone wall. 'Now, let's see if this room is easier to escape than the last one,' you say to yourself. [c]I very much doubt it,[c] says the creature's voice next to you.
	
'How the [bowdler] did you get here before me?' you cry. [c]I didn't, monkey boy. You dropped down the hatch in the ceiling the moment you went through the trapdoor,[c] it grunts.";
	otherwise:
		say "You jump down the trapdoor and fall through the next trapdoor underneath it. Then another. And another. And another. The openings are endless and you keep falling through them at an increasing speed.[paragraph break]";
		say "Looking at the rooms you fall through you notice that each of them are curiously similar, each like a mirror image of the previous one. Every room seems to have a small, black creature with a large bag in them, too. '[if the tongue is not numb]How curious that [the creature] has so many colleagues in the castle,' you wonder to yourself.

[c]It's...[line break]
...all...[line break]
...me...[line break]
...you...[line break]
...dumb...[line break]
...[run paragraph on][bowdler]...[line break][otherwise]How uwiouh hah eh ah hah ho hahy hoheah ih he hahe,' you mumble to yourself.

[c]You...[line break]
...dumb...[line break]
...[run paragraph on][bowdler]...[line break]
...do...[line break]
...you...[line break]
...even...[line break]
...realize...[line break][end if]";
		say " ...you're...[line break]
...falling...[line break]
...through...[line break]
...the...[line break]
...same...[line break]
...room...[line break]
...over...[line break]
...and...[line break]
...over...[line break]
...again,'
the creatures say in perfectly synchronized harmony.";
		[now the player is in the portal;]
		pause the cutscene;
		now the pos of the trapdoor is left side;
		now the pos of the switch is left side;
		say A little help to get out of the portal;
	now the trapdoor is ventured.

To say A little help to get out of the portal:
	say "'Uh.. A little help here?' you ask after falling for some while. The surroundings are just one big blur and it's giving you a headache. [c]Oh, all right, you big baby,[c] the creature says and shuffles towards the trapdoor. It flips the switch and the trapdoor slides to one side.
	
Your fall comes to an abrupt end as you smash on the floor. 'Owee,' you cry and climb on your feet.";

After going down when the player carries a flux capacitor: [man, this is one messy rule.]
	if the trapdoor is ventured:
		if the pos of the trapdoor is not mid-cell:
			say "You jump down the trapdoor and land back into the cell.";
			if the flux capacitor is not broken:
				say "The speed dial on the flux capacitor moves a bit and returns back to zero.";
		otherwise:
			if the flux capacitor is unpowered:
				say "You jump down the trapdoor and fall for some while. The speed dial on the flux capacitor soon goes to the 88 mph mark and over it. A couple of colorful sparks fly off it as it does, but nothing else happens.[paragraph break][A little help to get out of the portal]";
			otherwise if the flux capacitor is broken:
				say "You jump down the trapdoor and keep your eyes on the flux capacitor as you fall. Nothing happens. Even the needle on the speed dial stays still.[paragraph break][A little help to get out of the portal]";
			otherwise: [here comes the escape]
				say "You jump down the trapdoor holding [the flux capacitor].";
				escape through time;
	otherwise:
		if the pos of the trapdoor is not mid-cell:
			if the tongue is numb:
				say "You jump down the trapdoor to the room below, thumping down on your feet and facing a stone wall. 'Ow, eh ee ef heh hoom eh eahieh ho ehahe hah he hah ohe,' you say to yourself. [c]Nice try, monkey boy. You dropped down the hatch in the ceiling the moment you went through the trapdoor,[c] the creature grunts behind you.";
			otherwise:
				say "You jump down the trapdoor to the room below, thumping down on your feet and facing a stone wall. 'Now, let's see if this room is easier to escape than the last one,' you say to yourself. [c]I very much doubt it,[c] says the creature's voice next to you.
	
'How the [bowdler] did you get here before me?' you cry. [c]I didn't, monkey boy. You dropped down the hatch in the ceiling the moment you went through the trapdoor,[c] it grunts.";
		otherwise:
			if the flux capacitor is unpowered:
				say "You jump down the trapdoor and fall through the next trapdoor underneath it. Then another. And another. And another. The openings are endless and you keep falling through them at an increasing speed.[paragraph break]";
				say "At one point the speed dial on [the flux capacitor] reaches the 88 mph mark and some colorful sparks fly off it. Nothing else happens.[paragraph break]";
				say "Looking at the rooms you fall through you notice that each of them are curiously similar, each like a mirror image of the previous one. Every room seems to have a small, black creature with a large bag in them, too. '[if the tongue is not numb]How curious that [the creature] has so many colleagues in the castle,' you wonder to yourself.

[c]It's...[line break]
...all...[line break]
...me...[line break]
...you...[line break]
...dumb...[line break]
...[run paragraph on][bowdler]...[line break][otherwise]How uwiouh hah eh ah hah ho hahy hoheah ih he hahe,' you mumble to yourself.
				
[c]You...[line break]
...dumb...[line break]
...[run paragraph on][bowdler]...[line break]
...do...[line break]
...you...[line break]
...even...[line break]
...realize...[line break][end if]";
				say " ...you're...[line break]
...falling...[line break]
...through...[line break]
...the...[line break]
...same...[line break]
...room...[line break]
...over...[line break]
...and...[line break]
...over...[line break]
...again,'
the creatures say in perfectly synchronized harmony.";
				pause the cutscene;
				say A little help to get out of the portal;
				now the pos of the trapdoor is left side;
				now the pos of the switch is left side;
			otherwise:
				say "You jump down the trapdoor and fall through the next trapdoor underneath it. Then another. And another. And another. The openings are endless and you keep falling through them at an increasing speed.[paragraph break]";
				say "Looking at the rooms you fall through you notice that each of them are curiously similar, each like a mirror image of the previous one. Every room seems to have a small, black creature with a large bag in them, too. '[if the tongue is not numb]How curious that [the creature] has so many colleagues in the castle,' you wonder to yourself.

[c]It's...[line break]
...all...[line break]
...me...[line break]
...you...[line break]
...dumb...[line break]
...[run paragraph on][bowdler]...[line break][otherwise]How uwiouh hah eh ah hah ho hahy hoheah ih he hahe,' you mumble to yourself.
				
[c]You...[line break]
...dumb...[line break]
...[run paragraph on][bowdler]...[line break]
...do...[line break]
...you...[line break]
...even...[line break]
...realize...[line break][end if]";
				say " ...you're...[line break]
...falling...[line break]
...through...[line break]
...the...[line break]
...same...[line break]
...room...[line break]
...over...[line break]
...and...[line break]
...over...[line break]
...again,'
the creatures say in perfectly synchronized harmony.[paragraph break]";
				escape through time;
			now the trapdoor is ventured.


Chapter Throwing stuff down

Before inserting something into the trapdoor:
	if the noun is not enclosed by the player:
		say "(first taking [the noun])[command clarification break]";
		silently try taking the noun;
		if the noun is not enclosed by the player:
			stop the action;
	if the trapdoor is closed:
		say "The trapdoor is closed." instead;
	if the noun is the drinking glass or the noun is the light bulb or the noun is the whiskey bottle or the noun is the potion vial:
		say "[The noun] would just break." instead;
	if the noun is insubstantial:
		say "[The noun] flutter[s] down the trapdoor and land[s] back in front of you.";	
		now the noun is in the cell;
	otherwise:
		if the pos of the trapdoor is mid-cell:
			say "[The noun] fall[s] down the trapdoor, then enter[s] it again, and again, and again. [Cap it-they] gain[s] quite a momentum before you get bored and grab [it-them] back.";
			move the noun to the player;
		otherwise:
			say "[The noun] fall[s] down the trapdoor and land[s] back in front of you.";		
			now the noun is in the cell;
	if the trapdoor is not ventured:
		say "[line break]'[if the tongue is numb]Hah heuiah[otherwise]That's peculiar[end if],' you ponder.";
	stop the action.
	
Down-throwing is an action applying to one carried thing.

Understand "throw [something] down" as down-throwing.

Check down-throwing:
	if the trapdoor is closed:
		try dropping the noun instead;
	otherwise:
		try inserting the noun into the trapdoor instead.


Chapter Sticker

The sticker is a thing. It is insubstantial, useful and middle. It can be fast glued or slightly glued. It is fast glued. The description is "The sticker has a small red circle and the words 'Push to open' printed on it." The printing is "'Push to open.'". 

After examining something when the sticker is part of the noun and the noun is not the trapdoor:
	say "The sticker is attached to [it-them of the noun]."

Understand "red" and "circle" and "word/words/text" and "label" as the sticker.

Check pushing the sticker:
	if the sticker is part of the player or the sticker is part of the creature:
		continue the action;
	otherwise if the sticker is not part of the celldoor and ( trapdoor is open or the sticker is not part of the trapdoor ) and ( the encyclopedia is open or the sticker is not part of the encyclopedia ):
		say "Nothing happens." instead.
	
Report pushing the sticker when the sticker is part of the player:
	say "Your mouth drops wide open.[if the creature is present][line break][c]Tee hee,' [the creature] snickers." instead.
	
Report pushing the sticker when the sticker is part of the creature:
	say "The creature's mouth swings wide open.
	
'Hee,' you giggle.[if the creature is present][line break][one of][c]Very funny,' [the creature] grunts.[or][c]Stop that!' the creature says.[or][c]This is getting tiresome,' [the creature] says.[stopping]" instead;
	
Carry out pushing the sticker when the sticker is part of the trapdoor:
	now the trapdoor is open;
	now the switch is a part of the trapdoor.

Report pushing the sticker when the sticker is part of the trapdoor:
	say "There's a click and the trapdoor drops open. Underneath you see another room very similar to this one.
	
'[if the tongue is numb]Ey ey[otherwise]Hey hey[end if]!' you rejoice[if the creature is present]. [c]Oh joy,' [the creature] cheers laconically[end if]." instead.


Carry out pushing the sticker when the sticker is part of the encyclopedia:
	say "[The encyclopedia]'s cover swings open.";
	try opening the encyclopedia.
	
Report pushing the sticker when the sticker is part of the encyclopedia:
	do nothing instead.


Instead of pushing the sticker when the sticker is part of the celldoor:
	mark the escape down as "opening the cell door with the sticker";
	say "There's a click and the cell door swings violently open. You don't stop to wonder how and why it worked when you take off.[paragraph break]";
	say "'HEY!' the guard yells behind you. You keep running through the corridors and manage to lose him from your tail.";
	pause the cutscene;
	say "The castle's twisty corridors are like a maze and very soon you are completely lost. After wandering for some time longer you come across a trapdoor in the floor. 'Can't hurt to try this one too,' you think to yourself.";
	pause the cutscene;
	if the trapdoor is open:
		say "You drop down the trapdoor and find yourself staring at [the creature]'s oblong face. You're back in the cell.[paragraph break]";
		say "'[if the tongue is numb]Whah eh... how eh[otherwise]What the... how the[end if]...' you stutter.[paragraph break]";
		say "[c]Tee hee,' [the creature] giggles.";
	otherwise:
		say "You drop down the trapdoor and find yourself staring at the guard's ugly face.[paragraph break]'Well HELLO,' he shouts, grabs you by the neck and throws you back in the cell.[silent c]";
	remove the sticker from play.
	

Instead of taking the fast glued sticker:
	say "It's glued fast. It doesn't come off with bare hands."
	
Instead of taking the slightly glued sticker when the sticker is part of something:
	say "You peel the sticker off.";
	now the player carries the sticker.
	

Instead of pouring the glue remover on the sticker:
	say "The glue remover is effective immediately and the sticker comes off easily.";
	remove the glue remover from play;
	now the sticker is slightly glued;
	now the player carries sticker.



Instead of tying the slightly glued sticker to something (called the target):
	if the sticker is part of something (called the surface):
		say "(first taking the sticker from [the surface])[command clarification break]";
	say "You slap the sticker on [the target].";
	if the target is the creature and the creature is present:
		say "[line break][c]Hey,' [the creature] protests.";
	now the sticker is part of the target.
	
Instead of putting the sticker on something:
	try tying the sticker to the second noun.
	
Instead of inserting the sticker into something:
	try tying the sticker to the second noun.


Test sticker with "test c/remove clothes/trade clothes/wear clothes/look under rug/pour glue remover on sticker".



Chapter Trapdoor switch

The switch is a thing. The switch has a trapdoorposition called the pos. The pos of the switch is left side. The switch can be operated. It is not operated.

The description of the switch is "The small switch on the trapdoor has been [if the pos of the switch is left side]pushed to one side[otherwise if the pos of the switch is mid-cell]set to the middle[otherwise]pulled to one side[end if]."

After opening the trapdoor:
	now the switch is a part of the trapdoor;
	continue the action.

Check pushing the switch:
	if the pos of the switch is left side:
		say "It won't go any further." instead.

Check pulling the switch:
	if the pos of the switch is right side:
		say "It won't go any further." instead.
		

Instead of switching on or switching off the switch:
	if the pos of the switch is left side:
		try pulling the switch;
	otherwise if the pos of the switch is right side or a random chance of 1 in 2 succeeds:
		try pushing the switch;
	otherwise:
		try pulling the switch.

Carry out pushing the switch:
	if the pos of the switch is mid-cell:
		now the pos of the switch is left side;
		now pos of the trapdoor is left side;
		say "The trapdoor slides to the left side of the room.";
	otherwise if the pos of the switch is right side:
		now the pos of the switch is mid-cell;
		now the pos of the trapdoor is mid-cell;
		say "The trapdoor slides to the middle of the room.";
	stop the action.
	
Carry out pulling the switch:
	if the pos of the switch is left side:
		now the pos of the switch is mid-cell;
		now the pos of the trapdoor is mid-cell;
		say "[one of]You flip the switch and the trapdoor slides effortlessly to the middle of the room. Where it used to be only solid stone floor remains.[paragraph break]'[if the tongue is numb]How huiouh[otherwise]How curious[end if],' you muse[if the creature is present]. [The creature] raises the spot above its eye where people usually have eyebrows[silent c][end if].[or]The trapdoor slides to the middle of the room.[stopping]";	
	otherwise if the pos of the switch is mid-cell:
		now the pos of the switch is right side;
		now the pos of the trapdoor is right side;
		say "The trapdoor slides to the right side of the room.";
	stop the action.


Report pulling the switch:
	do nothing instead.
	
Report pushing the switch:
	do nothing instead.
	

Part Air duct

The air duct is a closed, openable container in the cell. It is scenery and by the window. The description is "The aluminum air duct runs from one wall to another. It's quite large but not set very high, just few centimeters above your head. There's a small [if the air duct is open]opened [end if]grate in the bottom of it."

Understand "silvery/silver" and "vent/vents" and "hatch" and "grate" and "aluminum" as the air duct.

The creature response of the air duct is "'Where does that vent lead?'[paragraph break][c]Oh, it runs through the entire [key castle]castle[endkey castle],[c] [the creature] tells you. [c]And it reaches the outside in several places, of course.[c]"

Instead of discussing with someone about air duct when cousin Herbert is discussable:
	try discussing with the noun about cousin herbert.

The guard response of the air duct is "'How do you know I won't just escape through the air duct?' you ask.[paragraph break]'HA HA! I recommend TO NOT try!'".

Instead of eating the air duct:
	say "Your teeth aren't strong enough to bite through it.".

Instead of looking under the air duct:
	say "The floor is under it.".

Instead of searching the air duct:
	say "[if the player carries the light bulb]Searching the duct very carefully, even with the light from the light bulb, yields no results.[otherwise]There's nothing inside.[end if]".

Instead of unlocking the air duct with:
	say "It's not locked.".

After opening the air duct:
	say "You open the grate on the air duct." instead.

After closing the air duct:
	say "You close the grate on the air duct." instead.

Instead of attacking the air duct:
	say "There's a small bang when you hit it.".

Instead of touching the air duct:
	say "The aluminum feels cold and smooth.".

Instead of pushing, pulling or turning the air duct:
	say "It's fixed in place fast. You can't make it budge.".

Instead of listening to the air duct:
	say "It doesn't even hum. Maybe it's not on?".

Instead of tasting the air duct:
	say "It tastes like aluminum.".

Instead of cutting the air duct:
	say "You don't have the tools.".

Instead of climbing the air duct:
	say "It's too high to climb on it, and there's not enough space for you between the duct and the ceiling.".

Instead of pouring oil on the air duct:
	say "You put some oil into the duct, but it's clearly not enough to make the whole thing slippery enough."


Chapter Escaping through the duct

Instead of entering the air duct:
	if the air duct is closed:
		say "(first opening the grate)[command clarification break]";
		silently try opening the air duct;
	if the player is clothed:
		say "You try to squeeze through the opening, but it's just a bit too small for you to fit through.";
	otherwise:
		if the player is not slippery:
			say "Even without clothes the opening is just slightly too small to fit through.";
		otherwise:
			repeat with X running through things carried by the player:
				now x is in the cell;
			say "The motor oil covers your body like sweat on a hot summer night. You slither inside the air duct and pull yourself deeper and deeper inside. Darkness and cold aluminum encloses you from all sides as you twist and turn through the tunnels. Finally there's some light looming from ahead and you slide faster toward it.";
			pause the cutscene;
			say "Just before you reach the end of the duct a dark shape blocks the light and you're back in near darkness. You force yourself to a halt and stare the figure in the eyes.
	
'[if the tongue is numb]Ey, ih eh.ah.! Hah ah uh oih heah[otherwise]Hey, it's [the creature]! What are you doing here[end if]?' you ask but the creature doesn't reply. It opens its mouth, and the second, and the third. And it hisses.";
			pause the cutscene;
			say "You back away in record speed and drop down the grate back to the cell.
			
[c]I see you met my [key cousin Herbert]cousin Herbert[endkey cousin Herbert],' [the creature] assumes. [c]Now please put some clothes on!'";
			mark the escape down as "sliding inside the air duct";
			now the player is not slippery;
			now cousin Herbert is conversable.

Test duct with "test oil/remove clothes/pour oil on yourself/open duct/enter duct".




Part View through the window

Chapter Moon

The moon is a thing in cell. It is scenery and self-lit. It is distant. The printed name is "moon". The indefinite article is "the". The description is "The moon is full and the sky is clear.[if the cell is dark] Moonlight gives faint illumination to the cell.".

Understand "full" as the moon.
Understand "moonlight" as the moon.
Understand "light" as the moon.
Understand "illumination" as the moon.
Understand "beam" as the moon.
Understand "sky" and "night" as the moon when the clouds are not in the cell.

Before entering the moon:
	say "You would need a rocket." instead.

Before looking under the moon:
	say "Under it is the scenery." instead.
	
Before eating the moon:
	say "Even though it is made of cheese, it's out of reach right now." instead.
	

Chapter Clouds

The clouds are scenery. They are distant and plural-named. The description is "Dark clouds dominate the sky."

Understand "cloud" as the clouds.
Understand "sky" and "night" as the clouds when the clouds are in the cell.




Book 4 - Falling through the trapdoor

[Originally the player would've been falling through the portal and would've had to ask H.R. to flip the switch for him. It was dropped mid-development because it was in a bit of a gray area regarding the rules of the one-room competition. It would've also underlined the Portal (the FPS game) joke even more by having a brief cameo of the Portal protagonist. In retrospect the game is probably better without the scene.]

[
The portal is a room.

Instead of exiting while in the portal:
	say "In this speed it seems nearly impossible."
	
Test portal with "test c/push rug/push red/pull lever/d".
	


Part Reaching the Cell

A procedural rule: 
	substitute the can't reach things while falling rule for the can't reach inside rooms rule.
	
Definition: a thing is out of reach during in-flight if it is enclosed by the cell and it is not enclosed by the player and it is not the player.

This is the can't reach things while falling rule:
	if the container in question is a room and the container in question is not the location:
		say "It's too far to reach."; 
		rule fails.

After deciding the scope of the player:
	if the player is in the portal:
		place the cell in scope;
		
		
Instead of examining when the player is in the portal and location of the noun is the cell:
	say "[one of]It flashes by your eyes leaving only blurred lines behind.[or]There's no way of examining it more closely in this speed.[purely at random]".



Part Quips

Every turn when the player is in the portal:
	If a random chance of 1 in 6 succeeds, say "[one of]The floor/ceiling goes fump. fump. fump. as you go past it.[or][c]How's...[line break]...it...[line break]...going...[line break]...in...[line break]...there?'[or]The trapdoor and the switch on it flash by at breakneck speed.[at random]";
	say "[silent c][run paragraph on]".	[so that the creature doesn't go saying anything else while we're in the portal]


Part Trapdoor


]



Book 5 - Items


Part Dinner plate

The dinner plate is a useful supporter. It is not scenery. It is not conversable. It is not fixed in place. [The plate started to suddenly act as if it were scenery. Which is very strange.]

The description is "[if the dinner plate is part of the catapult-arm]You've attached the plate into [the trebuchet]'s arm.[paragraph break][end if][if something is on the dinner plate]There's [a list of things on the dinner plate] on the plate.[otherwise]The dinner plate is empty.[end if]".

Should the game choose when comparing the dinner plate against the metalplate:
	it is a good choice.


Part Drinking glass

[There seems to be some problem with the name of this object - namely, calling it "drinking glass" in the code sometimes produces errors where just "glass" works fine. I suspect this is because "drinking" is already the name of an action which messes I7 up.

This was an issue during the initial development; I'm not sure if it's been fixed in later I7 releases.]

The drinking glass is a container. It is in the encyclopedia. The carrying capacity of the drinking glass is 1. The drinking glass is fragile.

Before drinking the drinking glass:
	if something is in the drinking glass:
		let the contents be a random thing in the drinking glass;
		say "([the contents])[command clarification break]";
		try drinking the contents;
	otherwise:
		say "There's nothing in the glass to drink.";
	stop the action.
	

Part Electrical wire

The electrical wire is in the cell. It is scenery and middle. It can be fixed to the ceiling, pulled out or boobytrapping the door. It is fixed to the ceiling. The description is "[if the electrical wire is fixed to the ceiling]The wire hangs from the ceiling from a fragile looking attachment and leads to the cross section of the ceiling and two walls.[otherwise if the electrical wire is pulled out]The wire curls up in one corner and runs up to the cross section of the ceiling and two walls.[otherwise] The wire runs from the ceiling to the keyhole on the cell door."

Understand "socket" as the electrical wire when the cell is dark.

Instead of taking the electrical wire:
	try pulling the electrical wire.

Instead of looking under the electrical wire:
	say "There's the floor under it.".

Instead of searching the electrical wire:
	say "There's nothing more to it.".

Instead of switching on the electrical wire:
	say "There's no power switch in the cell.".

Instead of switching off the electrical wire:
	say "There's no power switch in the cell.".

Instead of touching the electrical wire:
	say "*kZAP*

The room soon stops spinning and you can see again. You smell something burning.[if the creature is present][one of][paragraph break][question intelligence][or][stopping]".

Instead of touching the creature with the electrical wire:
	say "*kZAP*
	
[The creature] spasms and blinks white light for a while. Trails of smoke rise from its body.[if the creature is present][line break][c][one of]Hey now! Watch it with that thing,[or]Ouch![or]Man that's harsh,[or]Careful with that![at random]' it says."

Instead of touching the guard with the electrical wire:
	say "'Stop WAVING THAT THING in front of me!' the guard screams."

Instead of pushing the electrical wire when the electrical wire is fixed to the ceiling:
	if the light bulb is a part of the electrical wire:
		try pushing the light bulb;
	otherwise:
		say "You give it a small push and the wire swings back and forth a few times.".
		
Instead of swinging the electrical wire:
	try pushing the electrical wire.

Instead of pulling the electrical wire when the light bulb is a part of the electrical wire:
	try pulling the light bulb.

Instead of climbing the electrical wire when the electrical wire is pulled out:
	say "It's too thin to climb. And there wouldn't be anything there to climb to anyway.".
	
Instead of climbing the electrical wire when the electrical wire is fixed to the ceiling:
	if the light bulb is a part of the electrical wire:
		if the light bulb is lit:
			say "You try to climb the wire, first holding on to the bulb's socket and pulling yourself upward. The wire can't take your weight and it snaps, leaving you with the light bulb and its socket.
			
Miraculously enough the bulb is still lit even when it's not connected to anything[if the creature is present]. [c]Hmm,' H.R. muses[end if].";
			now the player carries the light bulb;
		otherwise:
			say "You try to climb the wire, first holding on to the bulb's socket and pulling yourself upward. The bulb comes off almost as soon as you touch it. Apparently it wasn't screwed in all the way.";
			now the player carries the light bulb;
	otherwise:
		try pulling the electrical wire.


Instead of tasting or eating the electrical wire:
	say "Wondering if the wire [one of][or]still [stopping]has any power, you touch it with your tongue.
	
*kZAP*

'Ih HOEH hae oheh!' you discover[if the creature is present]. [question intelligence] [the creature] wonders[end if].";
	now the tongue is numb.
	

Instead of pulling the electrical wire when the light bulb is not part of the electrical wire:
	if the electrical wire is fixed to the ceiling:
		say "The hook that was holding the wire up in the ceiling breaks and the wire comes off. It now runs straight down from the ceiling corner and curls up in the floor.";
		now the electrical wire is pulled out;
		now the electrical wire is by the door;
		remove the wire-attacher from play;
	otherwise if the electrical wire is boobytrapping the door:
		say "You pull the wire out from the keyhole.";
		now the electrical wire is pulled out;
		now the electrical wire is by the door;
	otherwise:
		say "It won't come out any further.";
		

Before inserting the electrical wire into the keyhole when the celldoor is insulated:
	if the creature is present:
		say "[c]That's no use anymore,[c] [the creature] says. [c]They coated the keyhole with rubber while you were away.[c]";
	otherwise:
		say "There seems to be a thin layer of rubber inside the lock. The same trick won't work anymore."; 
	stop the action;

Instead of inserting the electrical wire into the celldoor:
	try inserting the electrical wire into the keyhole instead.
	
Instead of tying the electrical wire to the celldoor:
	try inserting the electrical wire into the keyhole instead.
	
Instead of tying the electrical wire to the keyhole:
	try inserting the electrical wire into the keyhole instead.

[
The take object before inserting it into rule is not listed in any rulebook.
The can't insert what's not held rule is not listed in any rulebook.
]

Before inserting the electrical wire into the keyhole when the light bulb is not part of the electrical wire and the cell is not dark:
	if the celldoor is insulated:
		try tying the electrical wire to the keyhole;
	otherwise if the electrical wire is boobytrapping the door:
		say "You make sure the wire is securely inside the keyhole.";
	otherwise:
		say "You tuck the live end of the wire into the keyhole.[if the creature is present][one of][line break][c]Aww, that's just nasty,' [the creature] says.[or][stopping]";
		now the electrical wire is boobytrapping the door;
	stop the action.
		

To zap the guard:
	mark the escape down as "boobytrapping the door";
	now the celldoor is insulated;
	now the electrical wire is pulled out.
	
Test wire with "get lamp/pull wire/attach wire to door".


Part Encyclopedia

The encyclopedia is a closed, openable container. It is useful. The carrying capacity is 2. The printed name is "dusty old book". It can be book-form or container-form. It is book-form. The description is "It says [italic type]'ENCYCLOPÆDIA ESCAPÆDIA: The Definite Guide to Getting Out of All Kinds of Trouble'[roman type] in large block letters on the cover.".

Understand "book" and "cover/covers" and "dusty" and "old" and "encyclopaedia/encyclopædia" and "guide" and "escapadia/escapaedia/escapædia" and "box" as the encyclopedia.

The printing of the encyclopedia is "There's only one readable passage.

[printing of the article]";

After examining the book-form encyclopedia:
	change the printed name of the encyclopedia to "encyclopedia".

Instead of reading the book-form encyclopedia:
	if the printed name of the encyclopedia is not "encyclopedia":
		try examining the encyclopedia;
	try opening the encyclopedia.

After opening the book-form encyclopedia:
	if the printed name of the encyclopedia is not "encyclopedia":
		try examining the encyclopedia;
	say "Instead of finding pages full of useful information you find that all the pages apart from one have been glued together and the book has been carved hollow to create a secret compartment inside. In the compartment there's a drinking glass and a small bottle of brown liquid.";
	now the encyclopedia is container-form;
	now the encyclopedia is not useful;
	now the description of the encyclopedia is "It's an ENCYCLOPÆDIA ESCAPÆDIA shaped box with barely any of the articles left to read.[if something is in the encyclopedia and the encyclopedia is open] There's [a list of things in the encyclopedia] inside.[otherwise if the encyclopedia is closed] It's closed.[end if]";
	stop the action.
	
Before reading the container-form encyclopedia when the encyclopedia is closed:
	say "(first opening [the encyclopedia])[command clarification break]";
	silently try opening the encyclopedia;
	continue the action.

Test encyclopedia with "test screws/trade skindude".


Chapter Article

The article is part of the encyclopedia. It is insubstantial. The description is "[the printing of the article]".
The printing is "[fixed letter spacing][bold type]FLASHLIGHT[roman type]

A [bold type]flashlight[roman type] is an essential tool in any dark or low-light environment. It is a device that consists of a lamp inside a parable-shaped casing surrounded by a reflective surface to focus the light to a single direction.

Flashlights can been used as communication devices, typically by flashing the light in pre-agreed sequences. There are documented cases[italic type][bracket]citation needed[close bracket][roman type] of using a flashlight or a searchlight as a signalling device by attaching a template in front of the light source to create shapes in the surface the light is pointed at.[variable letter spacing]".

Understand "page/pages/articles/passage/passages" and "about flashlight/flashlights" as the article.

Before doing something with the article when the article is part of the encyclopedia and the encyclopedia is closed:
	say "(first opening [the encyclopedia])[command clarification break]";
	silently try opening the encyclopedia;
	continue the action.
	
Instead of closing the encyclopedia when the light bulb is in the encyclopedia:
	say "The room becomes very dark when the book's cover blocks the light from the bulb. You open the encyclopedia quickly again."


Part Flashlight / Searchlight
[i.e. the glass with tin foil and light bulb inside]

[There's been some changes for Release 3: when you wrap the foil inside the light bulb you can't remove it anymore. This helps with the too enthusiastic implicit actions that made handling the searchlight building a bit too complicated if the player didn't notice that parts had been implicitly removed from the glass.]

["To decide whether the glass is a flashlight" doesn't seem to work - a bug in I7?]
To decide whether the glass is flashlight:
	if the tin foil is in the glass and the light bulb is in the tin foil:
		decide yes;
	if the glass is in the tin foil and the light bulb is in the glass:
		decide yes;
	decide no.
	
To decide whether the glass is not flashlight:
	if the glass is flashlight:
		decide no;
	decide yes.
	
To decide whether the glass is searchlight:
	if the photograph is intact:
		decide no;
	if the glass is flashlight and the photograph is enclosed by the drinking glass:
		decide yes;
	decide no.
	
To decide whether the glass is not searchlight:
	if the glass is searchlight:
		decide no;
	decide yes.
	

[the following rules take care that the glass or tin foil is listed as "flashlight/searchlight" and that it doesn't list the contents.]
Rule for printing the name of the tin foil when the glass is flashlight and the glass is not searchlight:
	say "makeshift flashlight";
	omit contents in listing.

Understand "flashlight/torch" and "makeshift" as the glass when the glass is flashlight.

Should the game choose when comparing the glass against the tin foil:
	it is a good choice.

Rule for printing the name of the tin foil when the glass is searchlight:
	say "makeshift searchlight";
	omit contents in listing.
		
Understand "searchlight" and "makeshift" as the glass when the glass is searchlight.



After inserting the light bulb into the drinking glass:
	if the glass is in the tin foil:
		say "You put the light bulb inside the glass and the tin foil concentrates and reflects the light into a bright beam." instead;
	otherwise:
		say "The lamp fits nicely inside the drinking glass. The glass bends and reflects the light, creating beautiful patterns of light and shadow on the cell walls. The top of the glass throws a weak beam of light on the ceiling." instead.
		
After inserting the light bulb into the tin foil:
	if the tin foil is in the glass:
		say "You put the light bulb inside the glass and the tin foil concentrates and reflects the light into a bright beam." instead;
	otherwise:
		say "You put the light bulb inside the tin foil. The foil reflects the light into curious patterns but the foil is too floppy and shapeless to form anything useful." instead.

Instead of inserting the tin foil into the drinking glass:
	if the glass is in the tin foil:
		say "The tin foil will do its job just as well wrapped around the glass." instead;
	if something is in the tin foil:
		say "(first removing [the list of things in the tin foil] from [the tin foil])[command clarification break]";
		repeat with X running through things in the tin foil:
			silently try taking X;
	say "You start straightening the tin foil inside the glass but soon come to the conclusion that wrapping the foil around the glass would be a better idea.";
	try inserting the drinking glass into the tin foil.
		
[After inserting the tin foil into the drinking glass:
	if the light bulb is in the tin foil:
		say "You put the tin foil with the light bulb inside into the glass and straighten the foil against the glass walls. The foil concentrates the light into a bright beam.";
	otherwise:
		say "You put the tin foil into the glass and straighten it against the glass walls.";
	stop the action.]
		
After inserting the drinking glass into the tin foil:
	if the light bulb is in the drinking glass:
		say "You put the drinking glass with the light bulb inside into the tin foil and straighten it against the glass walls. The foil concentrates the light into a bright beam.";
	otherwise:
		say "You put the glass inside the tin foil and straighten it against the glass walls.";
	stop the action.
	
Before taking the drinking glass when the drinking glass is in the tin foil:
	if the player is not carrying the tin foil:
		say "(the drinking glass wrapped in tin foil)[command clarification break]";
		try taking the tin foil instead;
	otherwise:
		say "The tin foil is wrapped so nicely around the glass. It's better to leave it be, otherwise you risk tearing the foil." instead.

Before dropping the drinking glass when the drinking glass is in the tin foil:
	try dropping the tin foil instead.
	
Instead of inserting the photograph into the glass when the glass is flashlight:
	make a searchlight.
		
Instead of inserting the photograph into the tin foil when the glass is flashlight:
	make a searchlight.
	
Instead of putting the photograph on the tin foil when the glass is flashlight:
	make a searchlight.
	
Instead of putting the photograph on the glass when the glass is flashlight:
	make a searchlight.
	
Instead of putting the photograph on the light bulb when the glass is flashlight:
	make a searchlight.


Instead of inserting the light bulb into the glass when the the glass is in the tin foil and the photograph is in the glass:
	make a searchlight.
		
Instead of inserting the light bulb into the tin foil when the glass is in the tin foil and the photograph is in the glass:
	make a searchlight.
	
Instead of putting the light bulb on the tin foil when the glass is in the tin foil and the photograph is in the glass:
	make a searchlight.
	
Instead of putting the light bulb on the glass when the glass is in the tin foil and the photograph is in the glass:
	make a searchlight.
	
Instead of putting the light bulb on the photograph when the glass is in the tin foil and the photograph is in the glass:
	make a searchlight.
	

To make a searchlight:
	if the photograph is intact:
		say "You adjust the light bulb in the glass and put the photograph on top of it. It blocks the light from the light bulb completely, so you take it off again.";
	otherwise:
		say "You adjust the light bulb in the glass and put Captain McBrawn's silhouette on top of it.[paragraph break]";
		if the glass is on the window:
			do the final escape;
		otherwise:
			say "The beam of light emitting from the drinking glass casts a shadow on the wall shaped like the Captain.[if the creature is present][one of][line break][c]Nananananananana CAP-TAAIN!' [the creature] sings.[or][stopping]";
			now the photograph is in the drinking glass;
			now the light bulb is in the drinking glass. [this overrides the carrying capacity]




Instead of captain-calling when the glass is searchlight:
	do the final escape.			
[captain-calling is defined in the last part of this book.]
	
Instead of captain-calling when the glass is flashlight:
	say "You point the makeshift flashlight at the dark clouds in the sky. A round patch of light appears on it - the light is stronger than you imagined it would be. It looks the same as any other Screaming Communists['] searchlights and nothing particular happens so you stop playing with it after a while."
	
Instead of pointing the tin foil at the window when the glass is flashlight:
	try pointing the glass at the window.
	
Instead of pointing the tin foil at the clouds when the glass is flashlight:
	try pointing the glass at the window.
	

Instead of pointing the glass at the guard when the glass is flashlight or the glass is searchlight:
	try giving the glass to the guard.
	
Before giving the glass to the guard when the glass is flashlight or the glass is searchlight:
	say "Better not let him know you have it. He might confiscate it." instead.

Before pointing the light bulb at something when the light bulb is in the glass:
	try pointing the glass at the second noun instead.




Part Flux Capacitor

The flux capacitor is a device. It is not conversable. It is bulky and useful. It can be thingamabob. It is thingamabob. It can be unpowered, powered or broken. It is unpowered. The description is "The [flux capacitor] has a window on one side where you can see some tubes in Y shape inside. Red labels are pasted all over the device, the one on top saying 'FLUX CAPACITOR'. The two dials are labeled 'POWER' and 'SPEED' and there's a pin with a picture of a lightning bolt next to it. It is very heavy.". The printed name is "cube-like thingamabob". 

The creature response of the flux capacitor is "[if the flux capacitor is broken]'Uh.. What just happened?'[paragraph break]'Dunno. You ran a few laps down the trapdoor, vanished and left a trace of fire behind you. A couple of seconds later you appeared here with smoke rising from your ears.'[otherwise]'What the [bowdler] is this?'[paragraph break]'It's a... well, you find out yourself,' [the creature] replies."

After examining the flux capacitor when the flux capacitor is powered:
	say "The tubes inside are blinking bright white light and the device hums silently.";
	continue the action.
	
Report listening to the powered flux capacitor:
	say "It hums silently."

The printing of the flux capacitor is "The label on the top says 'FLUX CAPACITOR', the two dials on it are labeled 'POWER' and 'SPEED'. The label on the window says 'SHIELD EYES FROM LIGHT'."

Understand "thing" and "cube/cube-like/cubelike" and "cube like" and "thingamabob/thingamajig" and "large" as the flux capacitor.
Understand "device" and "tape/tapes" and "label/labels" and "tube/tubes" and "y" and "shape/shapes/y-shape/yshape" and "window" and "glass" as the flux capacitor.

After examining or reading the thingamabob flux capacitor:
	now the printed name of the flux capacitor is "flux capacitor";
	now the flux capacitor is not thingamabob.
	
	
Instead of switching on the flux capacitor:
	say "[if the flux capacitor is broken]The lightning strike turned it into a charred piece of scrap metal. It will never flux again[otherwise]There doesn't seem to be any obvious way to turn the thing on. It doesn't have any switches or buttons[end if][if the flux capacitor is unpowered]. Besides the power dial points currently at zero[otherwise if the flux capacitor is powered], but it does hum and blink its lights very cheerfully[end if]."
	
Should the game choose when comparing the window against the flux capacitor: 
	it is a good choice.

Should the game choose when comparing the glue remover against the flux capacitor: 
	it is a good choice.
	
Should the game choose when comparing the glass against the flux capacitor:
	it is a good choice.
	

Test flux with "test c/trade rug/get lamp".


Instead of touching the flux capacitor with the electrical wire:
	try touching the charging pin with the electrical wire.
	
Instead of tying the electrical wire to the flux capacitor:
	try touching the charging pin with the electrical wire.


Chapter Escaping through time

To escape through time:
	say "The speed dial's needle on [the flux capacitor] approaches the 88 mph mark quickly as you fall faster and faster. Colorful sparks fly to the air from the device and when it reaches the mark, there's a blinding bright flash of white light.
	
You crash on the floor. Or, rather, ground - the stone floor is gone. Along with the rest of the castle.

This is definitely the same place. You recognize the surroundings as the same, but there's nothing but some construction materials lying around.

Dark clouds are gathering above.";
	pause the cutscene;
	say "*kZAP*";
	pause the cutscene;
	say "A lightning bolt strikes [the flux capacitor] and there's another bright flash. Stupefied you stand in the cell again, smoke rising from your ears.
	
[c]Mmm. Smoked monkey,' [the creature] says and licks the part of its face where lips usually are.";
	now the flux capacitor is broken;
	now the flux capacitor is not useful;
	mark the escape down as "travelling through time".




	
Chapter Charging pin

The charging pin is a part of the flux capacitor. It is scenery. The description is "There's a small metal pin on top of [the flux capacitor] with a picture of a lightning bolt next to it."

Understand "small" and "metal" and "top" and "lightning" and "bolt" as the charging pin.

Instead of touching the charging pin with the electrical wire when the light bulb is not part of the electrical wire:
	if the flux capacitor is unpowered:
		say "Sparks fly to the air when you touch the socket on [the flux capacitor] with the exposed wire. There's a loud click from inside the machinery and the tubes behind the front window light up and start blinking like christmas lights.
		
The needle on the power dial turns to point at 1.21 gigawatts.";
		now the flux capacitor is powered;
	otherwise if the flux capacitor is powered:
		say "Touching the socket with the exposed wire causes the tubes to brighten for a moment and the needle of the power dial to go to the far end, but it returns right back to the 1.21 gigawatts mark.";
	otherwise:
		say "There's no effect at all. It's just scrap metal now."
		
Instead of tying the electrical wire to the charging pin:
	try touching the charging pin with the electrical wire.
		


Chapter Dials

A dial is a kind of thing. Understand "dial" and "display" and "info/information" as a dial.
A dial is always scenery.

Instead of turning or pushing a dial:
	say "It's the kind of dial that displays information, not the kind that you operate."



Section Power dial

The power dial is a dial. It is part of the flux capacitor. The description is "The power dial goes from zero to 1.21 gigawatts. It's currently pointing at [if the flux capacitor is powered]the maximum.[otherwise]zero."

Understand "zero" and "gigawatt/gigawatts/jigawatt/jigawatts" as the power dial.

Should the game choose when comparing the power dial against the speed dial and ( turning or pushing ):
	it is a good choice. [just so that it skips the disambiguation question.]


Section Speed dial

The speed dial is a dial. It is part of the flux capacitor. The description is "The speed dial points at zero. Curiously there's a large red line at about 88 miles per hour mark." 

Understand "red" and "mark" and "88" and "mph" and "miles" and "per" and "hour" and "large" and "line" and "zero" as the speed dial.



Part Fried fish

fried fish is a thing. It is in the tin foil. It is not conversable. It is proper-named. The plural of fried fish is fried fish. It is not conversable. The description is "They have fried the fish whole but it still looks quite raw. It is reddish in color; it might be a red herring.[if the creature is present][line break][c]I'm quite sure it is not,' [the creature] doubts.".

Understand "dinner/food" as fried fish.
Understand "herring" as fried fish.
Understand "red/reddish" as fried fish.
Understand "slimy/slime" as fried fish.
Understand "that fish" as fried fish.

The creature response of the fried fish is "[if the fried fish is enclosed by the cell]'[Creature], do you like fish?' you ask.[paragraph break]'Oh yeah,' the creature responds and a gush of saliva falls from its mouth.[otherwise]'How was the fish?' you ask.[paragraph break]'Super,' [the creature] says and burps."


Check taking fried fish:
	if the player is carrying the tin foil:
		say "You don't want to touch it with bare hands.";
	otherwise:
		try taking the foil;
	stop the action.
		
Instead of eating fried fish:
	say "You can't bring yourself to eating it.[if the creature is present][line break][c]What, you can't eat the sweet, sweet fish? You're one mysterious dude,' the creature says.".

Instead of touching fried fish:
	say "The fish feels slimy.".

Instead of squeezing fried fish:
	say "The fish's eyes bulge and it opens its mouth. Your hands feel icky.".

Instead of smelling fried fish:
	say "The fish has a slight rotten smell to it.".

Instead of listening to fried fish:
	say "Its days of making fish noises are over.".

Instead of tasting fried fish:
	say "You lick the fish. It tastes slimy and repulsive.[if the creature is present][line break][c]Oh it must be delicious,' the creature dreams.".

Instead of rubbing fried fish:
	say "Polishing won't make it any better.".
	
Instead of kissing the fried fish:
	try tasting the fried fish.
	
Understand "slap [the fried fish]" as a mistake ("Whap! The fish loses a point of stamina.").


Test dinner with "test oil/remove clothes/pour oil on yourself/enter duct/yell/give bottle to guard/get hole/put hole on door/open door/trade clothes/wear clothes/look under rug/push sticker/pour glue remover on sticker/put sticker on door/push sticker/z/z".


Part Glue remover

The glue remover is a liquid. It is useful. It is not conversable. The description is "It is a small tube of glue remover.". The indefinite article is "some".

Understand "tube" as the glue remover.

Instead of eating or drinking the glue remover:
	say "It would just go to waste. Besides it doesn't taste that good.".

Instead of entering the glue remover:
	say "The tube's way too small to enter.".

Instead of opening the glue remover:
	say "You open the cap and close it again. No need to keep it opened before it's used.".

Instead of switching on the glue remover:
	say "It's already closed.".

Instead of squeezing the glue remover:
	say "That's how the glue remover comes out. Not now, though, because the cap is closed.".

Instead of smelling the glue remover:
	say "It smells like glue.[if the creature is present][line break][c]Oh the irony,' [the creature] says.".

Instead of tasting the glue remover:
	say "It burns a bit on your tongue.[if the creature is present][line break][c]Must be the toxins,' the creature remarks.".

Instead of putting the glue remover on something:
	try pouring the glue remover on the second noun.
	



Part Light bulb


The light bulb is a device. It is middle and fragile. It is switched off. It is part of electrical wire. The description is "[if the light bulb is part of the electrical wire]The light bulb is hanging low on an electrical wire. It is [otherwise if the light bulb is in the cell]The light bulb is placed on the floor. It is [otherwise]The light bulb is [end if][if the light bulb is switched off]un[end if]lit.".
The light bulb can be swung or unswung. It is unswung.

The creature response of the light bulb is "[if the player is carrying the light bulb]You hold the light bulb in front of you. [end if][if the light bulb is not part of the wire]'How the [bowdler] is this possible?'[paragraph break][The creature] shrugs. 'Physical connection is not required for many things in [key castle]this place[endkey castle].'[otherwise][light bulb joke]".

The guard response of the light bulb is "[if the cell is dark][one of]'Could you please switch the light on?' you ask politely. 'WHAT ARE you TALKING ABOUT?' the guard yells. 'The power IS ALREADY ON!'[or]'What do you mean the power is on? The bulb isn't lit!'[paragraph break]'WELL that's not MY PROBLEM! I just make sure THE POWER IS ON and it IS ON!'[stopping][otherwise]'How many Screaming Communists does it take to screw in a light bulb?'[paragraph break]'Is that A JOKE? I don't GET IT,' the guard shouts." 

Understand "lamp" as the light bulb.
Understand "socket" as the light bulb when the light bulb is not part of the electrical wire and the cell is lit.
Understand "lit" as the light bulb when the light bulb is switched on.
Understand "dark" as the light bulb when the light bulb is switched off.

Should the game suggest taking the light bulb when the light bulb is part of the electrical wire: never.
Should the game choose when comparing the light bulb against the moon: it is a good choice.

Instead of switching on the light bulb when the light bulb is switched off:
	say "There's no light switch anywhere."
	
Instead of switching off the light bulb when the light bulb is switched on:
	try turning the light bulb.
	

[we need to make sure the game doesn't automatically take the bulb as a part of some other action when the player doesn't yet "know" that they can take it.]
Inserting the light bulb into something is bulb-taking.
Putting the light bulb on something is bulb-taking.
Giving the light bulb to someone is bulb-taking.

Before bulb-taking when the light bulb is part of the electrical wire (this is the stop bulb-taking rule):
	say "The bulb is attached to the wire.";
	stop the action.
	
The stop bulb-taking rule is listed first in the before rules.
	


Instead of eating the light bulb:
	say "You open your mouth as big as you can, but the bulb is just too big to swallow.[if the creature is present][line break][c]Man, did I pick the wrong cell to do business in,' [the creature] says.".

Carry out looking under the light bulb when the light bulb is part of the electrical wire:
	say "At the moment [italic type]you[roman type] are under it.[if the creature is present][one of][line break][point out self-evidency][or][stopping]" instead.

Instead of taking or tearing or pulling the light bulb when the light bulb is part of the electrical wire:
	if the light bulb is switched off:
		say "The bulb comes easily out from its socket. It was screwed in only very slightly[if the light bulb is swung]. Good thing it didn't come off when you pushed it![otherwise].";
	otherwise:
		if the ktonk count < 3:
			say "A good pull is all it takes - the wire snaps and you're left with a bulb and its socket.";
		otherwise if the ktonk count < 8:
			say "'Stupid bulb, you're gonna get it,' you mutter and yank the bulb from its socket. The wire snaps and you're left with a bulb attached to nothing but its socket.";
		otherwise:
			say "'I warned you!' you yell and pull the bulb as hard as you can. The wire snaps and you're left with a bulb attached to nothing but its socket.";
		say "[line break]Miraculously enough the bulb is still lit even when it's not connected to anything[if the creature is present]. [c]Hmm,[c] [the creature] muses[end if].";
	now the player carries the light bulb.

Instead of searching the light bulb:
	say "There's nothing hidden inside." instead.

Instead of touching the light bulb:
	say "[if the light bulb is switched off and the light bulb is a part of the electrical wire]It feels like it's a bit loose.[otherwise]It's round and smooth."

Instead of smelling the light bulb:
	say "It smells a bit of burnt dust.".

Instead of listening to the switched on light bulb:
	say "If you listen closely, you can hear a silent electrical whirring sound typical to such devices.".

Instead of pushing the light bulb when the light bulb is part of the electrical wire:
	if the cell is dark:
		say "You give the bulb a light push and it falls out of the socket; it was probably screwed in only very lightly. You fumble with the bulb and barely manage to stop it from smashing on the floor.";
		now the player carries the light bulb;
	otherwise:
		say "You give the bulb a push and it swings back and forth a few times. It makes the shadows in the cell dance and change shapes menacingly.[if the creature is present][line break][c]Whee,[c] [the creature] says.";
		now the light bulb is swung.
	
Instead of attacking the light bulb:
	say "Break your only [if the cell is dark]potential [end if]light source? No way!".
	

Instead of turning the light bulb:
	if the light bulb is switched off:
		try screwing the light bulb;
	otherwise:
		try unscrewing the light bulb.
		
Instead of inserting the light bulb into the electrical wire:
	if the light bulb is switched off:
		try screwing the light bulb;
	otherwise if the light bulb is part of the electrical wire:
		say "The bulb is already in its socket.";
	otherwise:
		try tying the light bulb to the electrical wire.
		
Instead of screwing the light bulb with the electrical wire: [SCREW BULB IN SOCKET]
	try inserting the light bulb into the electrical wire.
	
Check unscrewing the light bulb:
	if the light bulb is switched on:
		say "Being in the dark for a short while was bad enough. You are [italic type]not[roman type] going to turn the light bulb off voluntarily." instead;


Check screwing the light bulb:
	if the light bulb is switched on, say "It's already switched on." instead.
	
Carry out screwing the light bulb:
	now the light bulb is switched on;
	now the cell is lit;
	remove the ominous shapes from play;
	now the creature is in the cell;
	now the trading-bag is in the cell;
	now the light bulb is part of the electrical wire;
	change the pronoun he to the creature;
	now the trading-bag is conversable;
	now the creature is conversable;
	rule succeeds.
	
Instead of putting the photograph on the light bulb when the light bulb is not in the drinking glass:
	if the photograph is cut up:
		say "The bulb casts a faint shadow the shape of Captain McBrawn on the wall. You'll probably need to concentrate the light somehow to make any use of the effect.";
	otherwise:
		say "The photograph blocks the light and darkness falls to the cell. You remove the photo immediately.[if the creature is present][line break][c]Boo!' [the creature] says."
		
Instead of putting the photograph on the light bulb when the light bulb is in the drinking glass and the drinking glass is not in the tin foil:
	say "The photograph covers the top of the glass but light escapes from the bottom and sides of it."
	
Instead of putting the photograph on the glass when the light bulb is in the drinking glass and the drinking glass is not in the tin foil:
	try putting the photograph on the light bulb.
	
Instead of inserting the photograph into the glass when the light bulb is in the drinking glass and the drinking glass is not in the tin foil:
	try putting the photograph on the light bulb.	

Report screwing the light bulb:	
	say "You screw the lamp tighter into the socket and it lights up.[paragraph break]The light reveals the rest of the cell - an air duct running above the window, a simple rug on the floor, a hole that's probably meant to be used as a toilet and not much more.[paragraph break]Except a small, grinning, black monster in the corner next to a bulky sack.[paragraph break]'WHAT the... HELP!' you scream."


To say light bulb joke:
	if the creature is present, say "[one of]'How many [key Screaming Communists]Screaming Communists[endkey Screaming Communists] does it take to change a light bulb?' you ask.[paragraph break]'In Soviet Russia the light bulb changes you!' the creature replies.[or]'How many ADHD kids does it take to screw in a light bulb?' you ask.[paragraph break]'Three. One to screw in the ... hey look a squirrel!'[or]'How many nihilists does it take to screw in a light bulb?'[paragraph break]'None. Why bother? The new bulb will just go out soon enough,' [the creature] replies.[or]'How many Usenet regulars does it take to change a light bulb?'[paragraph break]'Are you kidding? The last time they tried to change a light bulb, the result was 127 posts in 25 threads where they quarrel which bulb-changing method is best suited for the job, why people shouldn't complain because the light bulb was free to begin with, and that illumination will never be mainstream unless they stop using old technology and adapt led lights. The light bulb is [italic type]still[roman type] unchanged.'[or]'How many...' you pause to think for a while. Nothing comes to your mind. 'Oh, never mind.'[stopping][run paragraph on]".



Part Motor oil

The motor oil is a liquid. It is not conversable. The printed name is "can of motor oil". It is useful. The description is "The can contains motor oil, meant to reduce friction of moving parts."

The creature response of the motor oil is "[if the motor oil is enclosed by the cell]'What should I do with this? There are no motors here that need oiling.'[paragraph break]'What are you asking me for, monkey boy? It's yours, do what you want with it!' [the creature] responds.[otherwise]'The oil made me slippery.'[paragraph break]'Regrettably I did see that. I won't be able to sleep for a week,' [the creature] says and shakes its head."

Understand "can" and "of" as the motor oil.

Instead of rubbing motor oil on something:
	say "It would just become very oily and slippery."
	
Instead of pouring motor oil on something:
	try rubbing motor oil on the second noun.
	
Instead of putting motor oil on something:
	try rubbing motor oil on the second noun.
	
Instead of opening or looking in the motor oil:
	say "You open the can and look inside. Yup, motor oil."


Test oil with "test encyclopedia/open encyclopedia/trade it".



Chapter Being slippery

Yourself can be slippery. The player is not slippery.

Instead of rubbing motor oil on yourself:
	if the player is clothed:
		say "That would surely ruin your clothes. Mom would never get the oil out.[if the creature is present][one of][your mom joke][or][stopping]";
	otherwise:
		say "You pour the oil on you and douse yourself with it. Every inch of yourself. Every drop of the oil gets used. The result is one slick and slippery Scotty.[if the creature is present][line break][c]My eyes! Is there no mercy for my poor retinas?' [the creature] cries.";
		remove the motor oil from play;
		now the player is slippery.


Part Nail scissors

The nail scissors are a thing. They are plural-named and useful. They are not conversable.

Understand "clippers" as the nail scissors.

Before cutting something with the nail scissors:
	try cutting the noun instead.

Test scissors with "test dinner/open foil/trade fish".


Part Photograph

The photograph is a thing carried by the player. It is insubstantial and self-lit. The description is "[if the photograph is intact]It's a postcard sized signed photograph of Captain McBrawn. You carry it with you everywhere you go and it's beginning to show the wear and tear.[otherwise]It's a silhouette of Captain McBrawn cut from a photograph.[end if]". The printing of the photograph is "[if the photograph is intact]'To Sotty, Cpt. Harrison McBrawn.' Good ol['] Captain. Still doesn't remember your name.[otherwise]The signature is illegible now that the photo is cut up.[end if]".
[self-lit because otherwise it is removed from the scope when dropped in darkness]

The photograph can be cut up or intact. It is intact.

The creature response of the photograph is "[if the photograph is intact][one of]'Look, here's Captain McBrawn. Doesn't he look heroic and brave?'[paragraph break]'Wait, where's his head?' [the creature] asks. 'It's right there behind his biceps,' you say.[or]'Captain McBrawn will come to rescue me,' you say. 'Good for you,' [the creature] replies.[stopping][otherwise]You try to hold back tears. 'Look what I did! I totally ruined Captain McBrawn's photograph,' you confess to the creature. 'Now now, I'm sure he will give you a new one,' [the creature] comforts you.[paragraph break]'Oh I have a drawer full of these at home,' you say. 'It's just that I had to ruin [italic type]this one[roman type].'[paragraph break]'What? You have a ... sheesh louise,' [the creature] mutters and runs its hands across its face.".
The guard response of the photograph is "'You should better let me go peacefully before it's too late! This here is Captain McBrawn and he'll be coming to rescue me and then you will be in [italic type]big trouble![roman type]'[paragraph break][g]OOH, I'M TREMBLING,' the guard shouts."

Understand "photo/picture/pic" as the photograph.
Understand "postcard/card" as the photograph.
Understand "post card" as the photograph.
Understand "captain" as the photograph.
Understand "mcbrawn/macbrawn" as the photograph.
Understand "signature/signing" as the photograph.

Understand "silhouette" as the photograph when the photograph is cut up.


Instead of tearing the photograph:
	try attacking the photograph.
	
Instead of giving the photograph to the creature when the creature is present:
	try discussing with the creature about the photograph.
	
Instead of giving the photograph to the guard:
	try discussing with the guard about the photograph.

Instead of searching the photograph:
	say "You have inspected every speck of the photograph. There is nothing more there to search for.".

Instead of attacking the photograph:
	if the photograph is cut up:
		say "It's already mutilated enough. Unfortunately.";
	otherwise:
		say "[italic type]Never![roman type] Even the very thought makes you weep gently.[if the creature is present][one of][insult wimpiness][or][stopping]".

Instead of touching the photograph:
	say "You caress the photograph slightly. 'Oh Captain, my Captain! [italic type]You[roman type] would surely find a way out of here in a blink of an eye!'".

Instead of squeezing the photograph:
	say "No, it might go bad.".

Instead of smelling the photograph:
	say "You smell the photograph, hoping that it would carry the familiar musky scent of Captain McBrawn. Instead you smell only your own hands.".

Instead of listening to the photograph:
	say "'Oh Captain! How will I ever escape this heinous place?'

You hold the picture to your ear, but alas! It does not answer.".

Instead of rubbing the photograph:
	say "Is that a speck of dirt on the photo? You scrub the picture [italic type]very gently[roman type] with your index finger.".

Instead of kissing the photograph:
	say "That's not something you do. At least not that often. Not every day, anyhow."
	

Instead of cutting the photograph when the player can see the nail scissors:
	if the photograph is cut up:
		say "You've mutilated the picture far enough.";
		stop the action;
	if the player is not carrying the nail scissors:
		say "(first taking [the nail scissors])[command clarification break]";
		silently try taking the nail scissors;
	say "After hesitating for a while you carefully cut out Captain McBrawn's image from the photograph. It takes a good while with the nearly useless dull scissors.
	
You look at the McBrawn's silhouette, which is perfectly cut out but the photograph and the autograph is ruined. The sacrifice makes a silent tear roll on your cheek.[if the creature is present][insult wimpiness]";
	now the photograph is cut up;
	now the nail scissors are not useful.
	
Test cutting with "test dinner/trade foil/cut photo".

	

Part Potion vial

The potion vial is a liquid. It is not conversable. It is fragile. The description is "The glass vial is very small and delicate. There's some purple liquid inside it and the words 'DRINK ME' written on it with beautiful cursive." The printing is "'DRINK ME'".

Understand "small" and "glass" and "liquid" and "purple" and "phial" as the potion vial.


Instead of pouring the potion vial on something:
	if the second noun is the player:
		say "You splash a few drops from the vial on yourself. There's a faint smell to it, but it's definitely not perfume.";
	otherwise:
		say "You drop a few drops from the vial on [the second noun], but nothing happens.";
		if the second noun is the creature:
			say "[line break][c]Except that [the creature] gets very mad,' it growls."

Before rubbing the potion vial on the player:
	try pouring the potion vial on the player instead.

Should the game choose when comparing the potion vial against the glass:
	never.	
	
[ See the next chapter.

Instead of drinking or tasting the potion vial:
	say "[one of]You take a sip from the vial. It has a very faint taste, something flowery, but you can't quite put your finger on it. Then suddenly the vial starts to get larger and larger; [if the player is clothed]your clothes seem to grow bigger and [end if]the walls and the ceiling seem to move further apart from each other.[paragraph break][if the player is clothed]You climb out from under your clothes that are now too huge to wear. [end if]The cell and everything in it seems to have grown at least tenfold. [The creature] is a towering monster far away.[if the creature is present][line break][c]Or could it be that you have just shrunk a lot smaller?' the creature booms.[end if][or]You take another sip and again shrink to a minuscule size.[stopping]";
	repeat with x running through things carried by the player:
		move x to the cell;
	if the player wears the adventuring clothes:
		move the adventuring clothes to the cell;
	now the creature is absent;
	now the player is tiny;
	the potion's effect wears out in 4 turns from now.]
	
	
Instead of drinking or tasting the potion vial:
	say "[one of]You take a sip from the vial. It has a very faint taste, something flowery, but you can't quite put your finger on it. Then suddenly the vial starts to get larger and larger; [if the player is clothed]your clothes seem to grow bigger and [end if]the walls and the ceiling seem to move further apart from each other.[paragraph break][if the player is clothed]You climb out from under your clothes that are now too huge to wear. [end if]The cell and everything in it seems to have grown at least tenfold. [The creature] is a towering monster far away.[if the creature is present][line break][c]Or could it be that you have just shrunk a lot smaller?' the creature booms.[end if][or]You take another sip and again shrink to a minuscule size.[stopping]";
	pause the cutscene;
	say "Very soon you find out that the effect doesn't last very long: you stretch back to your original size.";
	repeat with x running through things carried by the player:
		move x to the cell;
	if the player wears the adventuring clothes:
		move the adventuring clothes to the cell.	

Instead of drinking or tasting the potion vial when the guard is in the cell:
	say "You take a sip from the vial and the world starts to grow smaller and smaller. Very soon you are so small you can't see the guard's eyes anymore - and apparently he can't see you either.

[g]NOW WHERE did you GO[interrobang]' the guard yells. 'OH BUGGER, I'm going to GET FLOGGED if I let him ESCAPE!'

He opens the door and peeks inside. 'HEY! WHERE DID YOU GO!' You take advantage of the situation and start running through the door.

You run and run and run for what feels like eternity. Then the potion's effect starts to wear out and you grow quickly to your normal size. You managed to cover almost two meters from the door. Running with legs the size of a toothpick doesn't get one very far. You stand there, naked, grinning to the guard who leaps at you and throws you back inside.";
	pause the cutscene;
	say "[g]YOU STAY HERE and I'll take THIS WITH ME so NO TRICKS ANYMORE!' the guard shouts and takes the potion vial before slamming the door shut.";
	now the creature is present;
	make the guard leave;
	repeat with x running through things carried by the player:
		move x to the cell;
	if the player wears the adventuring clothes:
		move the adventuring clothes to the cell;
	remove the potion vial from play;
	mark the escape down as "cheating the guard by becoming tiny".

	
Instead of eating the potion vial:
	say "You gnaw on the vial until your teeth hurt.[if the creature is present][line break][c]It does say DRINK ME, not EAT ME,' [the creature] instructs. [question intelligence][line break][paragraph break]".
	
Test tiny with "test scissors/cut photo/trade scissors".
	


Chapter Becoming small

[
This is the code for how the vial worked at first. It was dropped because I ran out of time, and the current solution is perhaps better after all.



Yourself can be tiny or normal-sized. Yourself is normal-sized.

	
At the time when the potion's effect wears out:
	if the player is tiny:
		say "You feel like you're being stretched from inside and the world grows smaller and smaller until it's the same size as it has usually been.";
		now the player is normal-sized;
		now the creature is present.


Minusculity rules is a rulebook.
	
Before doing something when the player is tiny (this is the your options are quite limited when you are very small rule):
	abide by the minusculity rules.

The your options are quite limited when you are very small rule is listed first in the before rules.


Minusculity rule for looking:
	say "** (altered room description)";
	rule fails.
	
Minusculity rule for taking:
	say "[The noun] is far too big now for taking.";
	rule fails.
	
Minusculity rule for inserting it into:
	say "[The noun] and [the second noun] are too unwieldy now for you to handle.";
	rule fails. 

Minusculity rule for drinking a liquid:
	if the noun is the spit puddle:
		rule succeeds;
	say "The liquid is not at your reach now.";
	rule fails.
	
Minusculity rule for knocking on:
	say "You are so small the knocking doesn't make any audible noise.";
	rule fails.
	
Minusculity rule for swimming in:
	if the noun is the spit puddle:
		say "You take a deep breath and jump in the puddle which looks like a huge lake now. You swim around happily, not minding the tingling feeling all over your body. After a very short while the acid burns through your skin, then the internal organs, and finally dissolves the bones.";
		end the game in death;

After printing the player's obituary when the game ended in death:
	say "Congratulations, you found the only way of dying in the game! Type UNDO to continue playing.";
	
Minusculity rule for climbing:
	say "You try to climb [the noun] but it's just too big to scale."
	
]



Part Rug

The rug is a thing in the cell. It is middle, hidden in dim light and bulky. The description is "The rug has bright stripes in all the colors of a neon rainbow."

The creature response of the rug is "'Nice rug,' you comment.[paragraph break]'Oh you poor thing,' [the creature] says. 'You're color-blind as well!'"

The guard response of the rug is "'How nice that you found the time to decorate the cell with a rug,' you compliment the guard.[paragraph break]'WELL it does LOOK LIKE something a DOG HAS VOMITED, so this should be a GOOD PLACE FOR IT,' he replies."

Understand "simple" and "carpet" and "mat" as the rug. 
Understand "stripe/stripes" as the rug.


Before listing nondescript items:
	if the rug is marked for listing and the trapdoor is unrevealed:
		change the rug to not marked for listing.
		


Report taking the rug:
	say "You roll the rug and lift it to your arms.";
	if the trapdoor is unrevealed:
		say "[line break]Glancing down on the floor where the rug used to be you notice a trapdoor in the floor![if the creature is present][line break][c]What a shocking revelation,' [the creature] says.";
		discover the trapdoor;
	stop the action.


Instead of pushing or pulling or looking under the rug when the trapdoor is unrevealed:
	say "As you tug the rug with your foot you see something that looks like wood under it. You pull the rug all the way out and reveal a trapdoor in the floor![if the creature is present][line break][c]What a shocking revelation,' [the creature] says.";
	discover the trapdoor.

To discover the trapdoor:
	now the trapdoor is revealed;
	[the sticker must be added now, or the player will be able to interact with it before the trapdoor is revealed.]
	now the sticker is part of the trapdoor.
	

Before giving the rug to the creature when the trapdoor is unrevealed:
	try taking the rug;
	continue the action.




Chapter Wire-attacher

The wire-attacher is scenery in the cell. The printed name is "hook". It is self-lit and distant. The description is "The electrical wire is attached to the ceiling with just a fragile looking hook."

Understand "attacher/attachment" and "hook" as the wire-attacher.





Part Screwdriver

The Skindude multitool is a conversable thing. It can be mysterious, known but unopened, or turned into screwdriver. It is mysterious. It is useful. The description is "[if the multitool is known but unopened]It's a slightly rusted Skindude[tm] multitool, with all sorts of useful tools inside.[otherwise]It's a rusted piece of crap, that's what it is. The screwdriver part looks still somewhat functional." The printed name is "squarish metallic object".


Understand "free" and "sample/samples" and "tool/tools" and "halves" and "rust/rusted" and "squarish/square" and "metallic/metal" and "object" as the multitool.
Understand "screwdriver" and "screw driver" and "driver" and "hinge" as the multitool when the multitool is turned into screwdriver.
Understand "knives/knife" and "file/files" as the multitool when the multitool is known but unopened.


The creature response of the Skindude multitool is "[if the cell does not enclose the multitool]'The [']free gift['] was just a broken piece of crap!' you exclaim.[paragraph break][c]Let's not forget that a) it was [italic type]free[roman type] and b) it did get you out of here, didn't it? Too bad they had to bring you back in,[c] the creature replies a bit annoyed.[otherwise if the multitool is turned into screwdriver]'It's not much of a multitool as it is,' you reclaim[one of] when the plier part falls of the Skindude[tm] and disintegrates into rust particles as it hits the floor[or][stopping]. 'What, you want your money back? Sheesh, some customers,' it mutters under its breath.[otherwise]'Uh... What is it?' you ask.[paragraph break]'What is it[interrobang] What is it, he asks. Ha ha ha... what is it...' It coughs and says nothing more."
The guard response of the Skindude multitool is ""

Instead of discussing with the creature about the Skindude multitool when the Skindude multitool is not handled:
	say "'So, what's the free sample?' you venture.[paragraph break]'The free sample, eh?' [the creature] says and flashes a smile. 'The minute I saw you I said to myself [']H.R., there is a man who goes to the supermarket just for the free taste samples.[']' It reaches for the sack and pulls out a squarish metallic object which it hands to you. 'Here ya go, sport. Knock your teeth out.'";
	now the player carries the Skindude multitool;
	stop the action.
	
Understand "knock my/your teeth out" as a mistake ( "[if the creature is present][c]Figuratively, monkey boy! Figuratively!' [the creature] exclaims.[otherwise]That might hurt." ).
		
Instead of examining the Skindude multitool for the first time:
	say "After closer inspection the squarish metallic object turns out to be a slightly rusted Skindude[tm] multitool. It has two hollow halves connected with a hinge on one end. The halves can be opened to reveal knives, files, pliers and other tools inside. Excellent.";
	now the printed name of the multitool is "Skindude[tm] multitool";
	now the multitool is known but unopened.
	
Before opening the mysterious multitool:
	say "You take a closer look before handling the object any further. [run paragraph on]";
	try examining the multitool;
	
Before unscrewing something with the multitool:
	if the multitool is not turned into screwdriver:
		say "(first opening [the skindude multitool])[command clarification break]";
		try opening the multitool;
	continue the action.
	
Before unscrewing the doorhinges when the multitool is not turned into screwdriver:
	if the player can see the multitool:
		if the player is not carrying the multitool:
			say "(first taking and opening [the skindude multitool])[command clarification break]";
			silently try taking the skindude multitool;
		otherwise:
			try unscrewing the doorhinges with the multitool instead;	
		try opening the multitool;
	continue the action.

Before opening the known but unopened multitool:
	now the multitool is turned into screwdriver;
	say "You pull the halves apart and the Skindude[tm] opens with a creak. A swarm of rust flakes flies from the hinges. Looks like almost everything inside is rusted through; the only tool that looks even remotely useful is the screwdriver.";
	stop the action.
	

Instead of opening the turned into screwdriver multitool:
	say "It's already open." instead.

Instead of opening the multitool:
	do nothing.	[I don't get it, but this fires up every time as well as the previous ones.]	
	
Instead of closing the multitool:
	say "It's already closed.".
	
Instead of closing the turned into screwdriver multitool:
	say "It seems to be stuck open. Forcing might break it even more."
	

To say tm:
	if unicode 8482 is supported:
		say "[unicode 8482]";
	otherwise:
		say "(tm)";
		

	





	





Part Tin foil

The tin foil is a closed, opaque, openable container. It is on the dinner plate. The carrying capacity is 1. It is not conversable. The description is "[foil desc][run paragraph on]"; [there will be an extra line space without running the paragraph on]

To say foil desc:
	if the fish is in the tin foil:
		say "It's a small bundle of tin foil[if the tin foil is open] with a suspicious looking boiled fish inside[otherwise]. Judging by the pungent smell there might be some food inside[end if].";
	otherwise:
		say "It's a crumpled sheet of tin foil[if something is in the tin foil and the tin foil is open]. There's [a list of things in the tin foil] inside[otherwise if something is in the tin foil]. There seems to be something inside[end if]."
	

Instead of eating the tin foil:
	say "You bite down on the foil and feel a spark of sharp pain to your teeth.".

Instead of smelling the tin foil:
	say "It [if the fish is not in the tin foil]still [end if]smells quite pungent.".
	
Instead of wearing the tin foil:
	say "You contemplate on making a foil hat to prevent unwanted telepathy, but decide you don't have the time.[if the creature is present][one of][line break][question intelligence] [the creature] wonders.[or][stopping]"


Understand "small" and "sheet" and "of" and "crumpled" and "silvery/silver" and "package/bundle" as the tin foil.


	
Part Toilet hole

The toilet hole is in the cell. It is by the window. The description is "It's a smelly little hole[if the player carries the toilet hole]. Incredibly enough you are carrying it with you[otherwise if the toilet hole is handled]. Incredibly enough it seems to be a portable model[end if].".

['handled' is a handy property here, since if the toilet hole is handled, we have picked it up and thus know of its uncommon properties]		

Before listing nondescript items:
	if the toilet hole is marked for listing and the toilet hole is not handled:
		change the toilet hole to not marked for listing.

After examining the toilet hole when the toilet hole is part of something (called the surface):
	say "The toilet hole is currently attached to [the surface]."
	
After examining something when the toilet hole is part of the noun:
	say "The toilet hole is attached to it."

The creature response of the toilet hole is "[if the toilet hole is handled and the player carries the toilet hole]You dangle the hole in the air pinched between your thumb and index finger. [end if][if the toilet hole is handled]'What the [bowdler] is going on here[interrobang]'[paragraph break][c][The creature] shrugs. 'That's relatively common here. The [key previous owners]previous owners[endkey previous owners] of the [key castle]castle[endkey castle] did some freakish experiments. Things tend to be somewhat... [italic type]loose[roman type] around here.'[otherwise]'Just a hole in the ground? Am I supposed to... you know... in there?'[paragraph break]'What did you expect, chinese porcelain with chinchilla fur seat?' It then looks as if it remembered something and scratches the floor with its big toe. 'Well, to tell the truth there [italic type]was[roman type] such a toilet here, but I traded it for a set of fancy hubcaps.'"
  
The hubcaps are a conversable thing. Understand "hubcap" as the hubcaps. They are plural-named. The creature response is "'What use would you have for hubcaps?' you ask.[paragraph break]'They were bling-bling to the max,' [the creature] replies and you can't tell whether it's being serious or not."


Instead of entering or climbing through the toilet hole:
	say "It's way too small to fit through.".

Instead of looking under the toilet hole:
	say "That's too hard to accomplish.".

Instead of opening the toilet hole:
	say "It's already as open as it gets.".

Before closing the toilet hole:
	say "There's no cover on it." instead.

Instead of touching the toilet hole:
	say "It feels like air.".

Instead of squeezing the toilet hole:
	say "You can't see any way how that could be possible.".

Instead of smelling the toilet hole:
	say "Yuck.".

Instead of tasting the toilet hole:
	say "You have put your tongue in many unsavory places, but even you realize this would not be the smartest move to make.[if the creature is present][line break][c]Good call,' [the creature] comments."

Instead of rubbing the toilet hole:
	say "There's no surface to rub.".


[again, we need to make sure the game doesn't automatically take the hole as a part of some other action when the player doesn't yet "know" that they can take it.]
Inserting the toilet hole into something is hole-taking.
Putting the toilet hole on something is hole-taking.
Tying the toilet hole to something is hole-taking.
Giving the toilet hole to something is hole-taking.

Before hole-taking when the toilet hole is not handled (this is the stop hole-taking rule):
	say "You need to be holding the toilet hole to do that.";
	stop the action.
	
The stop hole-taking rule is listed first in the before rules.
	


[this makes the toilet hole listed last in the TAKE ALL command. Thanks to Roger for the solution.]
Should the game suggest taking the toilet hole: it is a passable suggestion.

Report taking the toilet hole for the first time:
	if multiple taking:
		say "Taken. Wait, what?" instead;
	otherwise:
		say "You pick up the hole from its corners and hold it with some disbelief[if the creature is present]. [c]Eww. That's not very hygienic,[c] [the creature] says[end if]." instead.
	

Instead of giving the toilet hole to the creature when the creature is present:
	say "[c]If I put [italic type]a hole[roman type] in my [key trading-bag]sack[endkey trading-bag], what do you think would happen?' [the creature] asks. [c]All of my merchandise would fall out. That's what.'"


Instead of putting the toilet hole on something (called the surface):
	try tying the toilet hole to the surface.
	
Instead of inserting the toilet hole into something (called the surface):
	try tying the toilet hole to the surface.

Instead of tying the toilet hole to something:
	say "That wouldn't help you escape."
	
Instead of tying the toilet hole to the player:
	say "You would just spill your guts."
	
Instead of tying the toilet hole to the trapdoor when the trapdoor is closed:
	say "You slap the hole on the trapdoor and you can see another room through it.[if the creature is present][line break]The creature says [c]Whoa.'"
	
Instead of tying the toilet hole to the trading-bag when the creature is present:
	say "[c]Hey!' [the creature] shouts. 'My stuff would fall out!'".

Instead of inserting something into the toilet hole:
	say "Better not. It would just get dirty and smelly."

To say attached the hole to something:
	say "[one of][line break]'[if the tongue is numb]Hah heemh... uhihy[otherwise]That seems... unlikely[end if],' you say[if the creature is present and the tongue is not numb]. ; [c]I've seen stranger things around [key castle]here[endkey castle],' [the creature] shrugs[end if].[or][stopping]".

Instead of tying the toilet hole to the celldoor:
	if the guard is in the cell:
		say "Better not do that while the guard is watching. He would probably confiscate the hole.";
	otherwise:
		say "You slap the hole against the door. It sticks there and through it you can see the corridor on the other side.[attached the hole to something]";
		now the toilet hole is part of the celldoor;
		if the doorkey is known:
			now the doorkey is in the cell. [so that it's "returned" when we know it's there (by having reached through the hole before)]
	
Instead of tying the toilet hole to the walls:
	say "You put the hole on one of the walls. There's nothing else than more stone visible through it. You peel the hole back out.[if the creature is present][line break][c]Looks like it's not a very deep hole,[c] [the creature] remarks."
	
Instead of tying the toilet hole to the floor:
	try dropping the toilet hole.

Report dropping the toilet hole:
	say "You place the toilet hole back on the floor." instead.
	
Instead of taking the toilet hole when the toilet hole is part of something (called the attachee):
	say "You peel the hole off [the attachee].";
	remove the doorkey from play; [the door key is added in scope when the hole is slapped on the door.]
	now the player carries the toilet hole.

Instead of touching the toilet hole:
	try reaching through the toilet hole.

Instead of looking through the toilet:
	if the toilet hole is part of the celldoor:
		say "You can see through the door and into the corridor.";
	otherwise:
		say "Fortunately it seems to be empty."
		
Instead of calling the guard when the toilet hole is part of the celldoor:
	say "Better not call the guard now. He would see the hole and foil your attempts at escape."


Chapter Reaching through the door



Carry out reaching through the toilet hole:
	if the toilet hole is a part of the celldoor:
		say "You put your hand through the hole in the door. Yes, the key is in the lock and at your reach!" instead;
	otherwise if the player has the toilet hole:
		say "You put your hand through the hole. It doesn't feel very special." instead;
	otherwise:
		say "You feel around the toilet hole. You find nothing but ickyness.[if the creature is present][line break][c]Oh man. I'm gonna lose my lunch,' [the creature] says." instead.
		

After reaching through the toilet hole:
	now the doorkey is in the cell.
	

Chapter Door key

The doorkey is scenery. It is by the door. The description is "You can't see the key from this side of the door and your head is too big to fit through the hole." The printed name is "key".

Understand "key" and "door key" as the doorkey.

Instead of turning the doorkey:
	try opening the celldoor.
	
Instead of taking the doorkey:
		say "You try to take the key but you're in awkward position and can't get it out."
	
Before unlocking the celldoor with the doorkey:
	try opening the celldoor;
	stop the action.

Procedural rule while unlocking the celldoor with the doorkey:
	ignore the take key before unlocking rule. [otherwise it, well, tries to take the key first and fails.]

	


Part Trebuchet

The trebuchet is a conversable thing. It is fixed in place, middle, and bulky. The description is "[The trebuchet] is a huge wooden structure on four cracked and worn wheels. There's a lever on the side and a mechanism that is apparently meant to throw objects at a great distance.".

To decide whether the trebuchet is broken:
	if the dinner plate is part of the catapult-arm:
		decide no;
	decide yes.
	
Understand "trebuchets" and "catapult" and "wallbreaker" as the trebuchet.
Understand "mechanism" and "siege" and "weapon" and "wood" and "metal" as the trebuchet.

The creature response of the trebuchet is "[if the trebuchet is in the cell]'It's a nice [trebuchet].'[paragraph break]'The finest,' [the creature] assures.[otherwise if the catapult-arm is tensioned]'[The trebuchet] was a bad idea,' you say. 'It did get you out the cell, didn't it?' the creature says.[otherwise]'Ok, I want the trebuchet.'[paragraph break]'Uh, well... actually, the trebuchet part was just marketing speech,' [the creature] stammers. 'But you wouldn't want one all the same. You'd just hurt yourself, I'm sure.'[end if]". [note that if the trebuchet is not in the cell but the arm is tensioned, it means it has been in the cell... very hacky, never do things like this.]

The guard response of the trebuchet is "[if the trebuchet is in the cell]'I have [a trebuchet].'[paragraph break]'YEAH RIGHT GOOD LUCK WITH THAT,' the guard yells.[otherwise if the catapult-arm is tensioned]'I had [a trebuchet],' you say and smile from ear to ear.[paragraph break]There's a long pause. 'UH... You CAN'T SEE IT but I'm HOLDING MY THUMBS UP SARCASTICALLY HERE,' the guard shouts.[otherwise]'Man I wish I had a trebuchet,' you say.[paragraph break]'HUHWHAT?' the guard shouts."

Instead of discussing with the creature about the trebuchet when the printed name of the trebuchet is "catapult" and the trebuchet is in the cell for the first time:
	say "'That's not a trebuchet actually. It's a catapult,' you comment. [c]What, are you suddenly an expert on medieval siege weaponry? All right, it's a catapult, sheesh!'".

Instead of discussing with the creature about the trebuchet when the manual is not handled and the trebuchet is in the cell:
	say "'What is that and how am I supposed to use it?'[paragraph break]'It's a [italic type]tre-bu-chet[roman type]. You use it to storm castles.' It sees the empty look in your face and sighs. 'Ok, I think I have a manual here somewhere.' It puts its hand in the sack and pulls out a leaflet which it hands to you.";
	now the player carries the manual.

Test trebuchet with "test flux/get flux/touch flux with wire/push sticker/pull switch/d/trade flux".

Check taking the trebuchet:
	say "It's way too big to move, even with the wheels." instead.
	
Instead of pushing or pulling or turning the trebuchet:
	try taking the trebuchet.
	

Instead of inserting something into the trebuchet:
	try putting the noun on the catapult-arm.
	
Instead of putting something on the trebuchet:
	try putting the noun on the catapult-arm.


Should the game choose when comparing the trebuchet against the catapult-arm:
	it is a good choice.


Chapter Winch

The winch is a part of the trebuchet. It is not conversable. The description is "A round wooden disc connects to the machinery with an axle, where it winds the mechanism. It seems to be missing its handles. There are just holes in regular intervals around the rim of the disc."

Understand "wooden" and "disc/disk" and "axle" and "holes" and "rim" and "wheel" as the winch.
Understand "mechanism" and "machinery" as the winch.

Instead of turning the winch:
	if the iron bars are not part of the winch:
		say "The winch is missing its handles. You can't get a good grip.";
	otherwise if the catapult-arm is tensioned:
		say "The arm is as far as it can go. You can't turn the winch any further.";
	otherwise:
		say "You turn the winch with all your might and [the trebuchet]'s mechanism screams and wails as the arm tensions and lowers down.";
		now the catapult-arm is tensioned.
		
Instead of inserting the iron bars into the winch:
	if the iron bars are part of the winch:
		say "The bars are already in the winch.";
	otherwise:
		say "You insert the bars into the holes in the winch. They fit perfectly.[if the creature is present][one of][line break][c]Isn't that just convenient,' [the creature] remarks.[or][stopping]";
		now the iron bars are part of the winch.
		
Understand "wind [winch]" as turning.
		
		
Chapter Arm

The catapult-arm is part of the trebuchet. It is not conversable. The printed name is "[trebuchet] arm". The description is "A huge wooden beam works as [the trebuchet]'s arm[if the catapult-arm is tensioned]. [The trebuchet] has been readied and the arm is down[end if][if the dinner plate is part of the catapult-arm]. The dinner plate is welded into the arm[end if]."

Understand "arm" and "shaft" and "catapult/catapult's/trebuchet/trebuchet's arm/shaft" as the catapult-arm.

The catapult-arm can be tensioned or free. It is free.

Instead of inserting something into the catapult-arm:
	try putting the noun on the catapult-arm.
	
Instead of putting something on the catapult-arm:
	if the noun is the dinner plate:
		try inserting the dinner plate into the catapult-arm;
	otherwise if the dinner plate is part of the catapult-arm:
		say "(on the plate)[command clarification break]";
		if the catapult-arm is tensioned:
			try putting the noun on the dinner plate;
		otherwise:
			say "[The trebuchet] isn't loaded. You can't even reach the arm now.";
	otherwise:
		say "It's missing a cup where to put things. The arm itself can't hold things."

Instead of inserting the dinner plate into the catapult-arm:
	if the catapult-arm is free:
		say "You might be able to wedge the plate in [the trebuchet]'s arm, but you can't reach it while the thing is not loaded and the arm is high up near the ceiling.";
	otherwise:
		if something is on the dinner plate:
			say "(first removing [the list of things on the dinner plate])[command clarification break]";
			repeat with x running through the list of things on the dinner plate:
				now the player carries x;
		say "You wedge the plate into [the trebuchet]'s arm. It looks like it should hold nicely.";
		now the dinner plate is part of the catapult-arm.


Instead of putting something on the dinner plate when the dinner plate is part of the catapult-arm and the number of things on the dinner plate > 0:
	say "It's better to shoot only one thing at the time."
	

Before putting something on the dinner plate when the dinner plate is part of the catapult-arm:
	if the catapult-arm is free:
		say "You can't reach the plate before [the trebuchet] is readied.";
		stop the action;
	otherwise if the noun is fragile:
		say "[The noun] would break, and you don't wish to break it.";
		stop the action;
	otherwise:
		continue the action.

	
Instead of entering the trebuchet when the dinner plate is part of the catapult-arm:
	try entering the dinner plate.
	
Instead of entering the catapult-arm when the dinner plate is part of the catapult-arm:
	try entering the dinner plate.

Instead of entering the dinner plate when the dinner plate is part of the catapult-arm:
	if the catapult-arm is free:
		say "You can't reach the plate now that [the trebuchet] is not readied and the plate is high up near the ceiling.";
	otherwise:
		if the guard is in the cell:
			make the guard leave;
		if something is on the dinner plate:
			say "(first removing [the list of things on the dinner plate])[command clarification break]";
			repeat with x running through the list of things on the dinner plate:
				now x is in the cell;
		say "You climb on the dinner plate and ponder the situation. '[if the tongue is numb]Eh ee.. I eeh omeih heavy o bhih owh eh ah. Oeih heavy ah ah[otherwise]Let's see... I need something heavy to bring down the wall. Something heavy and large[end if]...'[paragraph break]You hear [the creature] whirr and click with its mouth. [c]I wonder what this does,' it says.[paragraph break]You glance down and see that it fiddles with [the trebuchet]'s release lever. '[if the tongue is numb]Oh[otherwise]Don't[end if]...' you have time to say before it yanks the lever fully back.";
		pause the cutscene;
		say "'YYYAAAAEEEOOUU' *crash*[line break]";
		pause the cutscene;
		say "You have only a faint recollection of what happens next: there seems to be a lot of screaming and hassle around you. And sharp pain, well, everywhere. Eventually you find yourself back in the cell, still a bit dazzled.[paragraph break][c]Wow, that was spectacular,' [the creature] says. 'You brought almost the entire wall down. Too bad you weren't conscious enough to make much use of the situation.'[paragraph break]'The [key screaming communists]Screaming Communists[endkey screaming communists] on the other hand were very efficient. They built the wall again and removed [the trebuchet] to prevent any further [']accidents['],' it continues.";
		now the description of the walls is "The Screaming Communists have rebuilt the wall after you crashed through it.";
		mark the escape down as "catapulting yourself through the wall";
		remove the trebuchet from play;
	
	

Chapter Lever

The lever is a thing. It is part of the trebuchet. It is not conversable.

After pulling the lever:
	if the catapult-arm is free:
		say "You pull the lever but nothing happens.";
	otherwise:
		say "[The trebuchet]'s arm snaps forward with tremendous force and stops abruptly at the highest peak.";
		if the dinner plate is part of the catapult-arm and the number of things on the dinner plate > 0:
			let x be a random thing on the dinner plate;
			if x is insubstantial:
				say "[The x] futters on the floor.";
			otherwise:
				say "[The x] crashes on the opposite wall. Unfortunately it's not heavy enough to break through.";
			now x is in the cell;
		now the catapult-arm is free;
		if the creature is present:
			say "[line break][c]Whee,' [the creature] says.";


Chapter Wheels

The wooden wheels are a part of the trebuchet. They are plural-named. The description is "The wooden wheels are cracked and worn."

Instead of pushing or pulling or turning the wheels:
	try taking the trebuchet.
	

Chapter Cup

The cup is a thing. It is not conversable. 

The creature response of the cup is "[if the dinner plate is part of the catapult-arm]'I fixed [the trebuchet],' you declare.[paragraph break]'Good for you,' the creature says and applauds.[otherwise]'[The trebuchet] is missing a cup,' you complain.[paragraph break]'So it seems,' [the creature] says."
	

Chapter Manual

The manual is a thing. The description is "It's a manual leaflet for operating [the trebuchet]."

Instead of discussing with the creature about the manual when the manual is not handled:
	try discussing with the creature about the trebuchet.

Understand "trebuchet/catapult/trebuchet's/catapult's/trebuchets/catapults manual/leaflet/instructions" and "leaflet/instructions" as the manual.

The printing of the manual is "[fixed letter spacing]'Thank you for purchasing a [italic type]WallBreaker[tm][roman type] catapult! You are now the proud owner of a finest piece of modern medieval siege equipment.[paragraph break]To operate your WallBreaker[tm] catapult:[line break] 1) load the mechanism by turning the winch until the arm has come all the way down.[line break] 2) insert ammunition (sold separately) on the cup located at the end of the arm.[line break] 3) pull the lever.[line break] 4) repeat until the enemy's defensive structures have fallen.[line break] 5) storm the castle with your army.'[variable letter spacing]".

After reading the manual for the first time:
	now the printed name of the trebuchet is "catapult";
	now the ammunition is conversable;
	now the cup is conversable.
	
Instead of opening the manual:
	try reading the manual.

The ammunition is a not conversable thing. Understand "ammo" as the ammunition. The creature response is "'You don't happen to have any ammunition to this?'[paragraph break]'Stop playing with the thing. You'll just hurt yourself,' [the creature] warns." The guard response is "'I need some ammo for my [trebuchet],' you ask. 'HA! HA! You'll have to SLING YOURSELF if you don't find ANYTHING ELSE!' he roars."
	


Part Whiskey bottle

The whiskey bottle is a liquid in the encyclopedia. The whiskey bottle is fragile. The description is "According to the label the bottle contains [italic type]Meisterjäger[roman type], a strong liquor." The printing is "The label says 'Meisterjäger'."

Understand "whisky" and "drink" and "alcohol" and "booze/liquor" and "label" and "meisterjäger/meisterjager/meisterjaeger" and "brown" as the whiskey bottle.

Instead of giving the whiskey bottle to the guard:
	say "'Would you be interested in a... little drink?' you say and dangle the bottle in front of the eyehole. [g]Uh, is that [italic type]MEISTERJÄGER?[roman type] I most certainly SHOULD NOT... Maybe a little bit, JUST TO KEEP ME WARM ... JUST SLIP it through the HOLE, will you?' 'It won't fit through,' you remark. 'I must open the door... But KEEP IT QUIET, WILL YOU?'
	
There's a click from the keyhole and the door opens slightly. You slip the bottle to the guard who snatches it from your hand and slams the door shut. In his excitement he doesn't remember to lock the door! You wait for a moment and open it very carefully.
	
The guard is enjoying his prize and doesn't notice you slipping through the door. You navigate through the castle corridors until you stop behind a door where you hear conversation behind it.

'DID YOU HEAR that FEDOR has found a BOTTLE OF [italic type]MEISTERJÄGER?[roman type]' a voice yells.

'Meisterjäger? AND HE'S NOT SHARING?' another voice shouts. Several other voices murmur in unison. It gets harder to hear, but it seems they all decide to pay a visit to Fedor and his bottle. By the time you've deduced this, the door opens and twenty Screaming Communists march out.

'FEDOR, you OLD DRUNK we've come to DRINK FOR YOUR HEALTH and we've BROUGHT YOU A PRESENT,' they shout as they shove you to his lap.";
	mark the escape down as "bribing the guard with whiskey";
	remove the whiskey bottle from play;
	pause the cutscene;
	remove the guard from play;
	now the guard is away;
	now the creature is present;
	if the electrical wire is boobytrapping the door:
		say "'ALL RIGHT, IN WE GO,' Fedor shouts and inserts a key in the cell door lock.
		
*kZAP*

He gets a hefty shock from the keyhole, releasing you from his grip. You bolt away - but bump into the other guards. 'FORGOT US, did you? STOP SPASMING FEDOR and do your JOB!'";
		zap the guard;
		pause the cutscene;	
	say "The sounds of the Screaming Communists gradually die out when the bottle is finally empty and you're back in the cell with H.R.[paragraph break][c]Welcome back,[c] it says."
	

Instead of opening the whiskey bottle:
	say "A strong scent of alcohol rises from the bottle. You close the cap quickly again."
	
Instead of closing the whiskey bottle:
	say "It's already closed."
	
Instead of drinking or tasting or eating the whiskey bottle:
	say "It's too strong for your tastes."
	
Instead of attacking or pouring the whiskey bottle on:
	say "While you don't like the taste of it yourself, you understand it would be a shame to let the stuff go to waste."
	
Instead of pouring the whiskey bottle on glass:
	if the creature is present:
		say "[c]We're not that fancy here. Just drink from the bottle,' [the creature] says.";
	otherwise:
		say "You're not in the mood for drinking. You can drink straight from the bottle if need be."
	
Carry out looking through the whiskey bottle:
	say "The world gets a brownish hue when seen through the bottle." instead.


Instead of giving the whiskey bottle to the creature when the creature is present:
	say "'Thanks, but I have to keep a clear head to make the best deals,' [the creature] says."


Part Appendix

[these actions must be defined after the things they refer to are defined.]

Pointing the glass at the window is captain-calling.
Pointing the glass at the clouds is captain-calling.
Pointing the tin foil at the window is captain-calling.
Pointing the foil at the clouds is captain-calling.
Pointing the bulb at the window is captain-calling.
Pointing the light bulb at the clouds is captain-calling.
Putting the glass on the window is captain-calling.



[
One escape was to catch "cold" in the cell, then freeze the bars on the window with it and break them. To do this you would have to strip naked so you could "catch a cold".

The puzzle was dropped for obvious reasons.

	

Part Cold

cold is a thing in cell. It is scenery and proper-named. The description is "It is quite cold.".

Rule for printing the name of cold while taking inventory:
	say "some cold".

Understand "coldness" as cold.

Instead of taking cold when the player is clothed:
	say "You try to catch the cold, but it eludes you. Now what did mom use to tell you about cold...?".

Instead of taking cold when the player is clothed and the creature is present for the first time:
	say "You try to catch the cold, but it eludes you. Now what did mom use to tell you about cold...?[your mom joke]"

Instead of eating cold:
	say "That would give a serious brain freeze."

Instead of searching cold:
	say "You would probably just find more cold.".

Instead of touching cold when the player has the cold:
	say "It feels... very cold.".

Rule for implicitly taking cold:
	say "(first catching cold)";
	try silently taking the cold.
]






	

	
Volume 3 - The Creature


Book General 

The creature is a neuter animal. It is not conversable. It is by the window. The description is "The creature is small, shorter than you, and pitch black. It has an oblong head, no ears, tiny black eyes, and sharp, black teeth clearly visible behind a lipless mouth.

A constant dripping of spit from between its teeth forms a small greenish puddle of saliva by its feet." The initial appearance is "[if the creature is unnamed]A black creature stands next to a burlap sack looking at you expectantly.[otherwise][one of][The creature] stands there next to a large burlap sack.[or][The creature] rummages through its sack for a while.[or][The creature] looks at you.[or][The creature] waves at you.[or]The creature wags its tail slowly from side to side.[or][The creature] leans against its sack.[at random]"

After looking:
	say "[silent c][run paragraph on]"; [to suppress the random quips]
	continue the action.

The creature can be present or absent. It is absent. 
The creature can be spoken or silent. It is silent. 
The creature can be first name basis or unnamed. It is unnamed.
The creature can be mentioned by the guard. It is not mentioned by the guard.

The creature response of the creature is "[one of]'How the [bowdler] did you get in here?'[paragraph break]'What do you mean? I [italic type]live[roman type] in this [key castle]castle[endkey castle],' the creature replies.[or]'I'm still not so sure what you actually are,' you ask. 'I'm a trader,' [the creature] replies matter-of-factly.[paragraph break]You give up. 'Yes, but... ah, never mind.'[stopping]".
The guard response of the creature is "[one of]You lean closer to the door and whisper: 'There is some... [italic type]thing[roman type] in the cell with me!'[paragraph break][g]You are IMAGINING things![g] the guard yells.[or]'No, I mean it! Look at it, there the monster is!'[paragraph break]The guard squints. 'NOPE. CAN'T see ANYTHING,' he shouts.[stopping]".

After discussing with the guard about the creature:
	now the creature is mentioned by the guard.


Understand "monster/beast" as the creature.
Understand "hr" and "trader" as the creature when the creature is first name basis.

[the parser understands dots as separators for a new command; the following changes h.r. to hr before parsing so X H.R. and such will work]
After reading a command (this is the delete the creature's dots from input rule):
	let T be indexed text; 
	let T be the player's command; 
	replace the regular expression "(h\.r\.|h\.r|hr\.)" in T with "hr";
	change the text of the player's command to T.



Instead of taking the creature:
	try touching the creature.

Instead of eating the creature when the creature is present:
	say "'If I don't get out of here soon, I might have to resort to cannibalism,' you inform the creature.

[c]You must be confused about who is the dinner and who is the eater here,' [the creature] replies.".

Instead of looking under the creature when the creature is present:
	say "[c]Hey! That's just rude,' [the creature] shouts.".

Instead of searching the creature:
	try touching the creature.

Instead of kissing the creature:
	try touching the creature.

Instead of kissing the creature when the creature is present:
	say "'We should conserve body temperature by curling up close together,' you suggest.

[c]One: I'm cold-blooded. Two: that's the most disgusting idea I've ever heard[if the player is naked] coming from a chubby naked man[end if],' [the creature] replies.".

Instead of answering the creature that:
	try babbling to the creature that "foo".

Instead of touching or attacking the creature:
	say "You're too afraid to."
	
Instead of discussing with the ominous shapes about something:
	say "You don't have the courage."
	
Instead of attacking the creature when the creature is present:
	say "'I think I could overpower you if need be,' you muse.[paragraph break][c]Maybe by crushing me with your weight,' [the creature] replies. 'I don't suggest you to try, though. I'm sure I couldn't eat you all at once, but you'd be missing your trachea before you had time to start rolling.'".
	
Instead of touching the creature when the creature is present:
	say "[c]If you want to keep that finger, I suggest you keep touching just yourself,' [the creature] threatens.".

Instead of pushing, pulling or turning the creature:
	try touching the creature.

Instead of squeezing the creature when the creature is present:
	say "'A hug, please?'[line break][insult wimpiness]".

Instead of smelling the creature:
	say "There's a strange, slightly pungent smell to the creature.[if the creature is present][c]".

Instead of listening to the creature:
	say "[silent c]It hisses and gurgles from time to time.".

Instead of tasting the creature when the creature is present:
	say "'Would you mind if I licked you a bit?'

[c]Yes. Yes I very much would,' [the creature] objects.".

Instead of climbing the creature when the creature is present:
	say "'I have a plan. First, I climb on you...' you start.

[c]Whoa, stop right there. Judging by step one, that's a [italic type]very bad plan[roman type],' [the creature] says.".


Carry out bribing the creature with:
	if the creature is present:
		say "[c]I don't take bribes. I trade,' [the creature] says.";
	otherwise:
		say "It's probably not in a position to unlock the door even with bribes."


Rule for deciding whether all includes the creature: 
	it does not.
	

[the following are substitutions for quotation marks. Whenever the creature talks, the flag is set that it has spoken, so random quips won't be shown.]
To say c:
	say "'";
	now the creature is spoken.
	
To say silent c:	[this is when H.R. sighs or does something else that doesn't need the quotation marks but should set the flag anyway]
	now the creature is spoken.
	
After discussing with the creature about:
	now the creature is spoken;
	continue the action.
	

Test c with "screw bulb/t creature".


Part Tail

The tail is part of the creature. It is by the window. The description is "The creature's bony tail is long and black and resembles human's bare backbone. It sways very slowly from one side to the other."

The creature response of the tail is "'Nice tail.'[paragraph break]'I've grown fond of it, yes,' [the creature] says."

Instead of discussing with the guard about the tail:
	try discussing with the guard about the creature.

Instead of pulling the tail:
	if the creature is present:
		say "[one of][c]Hey! You're just begging for an [key acidic spit]acid spit[endkey acidic spit] facial, aren't you?' [the creature] yelps.[or]It doesn't look like it would come off. [The creature], on the other hand, looks like he's about to lose it so you decide to leave the tail be.[stopping]";
	otherwise:
		say "You don't dare to touch the tail."




Book Spit


Part Spit puddle

The spit puddle is a thing in the cell. It is scenery, liquid, and by the window. The description is "A sizzling greenish puddle of saliva is forming by the feet of the creature." The printed name is "puddle of saliva".

Understand "saliva" and "of" as the spit puddle.
Understand "green/greenish" and "acid/acidic" as the spit puddle.

Should the game choose doing something with the spit puddle when also considering the acidic spit: never.


Instead of taking the spit puddle:
	if the acidic spit is in the glass:
		say "You already have some spit in the drinking glass.";
		stop the action;
	if the player cannot see the drinking glass:
		say "You need something to put the spit in.";
		stop the action;
	if something is in the drinking glass:
		say "(first removing [the list of things in the drinking glass] from the glass)[command clarification break]";
		now everything in the drinking glass is carried by the player;
	say "You scoop some of the spit from the floor into the glass.";
	now the player carries the glass;
	now the acidic spit is in the glass;
	rule succeeds.


Instead of pouring the spit puddle on something:
	if the player can see the glass:
		try taking the spit puddle;
		try pouring the acidic spit on the second noun.
	

Instead of looking under the spit puddle:
	say "The floor is under it.".

Instead of searching the spit puddle:
	say "There doesn't seem to be anything in it.".

Instead of touching the spit puddle:
	say "You put your finger carefully in the saliva. You quickly feel a burning sensation and pull your finger away[if the creature is present]. [c]Eww. That's gross,' [the creature] says[end if]."

Instead of smelling the spit puddle:
	say "There's a sharp pungent smell to the saliva.".

Instead of listening to the spit puddle:
	say "It sizzles.".

Instead of tasting or eating the spit puddle:
	say "That would just be too disgusting.".
	


Part Acidic spit

The acidic spit is a conversable thing. It is liquid. The indefinite article is "some".

Understand "saliva" and "acid" as the acidic spit.

The creature response of the acidic spit is "[one of]'So, your spit is acidic?' you ask. [c]That's what the command clarification says,' [the creature] replies.[or]'How come your spit doesn't burn you?' you wonder.[paragraph break][c]Well, I'm immune myself, of course. But almost everything else corrodes by touch. Glass is one exception,' [the creature] tells.[stopping]".


Instead of inserting the acidic spit into the drinking glass:
	try taking the spit;
	continue the action.

Instead of inserting the acidic spit into something (called the receiver):
	try pouring the acidic spit on the receiver.

Instead of pouring the acidic spit on something (called the receiver):
	if the receiver is the guard:
		say "He would probably end up badly burned or even blinded, and escaping would not be any closer after that. In the worst case you would just create another supervillain and Captain McBrawn has already more than enough of those.";
	otherwise if the receiver is the creature:
		say "You drop some spit on the creature but nothing happens.[if the creature is present][line break][c]Didn't I tell you I'm immune to it?' it says.";
	otherwise:
		say "You pour a few drops of the spit on [the receiver]. The spit sizzles away in trails of smoke, leaving brown spots where it landed."




[if the player does EMPTY GLASS, the spit goes into player's inventory. This will take care of it.]
Every turn when the acidic spit is not in the glass:
	remove the acidic spit from play.
		

	
Test spit with "test encyclopedia/open book/get glass/put spit in glass".


	



Book Associated items


Part Trading bag

The trading-bag is a closed container. It is scenery, by the window and not conversable. The description is "The creature has a large burlap sack that struggles to keep all the contents inside. Various odd shapes protrude through the fabric."

Understand "bag/sack" and "trading bag/sack" and "burlap" and "shape/shapes/fabric" and "protrusions" and "odd" and "merchandise/inventory" as the trading-bag.

The creature response of the trading-bag is "'What's in the bag?' you ask.[paragraph break]'That's where I keep my ware,' [the creature] responds. 'You'll find out what's there when you trade something.'"

The printed name of the trading-bag is "bag".

Instead of taking or opening the trading-bag:
	say "[if the creature is present][one of][c]If you as much as think about touching the bag I will [key acidic spit]spit[endkey acidic spit] on your face, watch it melt and sell your skull as an ashtray,' [the creature] hisses.[or]You're too afraid to.[stopping][otherwise]As you approach the bag, the creature hisses at you. Better not touch it."
	

Part Ominous shapes

[this is the creature and his sack when the lights are off.
Release 2: the printed name is changed from "ominous shapes" to "dark shapes", because as one player pointed out, something doesn't become ominous just because they are so called.]
The ominous shapes are in the Cell. The printed name is "dark shapes". They are plural-named, fixed in place, conversable and self-lit. The description is "[one of]There's something very unnerving in the darkest corner of the cell... You can see the outlines of a round lumpy object and another, taller figure almost your size.[paragraph break]It's as if the taller shape just moved a bit. You hold back a whimper.[or]You daren't look anymore. Maybe they'll go away.[stopping]". 

The guard response of the ominous shapes is "[one of]'You got to let me out of here! There's... something here with me!'[paragraph break][g]OH GROW UP and stop IMAGINING THINGS,[g] the guard yells.[or]'Look, I'm not kidding, there's some monster in the cell!'[paragraph break][g]RIGHT and I'M MARILYN MONROE,[g] the guard yells.[paragraph break]'Marilyn, you have to get me out!' you say.[or][g]IF THIS IS ABOUT THE IMAGINARY MONSTER, I DON'T WANT TO HEAR IT,' the guard shouts.[stopping]"

After discussing with the guard about the ominous shapes:
	say "He [one of]grunts and [or][stopping]slams the eyehole shut. You hear footsteps going away from the door.";
	make the guard leave.
	

Understand "shape" and "figure/figures" and "dark" and "corner" and "outline/outlines" and "round" and "lumpy" and "object" and "tall/taller" and "disturbing" and "unnerving" as the ominous shapes.

Instead of listening to the ominous shapes:
	say "You hold very still, listening if the figures make any noise. They do not."
	
Before doing something with the ominous shapes:
	if the current action is not examining and the current action is not discussing with and the current action is not targetless discussing and the current action is not listening to:
		say "You don't have the courage." instead;
	otherwise:
		continue the action.
	


Book Chatter

The last creature quip is a number that varies. The last creature quip is 0.
	
Every turn when the creature is present and the creature is not spoken and a random chance of 1 in 12 succeeds and turn count - the last creature quip > 2 (this is the creature chatter rule):
	if the skindude multitool is not handled and the player is not carrying the skindude multitool: [seems "handled" property is changed the very last (or possibly very first) in the turn, so the turn H.R. gives the multitool it's still "not handled", that's why the carrying requirement]
		say "[one of]'Like I said, just ask me for a free sample!' [the creature] reminds you.[or]'Are you really not interested in the free sample?' [the creature] wonders.[or]'A free sample is just waiting for you!' [the creature] advertises.[or][stopping]";
	otherwise:
		say "[one of][The creature] digs a paper tissue from its bag and tries to wipe some spit from around its mouth. The tissue sizzles and melts away leaving just a faint trace of smoke.[or][The creature] yawns.[or][The creature] burps and covers its mouth with its hand. 'Sorry. Had Mexicans for lunch.'[or][The creature] scratches its head.[or][The creature] taps the floor with its foot.[at random]";
	change the last creature quip to the turn count.
	

Mexicans is a conversable thing. It is plural-named and proper-named. The creature response of the Mexicans is "[one of]'I've never been to Mexico.'[paragraph break]'Huhwhat?' [the creature] exclaims.[or]'I wonder what's it like in Mexico this time of year.'[paragraph break]'Would you stop going on and on about Mexico already?' [the creature]Â snaps.[stopping]".
Understand "mexico" and "mexican" as the Mexicans.


Every turn (this is the reset creature spoken flag rule):
	now the creature is silent.
	
The creature chatter rule is listed last in the every turn rules.
The reset creature spoken flag rule is listed last in the every turn rules.



Book Discussion

Carry out greeting the creature:
	if the creature is unnamed:
		meet HR;
	otherwise:
		say "'Hello, [creature]!' you say.[if the creature is present][line break]'Hello, monkey boy,' [the creature] replies.";

Carry out babbling to the creature that:
	say "[one of][c]Sorry, what?' [the creature] says.[or][c]Yes, yes, run along now,' [the creature] says.[or]You're about to ask, but you're not sure how to word the question.[or][The creature] seems to have been distracted and missed your question.[or][c]Dunno about that,' [the creature] says.[or]You don't find anything to say about that topic right now.[at random]";
	now the creature is spoken.
	

To meet HR:
	say "Before getting into detailed discussion, your first reaction is to tackle the surprising situation with the delicacy you have applied to most things in your life. 'What the [bowdler] is that[interrobang]' you yell and point at the creature. Much to your (additional) surprise, it replies. [c]Well, that's not what I would call a friendly greeting, monkey boy!'[paragraph break]You dare to go a bit closer. [c]H.R.[']s the name, and [key trading-business]trading[endkey trading-business] is my game!' It pats the sack it has next to it. 'I have everything a man of your standing would need, from kitchen utensils to trebuchets. Looks like I got your attention, little man - if you're interested, ask me for a [key Skindude multitool]free sample[endkey Skindude multitool]!'[paragraph break]It takes a while for the words to sink in. Not the least because the creature's voice combines hisses, clicks and high-pitched whirs which makes it quite hard to understand.";
	if the show keyword setup hint is true:
		say keyword setup hint;
	now the creature is present;
	now the printed name of the creature is "H.R.";
	now the creature is first name basis;
	now the creature is proper-named;
	now the player is by the window;
	stop the action.


Before discussing with the creature about when the creature is unnamed:
	meet HR;
	stop the action.
	
Before babbling to the creature that when the creature is unnamed:
	meet HR;
	stop the action.

Before discussing with the creature about when the tongue is numb:
	try babbling to the creature that "x"; [x could be anything really because the babbling action doesn't care about the topic.]
	stop the action.
	
Before babbling to the creature that when the tongue is numb:
	say "'Ha hoh? Hew mah howeh huh.'[paragraph break][c]Sorry, but I don't speak [one of]Idiot[or]Retard[or]Dimwit[at random],' [the creature] says.";
	stop the action.
	




Part Insults

To say insult wimpiness:
	if the creature is present, say "[line break][one of][c]I knew a girl like you once,[c] [the creature] remarks. 'She was five and she liked ponies. I bet [italic type]you[roman type] like ponies too, don't you.'[or][c]Cry me a river, baby. Cry me a river,[c] [the creature] quips.[or][c]Oh boo hoo', [the creature] says and in exaggerated motions pretends to rub its eyes with fists.[at random]"
	
To say your mom joke:
	if the creature is present, say "[line break][one of][c]I hear your mom lost some weight so they changed her classification to dwarf planet,[c] [the creature] quips.[paragraph break]'[Hey! Don't talk like that about my mom]!' you yell at it.[or][c]Your mom is so ugly they moved Halloween to her birthday,[c] [the creature] says.[paragraph break]'[That's just so not cool]!' you cry.[or][c]Your mom is so poor her picture is on the food stamp,[c] [the creature] says.[paragraph break]'[Shut up you whatever you are],' you snap at the thing.[or][c]Your mom is so clumsy, when she falls down she misses the ground,' [the creature] says.[paragraph break]'[Why are you being so mean],' you cry.[or][c]Your mom is so...' [the creature] says and pauses for a moment. '...damnit. I've run dry.'[stopping]";
	
To say Shut up you whatever you are:
	if the tongue is numb:
		say "Ah ah, uh... ae-eh uh ah";
	otherwise:
		say "Shut up, you... whatever you are".
		
To say Hey! Don't talk like that about my mom:
	if the tongue is numb:
		say "Eyh! Ooh aah i ah aouh i ah";
	otherwise:
		say "Hey! Don't talk like that about my mom".
	
To say That's just so not cool:
	if the tongue is numb:
		say "Hah uh oh oh uuh";
	otherwise:
		say "That's just so not cool".
	
To say Why are you being so mean:
	if the tongue is numb:
		say "Whuh ah uh beih oh meah";
	otherwise:
		say "Why are you being so mean".
		

To say question intelligence:
	say "[c][one of]You're not the sharpest tool in the shed, are you[or]You're not the brightest lamp of the Christmas lights, are you[or]There's no mayo in your sandwich, is there[or]The lamp's on, but nobody's in the lighthouse, is there[or]The elevator doesn't go all the way up, does it[or]There's no battery in your remote, is there[at random]?'[run paragraph on]".
	
To say point out self-evidency:
	say "[one of][c]Hold the Nobel nominations,[c] [the creature] says sarcastically.[or][silent c]The creature sighs.[or][The creature] claps its hands slowly in large motions. [c]Bravo. You've made the discovery of the century.[c][or][c]Did you come to that conclusion all by yourself? Congratulations,[c] [the creature] mocks you.[or][The creature] pretends to push the buttons of an invisible calculator. [c]According to my calculations you have the IQ of [an unintelligent object].[c][at random]".
	
To say an unintelligent object:
	say "[one of]a turnip[or]a pouchful of pistachios[or]a slightly rusted hammer[or]a roadkill[or]a moderately smart rock[or]an empty box of crayons[at random]".


To say bowdler:
	say "[one of]duck[or]fub[or]muck[or]shuck[or]ruck[or]rudd[or]tuck[or]truck[or]grue[or]funk[or]thud[at random]";
	
To say bowdlering:
	say "[one of]ducking[or]fubbing[or]mucking[or]shucking[or]rucking[or]rudding[or]tucking[or]funking[or]thudding[at random]";
	



Book Asking to do stuff

[I very much liked this stuff here so it was somewhat painful to remove it from release 3. Unfortunately it's too opaque for the player to find, and it would require that a lot of commands would have a response for the players to learn that CREATURE, X is implemented.

Removing this part also released some precious Z-code memory; I was running tight with release 3.

Instead of asking the creature to try eating the player:
	say "[one of]'Are you sure you're not about to eat me?' you ask. [c]Not yet,[c] the creature replies. 'What do you mean by that?' you ask and back away a step.[paragraph break]It raises its hands and recites: 'When the time comes, The Nameless One will rise from the Sea of Oblivion and call us to him, and we respond with the Song of Eternity; mankind comes to an end while we feast upon the flesh of men, and the skies are colored with the blood of the innocent. Ia ia ia!'[or]'So you're not going to eat me?' you ask. 'No[one of][or]. Stop asking[stopping],' it replies.[stopping]";
	now the Song of Eternity is conversable;
	now the Song of Eternity is familiar;
	now the Sea of Oblivion is conversable;
	now the Nameless-One is conversable.

Instead of asking the creature to try singing to something or singing:
	say "[c]I do not sing,[c] [the creature] replies icily."

Instead of asking the creature to try singing to the Song of Eternity:
	say "'Could you sing a bit of the Song of Eternity? If I catch the tune I could join on the chorus,' you suggest.[paragraph break][c]The moment I would start your eyes would melt and your brain would unravel itself and flow out the eye sockets,[c] [the creature] replies. [c]While it might be amusing, it's always such a mess I think I'll pass this time.'"

Instead of asking the creature to try tying something to:
	say "[c]Do you expect me to talk?' the creature asks.[paragraph break]'No, mr. [creature], I expect you to.. tie.'".
	
Before asking the creature to try doing something when the creature is not present:
	if the guard is in the cell:
		say "'Bye then, guard,' you say. The guard grunts and closes the eyehole.";
		make the guard leave;
	otherwise:
		say "You don't dare to ask [the creature] such thing right now.";
		stop the action.


Part Discussion topics


The Song of Eternity is a tune. It is not conversable. The creature response is "[c]It has a very catchy tune,[c] [the creature] says."

Carry out singing to the Song of Eternity:
	say "You don't know the lyrics nor the tune."

The Sea of Oblivion is a thing. It is not conversable. The creature response is "[c]Sorry but I've forgotten where it is,[c] [the creature] says."

The Nameless-One is a thing. It is not conversable. Understand "nameless" and "nameless one" as the Nameless-One. The creature response is "'Is The Nameless One so old and powerful you aren't allowed to pronounce his real name?' you ask.[paragraph break][c]Actually, I just can't remember it,[c] [the creature] confesses."

]


Book Trading



Part Trading action


Understand "give [something preferably held] with [something]" as giving it to.
Understand the command "trade" as "give".
Understand the command "exchange" as "give".
Understand the command "swap" as "give".
Understand the command "bargain" as "give".

Does the player mean giving something to the creature when the creature is present: It is very likely.

Does the player mean giving something to the player: It is very unlikely.

Understand "give [something]" as giving it to.

Rule for supplying a missing second noun while giving:
	if the guard is in the cell:
		change the second noun to the guard;
	otherwise if the creature is in the cell:
		change the second noun to the creature;
	otherwise:
		say "There's no-one here.".


Before giving something to the creature when the creature is absent:
	if the creature is first name basis and the guard is in the cell:
		say goodbye to the guard;
		continue the action;
	otherwise:
		say "You'd rather not give stuff to a strange monster when you have no idea what it wants.";
		stop the action.

To hand (merchandise - a thing) to the player:
	if the merchandise is bulky and the player carries a substantial thing:
		say "[line break]You drop everything from your hands to make room for [the merchandise].";
		repeat with x running through substantial things carried by the player:
			silently try dropping x;
	now the merchandise is in the cell;
	now the merchandise is seen;
	silently try taking the merchandise.


Instead of giving something to the creature when the creature is present:
	if the noun is the player:
		say "'What if I trade myself? What would you give in return?'[paragraph break][c]It's a tempting offer, but I'm not that hungry right now,' [the creature] replies.";
	otherwise if the noun is useful:
		say "You decide to hold on to it for a bit longer. It might still come useful.";
	otherwise:
		say "[one of]The creature shrugs. [c]Meh. Those kind of things don't sell.'[or][c]No thanks,' the creature says.[or][c]I think I have one of those already,' [the creature] says.[or][c]Thanks, but you should keep it,' [the creature] says.[at random]".
	



Part Trading stuff

Chapter Multitool -> Encyclopedia

Before giving the multitool to the creature when the multitool is not useful:
	say "'I don't want this. It's rusted through,' you complain. [c]It was [italic type]free[roman type],[c] [the creature] snaps. 'Oh well, I guess I [italic type]could[roman type] find something else... ' It rummages through its sack. [c][rummage through misc items] Here, you can have this.'[line break][paragraph break]It hands you a dusty old book.";
	remove the multitool from play;
	hand the encyclopedia to the player;
	stop the action.


Chapter Rug -> Flux Capacitor

Before giving the rug to the creature:
	say "'Would you trade this with me?' you ask.[paragraph break][c]Hmm... It [italic type]is[roman type] a nice rug, in a way, but I've seen [italic type]much[roman type] nicer ones in my days. It doesn't even [italic type]fly[roman type],[c] [the creature] sneers. [c]But since you're my best customer in this cell at the moment, I'll get you something nice for it. [rummage through misc items][c][paragraph break]The creature pulls from its sack a large cube-like thingamabob, hands it to you and puts the rug away.";
	remove the rug from play;
	hand the flux capacitor to the player;
	stop the action.
	

Chapter Broken flux capacitor -> Trebuchet

Before giving the broken flux capacitor to the creature:
	say "'I don't need this anymore.'[paragraph break][The creature] sighs. [c]Of course you don't need it anymore, it's a [bowdlering] smoldering piece of twisted metal after you got your hands to it!' It yanks the thing from your hands. [c]I'll get you something, but just so you'll know I'm not happy about this. I have mouths to feed! [rummage through misc items] Aha, this just takes up room.'[paragraph break][line break]The creature pulls out an improbably large structure of wood and metal. It's many times larger than the sack. 'I guess I [italic type]did[roman type] have a [key trebuchet]trebuchet[endkey trebuchet] there!'";
	remove the flux capacitor from play;
	now the trebuchet is in the cell;
	stop the action.



Chapter Empty encyclopedia -> Motor oil	

Before giving the encyclopedia to the creature when the encyclopedia is not useful:
	if something is in the encyclopedia:
		say "(first taking [the list of things in the encyclopedia] out from the box)[command clarification break]";
		now the player carries everything in the encyclopedia;
	if the article is a part of the encyclopedia:
		say "One page comes off the encyclopedia and flutters on the floor.[paragraph break]";
		now the article is in the cell;
	say "'Can I have something else instead?' you carefully ask. [c]Not enough pictures, eh? Well, I'll trade it in but I can't give you anything as nice this time. [rummage through misc items] This'll do.'
	
It gives you a can of motor oil.

"; [for some reason you need the two extra line spaces here, or there will be none printed. [paragraph break] doesn't work.]
	remove the encyclopedia from play;
	hand the motor oil to the player;
	stop the action.
	

Chapter Clothes -> Glue remover

The creature can be expecting Scotty to wear clothes. The creature is not expecting Scotty to wear clothes.

Before giving the clothes to the creature:
	if the player is wearing the clothes:
		say "(first taking the clothes off)[command clarification break]";
		now every thing carried by the player is in the cell;
		now the clothes are carried by the player;
	if the glue remover is not handled:
		say "[one of]'Can I get anything for these?' you ask and offer your clothes to the creature.[paragraph break][The creature] looks at the clothes in disdain. [c]If I took them, it would mean [italic type]you couldn't put them back on.[roman type] And that's [italic type]very[roman type] unacceptable.'[paragraph break][c]Aww, don't sulk,[c] [the creature] says when it sees your expression. [c]Let's make a deal: you put your clothes back on and I'll give you something nice. Ok?'[or][c]Clothes on - you get a treat. That was the deal,' [the creature] says sounding grumpy.[stopping]";
		the reminder about the clothes deal happens in three turns from now;
		now the creature is expecting Scotty to wear clothes;
	otherwise:
		say "[c]Look, we made a deal and you should keep it. I don't take extortion lightly,[c] [the creature] snaps.";
	stop the action.
	
At the time when the reminder about the clothes deal happens:
	if the player is naked and the creature is not spoken:
		say "[c]Hey, remember the deal? Clothes on, monkey boy,[c] [the creature] reminds you."


After wearing the adventuring clothes when the creature is expecting Scotty to wear clothes (this is the reward wearing clothes with a gift rule):
	now the creature is not expecting Scotty to wear clothes;
	say "You put your clothes back on.[paragraph break][c]That's more like it! Here you go,' [the creature] says and digs through the sack. It hands you a small tube.";
	hand the glue remover to the player.
	
The reward wearing clothes with a gift rule is listed first in the after rules.



Chapter Fish -> Nail cutter

Before giving the fish to the creature:
	try giving the tin foil to the creature;
	stop the action.
	
Before giving the tin foil to the creature:
	if the fish is in the tin foil:
		say "'Do you want this?' you ask.[paragraph break][c]Oh no I couldn't... YES I CAN,' [the creature] shrieks and grabs the foil from your hands. Pieces of fish and drops of saliva fly around as the creature devours your meal. The gruesome show ends in [the creature] silently burping and throwing the now empty foil over its shoulder. 'Wow, that really hit the spot. Yeah, maybe you'd like something in return?'[paragraph break]It puts its hand in the sack and majestically pulls out tiny nail scissors and hands them to you.";
		remove the fish from play;
		hand the nail scissors to the player;
	otherwise:
		say "[c]What do you suppose I would do with an empty sheet of tin foil?' [the creature] asks.";
	stop the action.
		 

Chapter Nail Cutter -> Magic potion

Before giving the nail scissors to the creature when the nail scissors are not useful:
	say "'Thanks, but I don't need this anymore.'[paragraph break][c]What am I, a library?' the creature snaps. 'Very well, I'll trade it in. [rummage through misc items] Oh, I don't know what this is so maybe you can have it then.'[line break][paragraph break][The creature] throws you a small vial.";
	remove the nail scissors from play;
	hand the potion vial to the player;
	stop the action.





Part Miscellaneous items

Table of Miscellaneous Sack Items
miscellanea
deck chairs from the Titanic
brass lamp
Grail
electric mixer
severed arm
battering ram
Jack Mills novel
cake
MacGuffin
teleporter
orange garden hose
Internet
trophy

A miscitem is a kind of thing. A miscitem is never conversable.

The deck chairs from the Titanic are a miscitem. They are plural-named. The creature response is "'You have deck chairs from the [italic type]Titanic[roman type] in your sack?'[paragraph break][c]Yes, but you can't have them,[c] [the creature] replies. 'I haven't arranged them yet.'".

The brass lamp is a miscitem. The creature response is "'Where did you get the brass lamp?' you ask [the creature]. [c]I traded it with a grue,[c] it says. 'He was very anxious to get rid of it.'".

The Grail is a miscitem. The indefinite article is "The". The creature response is "'Can I have the Grail?' you ask. [c]No. It belongs in a museum,[c] [the creature] replies."

The electric mixer is a miscitem. The creature response is "'The electric mixer could come in handy,' you suggest.[paragraph break][c]I can hardly see how,[c] [the creature] doubts. 'Besides for safety reasons I'm not allowed to give it to anyone who might try to lick the beaters while it's running.'".

The severed arm is a miscitem. The creature response is "'Do you really have a severed arm in there?' you ask and try to catch a glimpse inside the bag.[paragraph break][c]Sure. It belonged to the last guy who touched my trading bag,[c] the creature says and grins. You slowly back away from the sack."

The battering ram is a miscitem. The creature response is "'Hey, I could use the battering ram!' you venture.[paragraph break][c]Sorry, it's one of those key fob models. Not much of use I suppose.'".

The Jack Mills novel is a miscitem. The creature response is "'Oh, you have[if the encyclopedia is handled] other[end if] books too?' you ask.[paragraph break][c]Yeah, but you wouldn't like this one. It doesn't have any pictures,' [the creature] says."

The cake is a miscitem. The creature response is "'I would sure like some cake,' you utter optimistically. [c]The cake was a lie,' [the creature] replies."

The MacGuffin is a miscitem. The creature response is "'Could I see the MacGuffin?'[paragraph break][c]That would totally defeat its purpose, don't you think?' [the creature] replies."

The antique vase is a miscitem. The creature response is "'Can I trade something for the antique vase?'[paragraph break]The creature shakes its head. [c]That's out of the question. It's brand new!'".

The teleporter is a miscitem. Understand "teleport" as the teleporter. The creature response is "'Could I use the teleporter to get out of here?'[paragraph break][The creature] looks in the bag. [c]It does have a tag that says [']Scotty['], but I'm almost sure that it doesn't mean you. Anyway, it's broken.'".

The orange garden hose is a miscitem. Understand "gardenhose" as the orange garden hose. The creature response is "'I'll trade you something for the garden hose.'[paragraph break][c]Sorry, it's been chewed through.'"

The Internet is a miscitem. The creature response is "'What's an Internet?' you ask.[paragraph break]'It's just a series of tubes,' [the creature] responds."

The trophy is a miscitem. The creature response is "'So, you have won a trophy?' you ask.[line break][c]Not really. That Australian broad snatched it right from under my nose,' [the creature] replies."
Understand "prize" and "award" as the trophy.

To say rummage through misc items:
	choose a random row from the Table of Miscellaneous Sack Items;
	let miscitem1 be the miscellanea entry;
	now miscitem1 is conversable;
	blank out the whole row;
	choose a random row from the Table of Miscellaneous Sack Items;
	let miscitem2 be the miscellanea entry;
	now miscitem2 is conversable;
	blank out the whole row;
	say "Let's see... [a miscitem1]... no... [a miscitem2]... hmm...[run paragraph on]".



Volume 4 - The Guard

Book General

The guard is a man. He is by the door. The description is "The guard's eyes are the only thing that can be seen through the eyehole." The initial appearance is "The guard eyes you through the eyehole."
The guard can be bored, interested or away. The guard is away.
The guard is conversable.
The guard can be spoken. He is not spoken.

Understand "man" and "screaming" and "communist/commie" as the guard.
Understand "himself" as the guard when the guard is not away.
Understand "fedor" as the guard.
Understand "eye/eyes" as the guard.

The guard response of the guard is "'So... you're a guard, huh? How's that working for you?'[paragraph break]The eyes behind the door squint. [g]Are you COMING ON TO ME?[g]"

The creature response of the guard is "[if the creature is mentioned by the guard]'Why can't the guard see you?' you ask [the creature][paragraph break]'That's because I'm just a product of your imagination,' it says.[paragraph break]'Oh I see.'[paragraph break]'That was a joke, dummy! He's got a bad eyesight and no glasses,' it explains.[otherwise]'There's a guard outside who yells at me and won't let me leave,' you complain.[paragraph break][c]Yeah, that's what [key screaming communists]Screaming Communists[endkey screaming communists] do,[c] [the creature] replies."

Rule for deciding whether all includes the guard: 
	it does not.
	
Carry out bribing the guard with:
	try giving the second noun to the guard.
	
Instead of giving something to the guard:
	if the guard response of the noun is "":
		say "[g]WHAT do you think I SHOULD DO with THAT?' the guard shouts.";
	otherwise:
		try discussing with the guard about the noun.

To say g:
	say "'";
	now the guard is interested.
	
To say silent g:	[this is when the guard sighs or does something else that doesn't need the quotation marks but should keep the guard interested anyway]
	now the guard is interested.
	
After discussing with the guard about:
	now the guard is interested;
	continue the action.

	
Book Discussion

Carry out babbling to the guard that:
	say "[one of][g]I do not UNDERSTAND you!' the guard shouts.[or][g]SPEAK UP!' the guard shouts.[or][g]WHAT?' the guard shouts.[or]Nothing particular about that topic comes to mind.[or]You're about to ask, but you're not sure how to word the question.[at random]";
	now the guard is interested.
	
Carry out greeting the guard:
	say "'Hello!' you say.[paragraph break][g]Well HELLO,' the guard screams."


Book Entering and exiting

Calling is an action applying to one visible thing.

Understand "call [any man]" as calling.

Carry out calling the guard:
	if the guard is away:
		say "The rectangle on the cell door slides open and a pair of beady eyes appear behind it. [g]WHAT is all this RACKET?' a loud voice behind the door says[if the player is naked]. After a short pause the voice goes: [one of]'WHAT THE... are you NAKED IN THERE?'[or]'Why you... ARE YOU STILL NAKED?'[stopping][otherwise].[end if][one of][line break]'Help! You have to get me out of here!' you beg.[paragraph break]'HA! HA! WHY would I do THAT? I'M THE [key guard]GUARD[endkey guard], I'M SUPPOSED TO KEEP YOU INSIDE!' the voice roars.[or][stopping]";
	otherwise:
		say "[g]WHAT?' the guard yells.";
	now the guard is in the cell;
	now the guard is interested;
	now the creature is absent;
	change the pronoun he to the guard;
	if the show keyword setup hint is true:
		say keyword setup hint.


Every turn:
	if the guard is interested:
		now the guard is bored.

Instead of knocking on the celldoor:	[yelling is dealt with in its action code]
	try calling the guard.	



The Guard's Visit is a recurring scene. 

The Guard's Visit begins when the guard is in the cell. 
The Guard's Visit ends when the guard has been bored for 4 turns or the guard is not in the cell.


When the Guard's Visit ends:
	if the guard is in the cell:
		say "[one of]'WELL if you DIDN'T HAVE anything else,' the guard shouts[or]The guard grunts[stopping] and closes the eyehole.";
		make the guard leave.

To make the guard leave:
	remove the guard from play;
	now the guard is away;
	if the creature is in the cell and the creature is first name basis:
		now the creature is present;
		change the pronoun he to the creature.
		

To say goodbye to the guard:
	say "'[one of]I have nothing to say now[or]I guess that was all[or]Ok, bye now[at random],' you say to the guard before talking to H.R. '[one of]WHATEVER[or]JUST DON'T BOTHER ME ANYMORE[or]FINE[or]ALL RIGHT THEN[at random],' the guard yells and slides the eyehole shut.";
	make the guard leave.

Before discussing with the creature about something when the guard is in the cell:
	say goodbye to the guard;
	continue the action.
	
Before babbling to the creature that when the guard is in the cell:
	say goodbye to the guard;
	continue the action.


Volume 5 - Extra discussion topics

escaping is a conversable thing. It is improper-named. Understand "escape" and "breakout" and "breaking out" and "break-out" and "break out" as escaping.
The creature response is "'I have to find an escape!'[paragraph break]'Good luck with that, kid,' [the creature] says."
The guard response is "[the guard response of the President]".

The kitchen utensils is a conversable thing. It is plural-named. Understand "utensil" as the kitchen utensils. The creature response is "'Kitchen utensils?'[paragraph break]The creature looks inside the [key trading-bag]bag[endkey trading-bag] and waves its hands in exaggerated gestures. 'OOOoohh.. I traded the last set just hours ago. Tough luck, kid!'".


The trading-business is a conversable thing. Understand "trade/trading" and "business" and "exchange/exchanging" and "swap/swapping" as trading-business. The printed name of trading-business is "trading". The creature response is "[one of]'So... You're a trader?' you ask. 'Yessir, that I am!' the creature replies. 'I am well known everywhere in [key castle]Castle Schweinehund[endkey castle], swapping items you no longer need for quality merchandise! Just show me what you got and I'll see if there's something I could trade you for it.'[or]'What kind of things do you have for trade?'[paragraph break][c]All kinds of things,' [the creature] replies. 'Give me something and you'll see.'[or]'Could I have money for my stuff?' you ask. [c]Nah, I don't like money. It's too abstract. Besides money has no use here,' [the creature] says.[stopping]".


The castle is a conversable thing. Understand "schweinehund/schweinhund" and "this place" and "here" and "fort/fortress" and "prison/cell/jail/room" as the castle.
The creature response of the castle is "'What is this place anyhow? Where are we?'[paragraph break][c]This is Castle Schweinehund,' [the creature] tells you. 'Story goes that the [key previous owners]previous owners[endkey previous owners] built it on an ancient burial ground and used it to perform occultist rituals, opening portals to other worlds and so on. Sounds like old wives['] tales to me,' it says and runs its hand across its tail."
The guard response of the castle is "'Where are you keeping me? What is this place?' you demand to know.[paragraph break]'This is CASTLE SCHWEINEHUND! A BEAUTIFUL FORT of [key screaming communists]SCREAMING COMMUNISTS[endkey screaming communists]! And you will NEVER ESCAPE from here!'"

The previous owners are a conversable thing. They are plural-named. Understand "inhabitants" and "owner" as the previous owners.
The creature response of the previous owners is "'Who were the previous owners?'[paragraph break]'I'm not sure exactly. They were quite loud as well but not to the extent of the current ones.'".
The guard response of the previous owners is "'What happened to the previous owners of the castle?'[paragraph break]'I... DON'T KNOW,' he replies. 'WE found the castle ABANDONED.'".


The Screaming Communists are a conversable thing. They are plural-named. Understand "commies" as the Screaming Communists.
The creature response of the Screaming Communists is "'What do you think of the Screaming Communists?' you ask [the creature].[paragraph break][c]They're a bit loud for my tastes. And they're not the ideal business partners, either. They tend to rather shoot you and take your stuff instead of trading.'".
The guard response of the Screaming Communists is "'What does it actually mean being a Screaming Communist?'[paragraph break][g]You get to SCREAM! And THREATEN PEOPLE! By SCREAMING! AND I LIKE IT![g] he replies."

Should the game choose when comparing the Screaming Communists against the guard:
	it is an excellent choice.

The President is a conversable thing. 
The creature response of the President is "'My mission is to save the President of the World,' you tell [the creature].[paragraph break]'I bet the President would have stuff to trade,' it ponders."
The guard response of the President is "'I'm going to break out and save the President!'[paragraph break]'HA! I SPIT at your PRESIDENT!' the guard yells."

The cousin Herbert is a thing. It is not conversable. It is proper-named.
Understand "herbie" and "monster" as cousin Herbert.

The creature response of cousin Herbert is "'Wait, you knew there was a monster in the air ducts?' you cry. 'Sure. It's cousin Herbert, hired by the [key screaming communists]Screaming Communists[endkey screaming communists] to keep the vents safe,' [the creature] says.[paragraph break]'Then why didn't you say anything [italic type]before[roman type] I went in there[interrobang]'[paragraph break][The creature] shrugs. 'I thought Herbie might have been hungry.'".

The guard response of cousin Herbert is "[one of]'There's a MONSTER in the air ducts!' you scream.[paragraph break]'THERE'S NO NEED TO SHOUT', the guard says. 'It's just HERBIE. It's doing A GREAT JOB.'[or]'Wait, you put the monster there?'[paragraph break]'NOT EXACTLY. Let's just say that WE HAVE A DEAL,' the guard shouts.[or]'What kind of deal you have with Herbert?' you ask.[paragraph break]'HERBIE keeps the DUCTS CLEAN, and IN RETURN it gets to eat anyone he finds,' the guard tells you.[stopping]".


The karaoke-machine is a thing. 
Understand "karaoke" and "karaoke machine" as the karaoke-machine.
The creature response of the karaoke-machine is "'You have a karaoke machine? Good, I was getting a bit hungry, though I don't like raw fish that much,' you assert.[paragraph break][The creature] rolls its eyes."





Volume 6 - Menus


Book Main menu

Understand "help" or "menu" or "about" or "info" or "credits" as asking for help.
Asking for help is an action out of world.
 
Carry out asking for help:
	change the current menu to the Table of Menu options;
	change the current intro text to "";
	change the current menu title to "Main menu";
	carry out the displaying activity;
	clear the screen;
	try looking.


Table of Menu options
title	subtable	description	intro	toggle
"About [italic type]Escapade![roman type]"	--	"[about Escapade!]"	--	--	
"How to play"	--	"[how to play]"	--	--
"Talking with characters"	--	"[discussing with characters]"	--	disable keyword setup hint rule
"Settings"	Table of Keyword Settings	text	"When the game prints a word that can be used as a discussion topic with other characters, it will be highlighted for the first time. Here's an example of a highlighted word using your current settings: [hint style start]keyword[hint style end][paragraph break]Select a new highlight style below and press Q to return. Note that not all interpreters support every highlighting style; choose the one that works for you." [During the game some cutscenes may clear the screen. You can disable this behavior by changing the screen clearing to OFF."; ]	disable keyword setup hint rule
"License"	--	"[license]"


To say about Escapade!:
	say "[italic type]Escapade![roman type] was an entry to the One Room Game Competition 2008 where it finished second out of seven games and was later nominated for three XYZZY awards.[paragraph break]";
	say "If you get stuck, there's a HINT command and a walkthrough included in a separate file. The hints and the walkthrough will cover only the minimum solution, so there will still be some optional puzzles you have to find the solution without help.[paragraph break]";
	say "The source code is distributed with the game. You can also download it from [italic type]http://www.nitku.net/if/escapade/[roman type]. You are free to modify the game or use snippets from the code; see LICENSE for details.[paragraph break]";
	say "There's a good chance of a post-competition release. If you find bugs or you have other suggestions, please email me at [Juhana's email]. I'm also interested in seeing transcripts of playthroughs.[paragraph break]";
	center "[bold type]CREDITS[roman type][paragraph break]";
	say "The game was programmed with Inform 7 by Graham Nelson and others, using extensions by Eric Eve, David Fisher, Jon Ingold, Michael Martin, Andrew Owen, and Emily Short.
	
And last but not least, a big thank you to the playtesters: Taleslinger, Mike Tarbert, Christian Moura, George Oliver, Jim Aikin, S. John Ross, and Roger Carbol. Thank you to everyone who later sent transcripts of their plays. This would have been a lesser game without your help.[paragraph break]";
	say "  -- Juhana";


To say how to play:
	say "[italic type]Escapade![roman type] is a work of Interactive Fiction. You take the role of Scotty who has been captured by the Screaming Communists. Your goal is to find an escape from your prison.
	
You do this by giving simple instructions like KNOCK ON DOOR to Scotty by typing them on the prompt. The game responds and tells you how Scotty and the game world reacts. The commands are usually simple <verb> <noun> -constructs so you should try to use as simple language as possible (instead of LET'S SEE WHAT'S IN THE BOX just type LOOK IN BOX). 

Some important and most used commands:[line break]
 [bold type]EXAMINE[roman type] or [bold type]X[roman type]: The EXAMINE command gives you a more detailed description of the objects found in the cell. This is possibly the most used and most useful command.[line break]
 [bold type]LOOK[roman type] or [bold type]L[roman type]: While EXAMINE inspects a particular object closer, the LOOK command gives an overview of everything you see around you.[line break]
 [bold type]INVENTORY[roman type] or [bold type]I[roman type]: The INVENTORY command tells you what you are carrying and wearing at the moment.[line break]
 [bold type]SAVE[roman type] and [bold type]RESTORE[roman type]: These commands let you save your progress and continue later where you left off. Note that you can't die or end up in an unwinnable situation in this game.[paragraph break]";
	say "Other useful commands:[fixed letter spacing]

 TAKE        READ[line break]
GIVE        KNOCK[line break]
PUT         ATTACH[line break]
OPEN        YELL[line break]
CLOSE       POUR[line break]
PUSH        CLIMB[line break]
PULL        EAT[line break]
TURN        DRINK[line break]
SCREW       POINT[line break]
TALK ABOUT[variable letter spacing]

The command TALK ABOUT can be abbreviated to T. See 'Talking with characters' entry in the main menu.

If you get stuck, you can type HINT to get some pointers on how to go on. Don't spoil the game for yourself by overusing hints!

For more information on how to play Interactive Fiction see for example [italic type]http://brasslantern.org/beginners/[roman type] and for more games see [italic type]http://ifdb.tads.org/[roman type]";
 

To say discussing with characters:
	say "To talk with the NPCs (non-player characters) use the TALK ABOUT <topic> command. This can be abbreviated to T (or A if you like). Keep the topics simple; the game recognizes mostly only one or two word topics. The game chooses the character most suitable for the situation, so you don't have to explicitly address them.
	
Some of the topics you can talk about are highlighted in the game text. The default highlighting is [bold type]bold type[roman type], but you can change this from the Settings menu or by commanding OPTIONS. Some interpreters do not support bold type. If this is the case for you, you should change the highlight type to something else.

Topic highlighting is not essential to finishing the game. Highlights are not exactly hints but they can give you a nudge toward asking the 'right' questions. If you wish to play without this feature you can turn it off from the Settings menu.

Note that highlighted topics are not the [italic type]only[roman type] topics available - they're just a small sample of everything the NPCs understand."


Part Email address

To say Juhana's email: say "[italic type]juhana[spamdot]if[spamat]nitku[spamdot]net[roman type]". [spamblock because the source is published in the web]

To say spamdot:
	say ".[run paragraph on]".
	
To say spamat:
	say "@[run paragraph on]".


Part Settings

Understand "setting" or "settings" or "setup" or "options" as setting settings.
Setting settings is an action out of world.

Carry out setting settings:
	change the current menu to the Table of Keyword Settings;
	change the current menu title to "Settings";
	change the current intro text to "When the game prints a word that can be used as a discussion topic with other characters, it will be highlighted for the first time. Here's an example of a highlighted word using your current settings: [hint style start]keyword[hint style end][paragraph break]Select a new highlight style below and press Q to return. Note that not all interpreters support every highlighting style; choose the one that works for you."; [During the game some cutscenes may clear the screen. You can disable this behavior by changing the screen clearing to OFF."; ]
	follow the disable keyword setup hint rule;
	carry out the displaying activity;
	clear the screen;
	try looking.


Table of Keyword Settings
title	subtable	description	intro	toggle
"[bold type]bold[roman type] keywords"	a table-name	text	text	the change hint style rule
"[yellow letters]yellow[default letters] keywords"	--	--	--	the change hint style rule
"[blue letters]blue[default letters] keywords"	--	--	--	the change hint style rule
"[green letters]green[default letters] keywords"	--	--	--	the change hint style rule
"[red letters]red[default letters] keywords"	--	--	--	the change hint style rule
"-dashed- keywords"	--	--	--	the change hint style rule
"/slashed/ keywords"	--	--	--	the change hint style rule
"*starred* keywords"	--	--	--	the change hint style rule
"no keyword highlighting"	--	--	--	the change hint style rule
[
""	--	--	--	--
"screen clearing: [screen clearing status]"	--	--	--	the toggle screen clearing rule
]

This is the change hint style rule:
	if the current menu selection is:
		-- 1:
			change the hint style start to "[bold type]";
			change the hint style end to "[roman type]";
		-- 2:
			change the hint style start to "[yellow letters]";
			change the hint style end to "[default letters]";
		-- 3:
			change the hint style start to "[blue letters]";
			change the hint style end to "[default letters]";
		-- 4:
			change the hint style start to "[green letters]";
			change the hint style end to "[default letters]";
		-- 5:
			change the hint style start to "[red letters]";
			change the hint style end to "[default letters]"; 
		-- 6:
			change the hint style start to "-";
			change the hint style end to "-";
		-- 7:
			change the hint style start to "/";
			change the hint style end to "/";
		-- 8:
			change the hint style start to "*";
			change the hint style end to "*";
		-- 9:
			change the hint style start to "";
			change the hint style end to "";
		-- otherwise:
			do nothing.



Show keyword setup hint is a truth state that varies. Show keyword setup hint is true.

To say keyword setup hint:
	say "[line break][italic type](You may converse with characters by typing TALK ABOUT <something>. Some of the possible topics you can talk about are [bold type]highlighted[roman type][italic type] in the text; if you don't see the highlights or you want to turn them off, type OPTIONS.)[roman type][line break]";
	follow the disable keyword setup hint rule.

This is the disable keyword setup hint rule:
	change show keyword setup hint to false;
	rule succeeds.
	

This is the toggle screen clearing rule:
	if screen clearing is true:
		change screen clearing to false;
	otherwise:
		change screen clearing to true.
		
To say screen clearing status:
	if screen clearing is true: 
		say "ON"; 
	otherwise:
		say "OFF";


Book Hints

Hinting is an action out of world applying to nothing.
Understand "hint" and "hints" as hinting.

Carry out hinting for the first time:
	say "Warning! You are about to spoil the game for yourself! If you are absolutely sure you need a hint, type HINT again.";
	stop the action.
	
To decide whether a tradeable item is within reach:
	if the cell encloses the rug, decide yes;
	if the cell encloses the skindude multitool and the skindude multitool is not useful, decide yes;
	if the cell encloses the flux capacitor and the flux capacitor is not useful, decide yes;
	if the cell encloses the encyclopedia and the encyclopedia is not useful, decide yes;
	decide no.
	
	
Carry out hinting:
	if the cell is dark:
		say "[one of]Your first task is to get some light in the cell.[or]There's a light bulb here, but it's not lit.[or]There's no light switch in the room.[or]Have you tried asking the guard about it?[or]You can call the guard by knocking on the door.[or]The guard says the power should be already on.[or][if the light bulb is handled]You were able to pick the bulb up quite easily, weren't you?[otherwise]Try touching the bulb.[end if][or][if the light bulb is handled]It's as if the bulb wasn't screwed in all the way.[otherwise]It's as if the bulb isn't screwed in all the way.[end if][or]Try screwing the bulb in.[or]SCREW BULB IN[line break][stopping]";
	otherwise if the creature is unnamed:
		say "[one of]Now there's light in the cell and the ominous shapes turned out to be a small black monster with a burlap sack.[or]Don't be so rude, make some contact with it![or]TALK TO CREATURE ABOUT any subject.[stopping]";
	otherwise if the skindude multitool is not handled:
		say "[c][one of]I'm offering you a free sample here, don't you think that's important?' [or]Just ASK H.R. FOR THE FREE SAMPLE,' [stopping][the creature] says.";
	otherwise if the skindude multitool is not turned into screwdriver:
		say "[c]Ok, now you have [a skindude multitool]. Have you tried opening it?' [the creature] asks.";
	otherwise if the skindude multitool is useful:
		say "[c][one of]Hurrah, you have a screwdriver! Are there any screws in here?' [or]Maybe in the door?' [or]Or more specifically, in the door's hinges,' [or]You could unscrew the hinges,' [stopping][the creature] says.";
	otherwise if the player carries the skindude multitool:
		say "[c]Are you still carrying that old thing with you? Just give the screwdriver to me and I'll trade it in for something else,' [the creature] advices.";
	otherwise if a tradeable item is within reach or the fish is enclosed by the cell:
		say "[c][one of]I bet there's something here you could trade with me[or]Often after you've used some item you can trade it in[or]Just try giving me anything you carry or what is in the cell[stopping],' [the creature] says.";
	otherwise if the nail scissors are handled and the photograph is intact:
		say "[c][one of]The scissors are useful for something else than clipping your fingernails, too,' [or]You can cut paper with them, for example,' [or]You could cut Captain McBrawn's photograph,' [stopping][the creature] advices.";
	otherwise if the nail scissors are handled and the photograph is cut up and the light bulb is part of the electrical wire:
		say "[c][one of]Notice how the light bulb keeps hitting you on the forehead?' [or]If you just give the bulb a good pull, it shouldn't bother you anymore,' [stopping][the creature] says.";
	otherwise if the nail scissors are handled and the photograph is cut up:
		say "[c][one of]Remember that article that was in the encyclopÃ¦dia?' [or]You could build a searchlight to call help,' [or]Let's see, to build a searchlight you need a casing lined with reflective surface, a light source, and a shaped template,' [or]Light source should be obvious,' [or]The tin foil should do for reflective surface,' [or]Maybe the drinking glass is a good casing?' [or]Put the tin foil and the bulb inside the drinking glass, in this order,' [or]That's a good searchlight, but there's something essential missing,' [or]Attach McBrawn's picture on the searchlight,' [or]Then just point the searchlight out the window,' [stopping][the creature] says.";
	otherwise if the encyclopedia is handled and the encyclopedia is useful:
		say "[c]The obvious action now would be to open [the encyclopedia],' [the creature] deduces.";
	otherwise if the cell encloses the whiskey bottle:
		say "[c][one of]Hmm... So there was a bottle of whiskey in the book?' [or]Maybe there's someone here who enjoys drinking it,' [or]Not [italic type]me[roman type], thanks, but someone else,' [or]Try showing the bottle to the guard,' [or]You can call the guard by knocking on the door,' [stopping][the creature] says.";
	otherwise if the cell encloses the motor oil:
		say "[c][one of]Now that motor oil could come in handy, ' [or]Have you noticed that air vent by the window?' [or]It's a bit too small to crawl through,' [or]The motor oil can be used to make things more slippery, [or]Or to make [italic type]people[roman type] more slippery,' [or]If you were more slippery, maybe you could squeeze through inside the air vent,' [or]REMOVE CLOTHES. RUB OIL ON YOURSELF. ENTER VENT,' [stopping][the creature] says.";
	otherwise if the cell does not enclose the plexiglas:
		say "[c][one of]One classical way of escaping is through the window, ' [or]You would have to get rid of the bars somehow,' [or]Is there a way to maybe corrode them off?' [or]Did I mention my spit is acidic?' [or]You could take some of my spit and pour it on the bars,' [stopping][the creature] says.";
	otherwise if the glue remover is not handled:
		say "[c][one of]There's one more thing you could try to trade with me,' [or]You are, hopefully, wearing them,' [or]Give me your clothes and see what happens,' [stopping][the creature] says.";
	otherwise if the sticker is enclosed by the cell:
		say "[c][one of]So, you have glue remover. Is there anything you could use it on?' [or]Something under the rug?' [or]There's a sticker on the trapdoor,' [or]Maybe the sticker would work someplace else, too?' [or]Pour glue remover on the sticker. Put the sticker on the door. Push the sticker,' [stopping][the creature] says.";
	otherwise:
		say "[c]You're on your own now, buddy!' [the creature] says."


Understand "walkthrough" and "walkthru" as a mistake ( "There's no built-in walkthrough but you can ask for a HINT." ).


Book License

After printing the banner text, say "This game is free software. Type LICENSE for details.[paragraph break]";

Help-license is an action out of world.
Understand "license" and "licence" and "lisense" and "lisence" and "copyright" and "terms" as help-license.

Carry out help-license:
	say "[license]";
	
To say license:
	say "[line break]Copyright (C) 2008 Juhana Leinonen  <[Juhana's email]>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.";




Volume 6 - Debug - Not for release

Use memory economy.


Book Testing commands

[locations of the things, for looking at a glance that everything is in proper place in the cell.]

Understand "locations" and "loc" as debug-locating.

Debug-locating is an action out of world.

Carry out debug-locating:
	repeat with X running through things enclosed by the cell
	begin;
		say "[X]: [internal position of X][line break]";
	end repeat;



Book Commenting

[courtesy of example 391 in chapter 19.6.]

After reading a command (this is the ignore beta-comments rule): 
	if the player's command matches the regular expression "^(\p|\*)": 
		say "(Noted.)"; 
		reject the player's command.



Book Object Response Tests



[including the new verbs defined by the source for the tests.]
This is the escapade specific tests rule:
	let test-target be a random visible thing in the location that is not the noun;
	say "[italic type]reading [the noun]: [roman type]";
	try reading the noun;
	say "[italic type]looking through [the noun]: [roman type]";
	try looking through the noun;
	if the noun is a person:
		say "[italic type]dancing with [the noun]: [roman type]";
		try dancing with the noun;
	say "[italic type]screwing [the noun]: [roman type]";
	try screwing the noun;
	say "[italic type]unscrewing [the noun]: [roman type]";
	try unscrewing the noun;
	say "[italic type]touching [the noun] with [the test-target]: [roman type]";
	try touching the noun with the test-target;
	say "[italic type]rubbing [the noun] on [the test-target]: [roman type]";
	try rubbing the noun on the test-target;
	say "[italic type]pouring [the noun] on [the test-target]: [roman type]";
	try pouring the noun on the test-target;
	say "[italic type]cutting [the test-target] with [the noun]: [roman type]";
	try cutting the test-target with the noun;

Table of analyzing actions (continued)
testing rule
escapade specific tests rule


[these library commands have been removed or redirected, so no point in testing them.]
Procedural rule while object-analyzing:
	ignore the test searching rule;
	ignore the test burning rule;
	ignore the test buying rule;
	ignore the test swinging rule;
	ignore the test pushing to rule;
	ignore the test showing to rule;
	ignore the test waving rule.



