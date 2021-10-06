--------------------------
-- instructions: 
-- part 1: make crow squak
--        connect a crow to a norns
--        connect an oscillator to crow output 1
--        connect a vca to crow output 2
--        on norns, to goto `parameters>edit>clock` and set `crow out` to *output 2*
--        run the *sequinsplayground` script in maiden
--        in the maiden repl bottom prompt, type `externals.note_on(1)`
--          this should make crow send 1v from crow output 1
--            note: the `note_on` function is defined in the *externals.lua* file
--        play around with passing other numbers to the `externals.note_on` function
--
--  part 2: make crow sing
--        look for the commented code in the code block labeled *part 2* below
--        uncomment the part 2 code (i.e. remove the `--` marks)
--        run the *sequinsplayground` script in maiden
--        play with changing the incremental value in the line `index = index + 1`
--        play with changing when the `index` goes back to 0 
--
--  part 3: make crow sing with sequins
--        re-comment the code in the code block labeled *part 2* below
--        uncomment the code in the code block labeled *part 3* below
--        run the *sequinsplayground` script in maiden
--        in the maiden repl bottom command prompt, type `playground.seq = s{1,3,9}`
--        play around with setting other sequence values
--        review the sequins doc on [monome.org](https://monome.org/docs/crow/reference/#sequins) and try other features, like:
--          sequins within sequins
--          change the 'step' that occurs on each call
--          play with 'flow modifiers'
--          play with other features

--------------------------

s = require('sequins')


local playground = {}

function playground.get_control_label()
  return "sequins playground"
end

function playground.init()
  clock.run(playground.update_notes)

  playground.active_note = 0
  
end


-- local index = 0
function playground.update_notes()
  while true do
    clock.sync(1/4)

    -------------part 2-----------
    -- if index == nil then index = 0 end
    -- index = index + 1
    -- externals.note_on(index)
    -- if index == 20 then index = 0 end
    ------------------------------

    
    -------------part 3-----------
    -- if playground.seq == nil then
    --    playground.seq = s{1,2,3,4,5,6,7,8,9}
    -- end

    -- playground.active_note = playground.seq()
    -- externals.note_on(playground.active_note)
    ------------------------------
    
  end
end

function playground.redraw()
  -- draw the ui here
  screen.move(10,25)
  screen.level(15)
  screen.text("note " .. playground.active_note)
  screen.update()
end

return playground