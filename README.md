# sequinsplayground
 
## installation
type on the maiden repl command line: `;install https://github.com/jaseknighter/sequinsplayground

## instructions
open the *playground.lua* file. the code changes in *part 2* and *part 3* below reference this file.

part 1: make crow squak
* connect a crow to a norns
* connect an oscillator to crow output 1
* connect a vca to crow output 2
* on norns, to goto `parameters>edit>clock` and set `crow out` to *output 2*
* run the *sequins_playground` script in maiden
* in the maiden repl bottom prompt, type `externals.note_on(1)`
  * this should make crow send 1v from crow output 1
    * note: the `note_on` function is defined in the *externals.lua* file
* play around with passing other numbers to the `externals.note_on` function

 part 2: make crow sing
* look for the commented code in the code block labeled *part 2* below
* uncomment the part 2 code (i.e. remove the `--` marks)
* run the *sequins_playground` script in maiden
* play with changing the incremental value in the line `index = index + 1`
* play with changing when the `index` goes back to 0 

 part 3: make crow sing with sequins
* re-comment the code in the code block labeled *part 2* 
* uncomment the code in the code block labeled *part 3* 
* run the *sequins_playground` script in maiden
* in the maiden repl bottom command prompt, type `playground.seq = s{1,3,9}`
* play around with setting other sequence values
* review the sequins doc on [monome.org](https://monome.org/docs/crow/reference/#sequins) and try other features, like:
  * sequins within sequins
  * change the 'step' that occurs on each call
  * play with 'flow modifiers'