
# Global text
all_text = ""
shift = false

# Function that takes in a string and changes the text in html
update = (string) ->
  element = document.getElementById("editor_window")
  element.innerHTML = string

# Backspace character removes last char
keyBackspace = () -> all_text = all_text.slice(0, -1)

# Enter character goes to the next line
keyEnter = () -> all_text += '<br>'

# Any alpha numeric character
# change it lowercase if CapsLock is on
keyAlphabet = (keyCode) ->
  character = String.fromCharCode keyCode
  character = character.toLowerCase() if isShift() == true and isCapsLock() == true
  character = character.toUpperCase() if isShift() == true and isCapsLock() == false
  character = character.toLowerCase() if isShift() == false and isCapsLock() == false
  character = character.toUpperCase() if isShift() == false and isCapsLock() == true
  all_text += character

# Key shift is currently pressed
keyShiftDown = () -> shift = true

# Key shift is released
keyShiftUp = () -> shift = false

# Detect if caps lock is active
isCapsLock = () -> return event.getModifierState and event.getModifierState('CapsLock')

# Detect if shift is pressed
isShift = () -> return shift


# Function that detects key releases
document.addEventListener 'keyup', (event) ->

  # catch various key releases
  switch event.keyCode
    when 16 then keyShiftUp()
    else


# Function that detects key presses
document.addEventListener 'keydown', (event) ->

  # for catching various keypresses
  switch event.keyCode
    when 8 then keyBackspace()
    when 13 then keyEnter()
    when 16 then keyShiftDown()
    else keyAlphabet(event.keyCode)
  # appending to the global array


  # making changes to the string
  update all_text
  return
