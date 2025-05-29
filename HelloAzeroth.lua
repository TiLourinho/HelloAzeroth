local frame = CreateFrame("Frame")

frame:RegisterEvent("PLAYER_ENTERING_WORLD")

function frame_OnEvent()
  if event == "PLAYER_ENTERING_WORLD" then
    local name = UnitName("player")
    local race = UnitRace("player")
    local class = UnitClass("player")
    local title = ""

    if class == "Warrior" then
      title = "Bringer of War"
    elseif class == "Mage" then
      title = "Master of the Arcane"
    elseif class == "Druid" then
      title = "Keeper of the Wilds"
    elseif class == "Rogue" then
      title = "Silent Blade"
    elseif class == "Paladin" then
      title = "Light's Champion"
    elseif class == "Hunter" then
      title = "Beastmaster"
    elseif class == "Warlock" then
      title = "Lord of Shadows"
    elseif class == "Priest" then
      title = "Bearer of Hope"
    elseif class == "Shaman" then
      title = "Elemental Conduit"
    end

    local greetings = string.format("%s the %s, %s %s, has returned to Azeroth!", name, title, race, class)
    local warning = "YOU ARE NOT PREPARED!"

    DEFAULT_CHAT_FRAME:AddMessage(greetings, 1.0, 0.5, 0.2)
    DEFAULT_CHAT_FRAME:AddMessage(warning, 0.9, 0, 0)
    
    PlaySoundFile("Interface\\AddOns\\HelloAzeroth\\sounds\\illidan.wav")
  end
end

frame:SetScript("OnEvent", frame_OnEvent)