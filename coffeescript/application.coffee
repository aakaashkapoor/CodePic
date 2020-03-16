{app, BrowserWindow} = require('electron')
# BrowserWindow = require('electron')

# function that creates the window
createWindow = () ->

  # creates browser window with properties
  win = new BrowserWindow(
      width: 1500,
      height: 600,
      webPreferences:
        nodeIntegration: true
  )

  # load in the html file here
  win.loadFile 'index.html'

  # open dev DevTools
  win.webContents.openDevTools()

# This method will be called when Electron has finished
# initialization and is ready to create browser windows.
# Some APIs can only be used after this event occurs.
app.whenReady().then createWindow

# Quit when all windows are closed.
app.on 'window-all-closed', () ->
  app.quit() if process.platform != 'darwin'

# On macOS it's common to re-create a window in the app when the
# dock icon is clicked and there are no other windows open.
app.on 'activate', () ->
  createWindow() if BrowserWindow.getAllWindows().length == 0
