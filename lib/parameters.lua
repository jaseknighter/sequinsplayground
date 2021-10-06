-- flora params

------------------------------
-- notes and todo lsit
--
-- note: see globals.lua for global variables (e.g. options.OUTPUT, etc.)
--
-- todo list: 
--  add param for scale of random rotation when the random letter ('r') is added to the instruction set
--  figure out why midi cc's mapped to exponential controlspecs don't seem to update exponentially (e.g. rqmin & rqmax)
--  add param for scale_length (currently, adding this parameter results in error messages when scale_length is decreased)
------------------------------

parameters = {}
parameters.add_params = function()
  params:add{type = "option", id = "scale_mode", name = "scale mode",
  options = scale_names, default = 5,
  action = function() fn.build_scale() end}
  
  params:add{type = "number", id = "root_note", name = "root note",
  min = 0, max = 127, default = root_note_default, formatter = function(param) return MusicUtil.note_num_to_name(param:get(), true) end,
  action = function() fn.build_scale() end}

--------------------------------
-- inputs/outputs/midi params
--------------------------------
--[[

-- midi

  params:add_group("midi",12)
  
  params:add_separator("midi in")
  
  midi_in_device = {}
  params:add{type = "number", id = "midi_device", name = "midi in device", min = 1, max = 16, default = 1, 
    action = function(value)
      midi_in_device.event = nil
      midi_in_device = midi.connect(value)
      midi_in_device.event = midi_event
    end
  }
]]

end

return parameters
