-- external sounds and outputs

local ext = {}

ext.note_on = function(note_to_play)
  local volts = (note_to_play)/12
  
  -- if sending midi through note_to_play
  -- local volts = (note_to_play-60)/12
  
  crow.output[1].volts = volts
  crow.output[1].execute()
end
return ext
