--- === Strawberry ===
---
--- Strawberry (a tiny Pomodoro) -- a Pomodoro Timer for the menubar
---
--- Download: [https://github.com/SaahilParikh/Strawberry](https://github.com/SaahilParikh/Strawberry)
--- Forked from: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/Strawberry.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/Strawberry.spoon.zip)
---

local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Strawberry"
obj.version = "0.2"
obj.author = "Saahil Parikh <saahil@doesnotexist.com>, Daniel Marques <danielbmarques@gmail.com> and Omar El-Domeiri <omar@doesnotexist.com>"
obj.license = "MIT"
obj.homepage = "https://github.com/SaahilParikh/Strawberry"

-- Settings

-- timer default duration in minutes
obj.workDuration = 25
obj.shortBreakDuration = 5
obj.longBreakDuration = 15

-- set this to true to always show the menubar item
obj.alwaysShow = true

-- duration in seconds for alert to stay on screen
-- set to 0 to turn off alert completely
obj.alertDuration = 5

-- Font size for alert
obj.alertTextSize = 80

-- set to nil to turn off notification when time's up or provide a hs.notify notification
obj.notification = nil
-- obj.notification = hs.notify.new({ title = "Done! 🍓", withdrawAfter = 0})

-- set to nil to turn off notification sound when time's up or provide a hs.sound
obj.sound = nil
-- obj.sound = hs.sound.getByFile("System/Library/PrivateFrameworks/ScreenReader.framework/Versions/A/Resources/Sounds")

obj.defaultMapping = {
  start = {{"cmd", "ctrl", "alt"}, "C"}
}

BREAK_TIME = "Break Time!"
FIVE_MORE_MINUTES = "Five More Minutes"
START_WORK = "Start Work"

LOGO = "🍓"

WORK = "Work"
BREAK = "Break"
DEFAULT_MEETING_MODE_TIME = tostring(60)

obj.isWorkTask = true

--- Strawberry:bindHotkeys(mapping)
--- Method
--- Binds hotkeys for Strawberry
---
--- Parameters:
---  * mapping - A table containing hotkey details for the following items:
---   * start - start the pomodoro timer (Default: cmd-ctrl-alt-C)
function obj:bindHotkeys(mapping)
  if (self.hotkey) then
     self.hotkey.delete()
  end

  if mapping and mapping["start"] then
    hs.hotkey.bind(mapping["start"][1], mapping["start"][2], function() self:start() end)
  else
    hs.hotkey.bind(self.defaultMapping["start"][1], self.defaultMapping["start"][2], function() self:start() end)
  end
end

function obj:setWorkDuration(duration)
  self.workDuration = duration
end

function obj:setShortBreakDuration(duration)
  self.shortBreakDuration = duration
end

function obj:setLongBreakDuration(duration)
  self.longBreakDuration = duration
end

function obj:init()
  import = hs.spoons.use("CountDown")
  self.menu = hs.menubar.new(self.alwaysShow)
  self.numShortBreak = 0
  self:reset()
end

function obj:reset()
  local items = {
    { title = "Start", fn = function() self:workTimer(self.workDuration) end },
    { title = "Short Break (5 min)", fn = function() self:breakTimer(self.shortBreakDuration) end },
    { title = "Long Break (15 min)", fn = function() self:breakTimer(self.longBreakDuration) end },
    { title = "Meeting Mode", fn = function() self:MeetingMode() end }
  }
  self.timeLeft = 0
  self.menu:setMenu(items)
  self.menu:setTitle(LOGO)
  self.timerRunning = false
  spoon.CountDown:setProgress(1.0)

  hs.alert.closeSpecific(self.breakAlertUUID, 2)
  if not self.alwaysShow then
      self.menu:removeFromMenuBar()
  end
end

function obj:updateTimerString()
    local minutes = math.floor(self.timeLeft / 60)
    local seconds = self.timeLeft - (minutes * 60)
    local timerString = string.format("%02d:%02d %s", minutes, seconds, LOGO)
    self.menu:setTitle(timerString)
