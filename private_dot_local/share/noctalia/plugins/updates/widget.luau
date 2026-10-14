-- Pending updates: official repos (checkupdates, pacman-contrib) plus AUR (paru -Qua).
-- Shows the total next to the glyph, nothing when up to date. Right click re-checks.
local INTERVAL_MS = 30 * 60 * 1000
local running = false

local function refresh()
  if running then
    return
  end
  running = true
  noctalia.runAsync("echo $(checkupdates 2>/dev/null | wc -l) $(paru -Qua 2>/dev/null | wc -l)", function(result)
    running = false
    local repo, aur = tostring(result.stdout):match("(%d+)%s+(%d+)")
    if not repo then
      return
    end
    repo, aur = tonumber(repo), tonumber(aur)
    local total = repo + aur
    barWidget.setGlyph("refresh")
    barWidget.setText(total > 0 and tostring(total) or "")
    barWidget.setTooltip(string.format("%d repo, %d AUR updates", repo, aur))
  end)
end

function update()
  noctalia.setUpdateInterval(INTERVAL_MS)
  refresh()
end

function onRightClick()
  refresh()
end
