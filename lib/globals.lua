-- global functions and variables 

-------------------------------------------
-- global functions
-------------------------------------------

page_scroll = function (delta)
  pages:set_index_delta(util.clamp(delta, -1, 1), false)
end

------------------------------
-- global functions
------------------------------

-- here's a version that handles recursive tables here:
--  http://lua-users.org/wiki/CopyTable
fn = {}
function fn.deep_copy(orig, copies)
  copies = copies or {}
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
      if copies[orig] then
          copy = copies[orig]
      else
          copy = {}
          copies[orig] = copy
          for orig_key, orig_value in next, orig, nil do
              copy[fn.deep_copy(orig_key, copies)] = fn.deep_copy(orig_value, copies)
          end
          setmetatable(copy, fn.deep_copy(getmetatable(orig), copies))
      end
  else -- number, string, boolean, etc
      copy = orig
  end
  return copy
end


-- scale/note functions
scale_length = 35 --128
root_note_default = 33 --(A0)
note_center_frequency_default = 43 --45
scale_names = {}
notes = {}
current_note_indices = {}

for i= 1, #MusicUtil.SCALES do
  table.insert(scale_names, string.lower(MusicUtil.SCALES[i].name))
end

fn.build_scale = function()
  notes = {}
  notes = MusicUtil.generate_scale_of_length(params:get("root_note"), params:get("scale_mode"), scale_length)
  local num_to_add = scale_length - #notes
  for i = 1, num_to_add do
    table.insert(notes, notes[scale_length - num_to_add])
  end
  -- engine.update_scale(table.unpack(notes))
end

fn.set_scale_length = function()
  scale_length = params:get("scale_length")
end

fn.get_num_notes_per_octave = function()
  local num_notes_per_octave
  local starting_note = notes[1]
  for i=2,#notes,1 do
    if notes[i]-starting_note < 12 then
      -- do nothing
    else
      return i-1
    end
  end

end

-------------------------------------------
-- global variables
-------------------------------------------
screen_dirty = true
updating_controls = false
SCREEN_FRAMERATE = 1/15
menu_status = false
pages = 0

alt_key_active = false
screen_level_graphics = 15
screen_size = {x=127,y=64}

num_pages = 1

initializing = true