end

--- Strawberry:complete()
--- Method
--- Popup an alert or notification when time is up.
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function obj:complete()
  self.timerRunning = false
  self.timer:stop()
  if 0 < self.alertDuration then
    if self.notification then
      self.notification:send()
    end
    if self.sound then
      self.sound:play()
    end
    if self.isWorkTask then
      choice = hs.dialog.blockAlert("Done!", "Time to take a break! 😀🤠", FIVE_MORE_MINUTES, BREAK_TIME, "Warning")
      if choice == FIVE_MORE_MINUTES then
        self:workTimer(5)
      else
        self:takeNextBreak()
      end
    else
      choice = hs.dialog.blockAlert("Time to get back to work!", ":)", FIVE_MORE_MINUTES, START_WORK, "Warning")
      if choice == START_WORK then
        self:workTimer(self.workDuration)
      else
        self:breakTimer(5)
      end
    end
  end
end

function obj:tick()
  self.timeLeft = self.timeLeft - 1
  self:updateTimerString()
  if self.timeLeft <= 0 then
    self:reset()
    self:complete()
  end
end

function obj:workTimer(duration)
  self.isWorkTask = true
  self:start(duration)
end

function obj:breakTimer(duration)
  self.isWorkTask = false
  self:start(duration)
end

function obj:takeNextBreak()
  if self.numShortBreak == 4 then
    self.numShortBreak = 0
    self:breakTimer(self.longBreakDuration)
  else
    self.numShortBreak = self.numShortBreak + 1
    self:breakTimer(self.shortBreakDuration)
  end
end

--- Strawberry:start()
--- Method
--- Starts the timer and displays the countdown in a menubar item
---
--- Parameters:
---  * resume - boolean when true resumes countdown at current value of self.timeLeft
---
--- Returns:
---  * None
function obj:start(duration)
  if not self.menu:isInMenuBar() then
    self.menu:returnToMenuBar()
  end
  if self.timeLeft <= 0 then
    if duration then
      self.timeLeft = duration * 60
      self:updateTimerString()
    end
    spoon.CountDown:startFor(self.timeLeft / 60)
  else
    spoon.CountDown:pauseOrResume()
  end
  if not self.isWorkTask then
    self.breakAlertUUID = hs.alert.show("It's break time :)", { textSize = self.alertTextSize }, self.timeLeft * 60)
  end
  self.timerRunning = true
  self.timer = hs.timer.doWhile(function() return self.timerRunning end, function() self:tick() end, 1)
  local items = {
    { title = "Stop",  fn = function() self:reset() end },
    { title = "Pause", fn = function() self:pause() end },
    { title = "End Early", fn = function() self:early() end },
    { title = "Meeting Mode", fn = function() self:MeetingMode() end }

  }
  self.menu:setMenu(items)
end

function obj:early()
  self.timeLeft = 0
  self:tick()
end


function obj:pause()
  self.timerRunning = false
  spoon.CountDown:pauseOrResume()
  hs.alert.closeSpecific(self.breakAlertUUID, 1)
  local items = {
    { title = "Stop", fn = function() self:reset() end },
    { title = "Resume", fn = function() self:start() end },
    { title = "End Early", fn = function() self:early() end }
  }
  self.menu:setMenu(items)
end

function obj:MeetingMode()
  print("[Strawberry][INFO] Enter MeetingMode()")
  self:reset()
  button, text = hs.dialog.textPrompt("Time for a meeting!", "How long should we run the arbitrary timer for? (input a number)", DEFAULT_MEETING_MODE_TIME, WORK, BREAK)
  self.isWorkTask = button == WORK and true or false
  
  new_timer_len = tonumber(text)

  if not new_timer_len then
    print(string.format("[Strawberry][ERROR] Could not parse %s to number. Button %s was clicked.", text, button))
    self:start(self.workDuration)
  else
    self:start(new_timer_len)
  end
end

return obj


