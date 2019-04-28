# BABA IS C64

## by Nick Bensema

In March 2019, Arvi "Hempuli" Teikari released a puzzle game called Baba Is You for PC, Mac, and Nintendo Switch. It's a game where you solve puzzles by pushing tiles around, some of which change the rules of the game and the properties of objects. Description doesn't do it justice; watch the [trailer on YouTube](https://www.youtube.com/watch?v=U7MJljsoUSo "Baba Is You release trailer").

I loved the concept, and I loved the game, but somehow instead of having the itch to play it, I got the itch to copy it, using Commodore 64 BASIC.

I got farther than I expected.

The game runs, and responds to cursor commands, but is too slow to
actually play unless it is compiled.  When it is compiled with 
Basic-BOSS, it is playable, but I haven't copied any good levels 
into it yet.

## Supported features

* Eight object tiles: empty, Baba, rock, wall, flag, water, key, door
* Sixteen word tiles: all objects, properties, and "IS"
* Seven properties: YOU, WIN, STOP, PUSH, SHUT, OPEN, SINK, LOSE
* Screen parser understands
  * both horizontal and vertical sentences
  * NOUN IS NOUN
  * NOUN IS PROPERTY
* Cursor keys control any number of YOU tiles
* A tile may contain both a foreground object and a background object.
  (Text can only be a foreground object.)
* Win condition is YOU tile overlaps a WIN tile.
* Moving objects are stopped by STOP tiles
* PUSH tiles attempt to move in the same direction when moved upon.
* OPEN tiles combine with SHUT tiles to form an empty tile.
* SINK tiles combine with any other tile to form an mepty tile.
* MELT tiles are destroyed when combined with a HOT tile, which remains.
* Undo with "Z"
* Reset with "R"
* Level skip with "N"
* Poke into the level with "P"
* Edit the level graphically with "E"
* Dump current level into DATA statement with "D"
* Very trivial levels that are very hard to edit.

