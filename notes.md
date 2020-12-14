# Notes

CBM BASIC gets very cryptic very quickly.  

# Variables

## Game constants

* `gr$()`: Graphics data in the form of a 4x1 tile.
* `lv$()`: Level data strings.  See below.
* `ml`: max levels
* `w`: level width in tiles
* `h`: level height in tiles
* `mx`: number of tiles per level, should not exceed 255
* `mu`: max undo tiles

## Rules

* `fnpp(x)`: Function that returns the rule for foreground tile at position `x`.
* `ru%(0..31)`: Property rules for each object.  Two bytes per.
  * where `n` contains a byte of tile data, `r=ru%(nand31)orru%(n/32)` sets `r`
    to the rule bits of both the foreground and background tile, so that any
    interaction works the same regardless of which object is in front.
* `tr%(0..7)`: Transformation rules for each object.
* `dr`: Rule bit of an object being destroyed in a two-rule interaction

## Level state

* `l%`: current level number
* `pf%(0..mx): Playfield tiles.  Even though the compiled version only 
  1 byte per tile, it can allow multiple objects to overlap so that they
  can be tested for interaction.
   * `n=pf%(x) and 31`: set n to foreground tile at position `x`
      * 0 - 7 `(nand24=0)`: Objects
      * 8 - 15 `(nand24=8)`: Noun tiles 
      * 16 - 31 `(nand24>15)`: Property or verb tiles
   * `int(pf%(x)/32)`: Background tile at position `x`
      * It can only be 0 through 7, because the rules cannot be modified
        such that text tiles can overlap.
* `ud%(0..mu,0..2): Undo stack, 3 bytes per tile changed
   * `ud%(dl,0)`: location of changed tile
   * `ud%(dl,1)`: old value of tile
   * `ud%(dl,2)`: turn number when tile changed
* `dl`: next index to store a tile change in `ud%()`
* `ud`: TODO: something to do with the undo stack, kind of like dl?
* `u%(0..mx)`: list of tiles with "YOU" property

# Rule behaviors

Objects 0 through 7 are inert by default.  Objects 1 through 7 may be granted the
following properties through the following bits in the `ru%()` array:

* YOU (`1`): "YOU" tiles will move according to player input.  If no on-screen tiles have
  the "YOU" property, then the player may not influence the level, and generally
  must undo or reset.
   * There are not yet any autonomous movement properties that would allow a level to be
     solved by temporarily relinquishing control.
* WIN (`2`): The player wins the level if the "YOU" tile overlaps a "WIN" tile.
* STOP (`4`): Objects cannot move onto a "STOP" tile.  Any movement operation that
   encounters a "STOP" tile will be aborted.
* PUSH (`8`): If an object attempts to move into a tile with a "PUSH" object, the
   "PUSH" object will attempt to move in the same direction to get out of the way.  
* SHUT (`16`): Behaves the same as a "STOP" tile, except that if an "OPEN" object
   moves onto it, both objects are destroyed.
  * we need to test that this works with a chain of PUSH blocks
* OPEN (`32`): see above
* SINK (`64`): If any object moves onto it, both objects are destroyed.
* LOSE (`128`): If any "YOU" object moves onto it, both objects are destroyed.
* HOT (`256`): Inert except to "MELT" objects
* MELT (`512`): Destroyed if it moves onto a "HOT" tile.
* there are several undefined properties

All text tiles are treated as "PUSH" objects with no other properties.

# Rule definitions on the playfield

TODO

# Level definitions

The `DATA` statements starting around line `9200` contain level data in a compressed
format.  When the player enters a new level, the data string is decompressed as
follows:

* `119`: entire playfield is filled with `0` (empty space)
* `120-135`: variables are initialized
   * `lv$` contains the current level
   * `x` contains the index being read from `lv$` starting at `1`
   * `i` contains the index being written info `pf%()` starting at `0`
* ``140-150`: PETSCII value from `lv$` is read into `t` and parsed.
   * character `191` (CBM-B) seems to indicate that the level data continues into another
     `DATA` statement, so read the next array element into `lv$` and continue.  
     (I doubt it'll work because `l2` gets reset at line `120` which is
     where the `GOTO` statement leads)
   * character `252` (PI) is treated as character `34` (double quotes), to accommodate the
     limitations of BASIC.
   * character `64` to `95` (unshifted letters): store the low 5 bits (`0-31`) to the playfield
   * character `192` to `223` (shifted letters): store the low 5 bits (`0-31`) to the playfield,
     and store the "IS" type to the next tile.
   * character `33` to `47` (punctuation): the next `t-32` tiles are zero. (off by one?)
   * character `49` to `63` (punctuation): repeat the previous tile `t-48` times.

