local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

local classTitles = {
  Warrior = {
    "Bringer of War",
    "The Iron Wall",
    "Titanbreaker",
    "Unrelenting Fury",
    "Bane of a Thousand Foes"
  },
  Mage = {
    "Pyromancer Prime",
    "Master of the Frozen Veil",
    "The Arcanist",
    "Spellstorm Herald",
    "Weaver of Realities"
  },
  Druid = {
    "Keeper of the Wilds",
    "Aspect of Nature",
    "Mooncaller",
    "The Shifting One",
    "Warden of Balance"
  },
  Rogue = {
    "Silent Blade",
    "Shadowstepper",
    "Poisoned Whisper",
    "Backstabber Supreme",
    "Ghost in the Fog"
  },
  Paladin = {
    "Light's Champion",
    "The Divine Hammer",
    "Holy Crusader",
    "Avenger of Justice",
    "Beacon of Faith"
  },
  Hunter = {
    "Beastmaster",
    "Arrow of Fate",
    "Tracker of the Wild",
    "The Lone Wolf",
    "Hawk's Eye"
  },
  Warlock = {
    "Lord of Shadows",
    "Demon Binder",
    "Soul Harvester",
    "Master of the Void",
    "Whisperer of Doom"
  },
  Priest = {
    "Bearer of Hope",
    "Lightbringer",
    "Faithweaver",
    "Soul Healer",
    "Voice of the Naaru"
  },
  Shaman = {
    "Elemental Conduit",
    "Stormcaller",
    "Earthspeaker",
    "Totem Guardian",
    "Spirit Walker"
  }
}

local phrasesByClass = {
  Warrior = {
    "lets steel clash in %s.",
    "brings war to the gates of %s.",
    "stands unbroken in %s.",
    "grips their blade tighter in %s.",
    "defies fate itself in %s."
  },
  Mage = {
    "weaves arcane threads across %s.",
    "lets fire and frost dance through %s.",
    "contemplates the mysteries of %s.",
    "shapes reality itself in %s.",
    "channels the ley lines of %s."
  },
  Druid = {
    "feels the whisper of leaves in %s.",
    "walks the dream even while in %s.",
    "becomes one with the wilds of %s.",
    "guides the cycle of life in %s.",
    "heeds the call of nature in %s."
  },
  Rogue = {
    "moves unseen through %s.",
    "leaves no trace in %s.",
    "waits for the perfect strike in %s.",
    "vanishes into the shadows of %s.",
    "knows every alley and corner of %s."
  },
  Paladin = {
    "brings justice to %s.",
    "shines light into %s.",
    "protects the weak in %s.",
    "carries the will of the Light in %s.",
    "stands vigilant in %s."
  },
  Hunter = {
    "hunts silently through %s.",
    "tracks prey across %s.",
    "blends with the wilds of %s.",
    "scans the horizon of %s.",
    "lets arrows fly over %s."
  },
  Warlock = {
    "unleashes chaos upon %s.",
    "whispers dark truths in %s.",
    "binds demonic forces beneath %s.",
    "twists the shadows of %s.",
    "draws power from forgotten horrors in %s."
  },
  Priest = {
    "brings light to the shadows of %s.",
    "offers hope in the midst of %s.",
    "hears divine whispers in %s.",
    "blesses the weary in %s.",
    "stands between death and salvation in %s."
  },
  Shaman = {
    "calls the storm in %s.",
    "walks between worlds in %s.",
    "channels the elements through %s.",
    "hears the earth’s cry in %s.",
    "balances chaos and order in %s."
  }
}

local bosses = {
  Ragnaros = {
    quote = "Ragnaros: 'By fire be purged!'",
    sound = "Interface\\AddOns\\HelloAzeroth\\sounds\\ragnaros.wav",
  },
  Executus = {
    quote = "Majordomo Executus: 'Ashes to ashes'",
    sound = "Interface\\AddOns\\HelloAzeroth\\sounds\\executus.wav",
  },
  Nefarian = {
    quote = "Nefarian: 'Worthless wretch! Your friends will join you soon enough!'",
    sound = "Interface\\AddOns\\HelloAzeroth\\sounds\\nefarian.wav",
  },
  Vaelastrasz = {
    quote = "Vaelastrasz: 'Forgive me, friend! Your death only adds to my failure!'",
    sound = "Interface\\AddOns\\HelloAzeroth\\sounds\\vaelastrasz.wav",
  },
  Loatheb = {
    quote = "Loatheb: 'Close your eyes... Sleep!'",
    sound = "Interface\\AddOns\\HelloAzeroth\\sounds\\loatheb.wav",
  },
  Thadius = {
    quote = "Thadius: 'You die now!'",
    sound = "Interface\\AddOns\\HelloAzeroth\\sounds\\thadius.wav",
  },
  KelThuzad1 = {
    quote = "Kel'Thuzad: 'The dark void awaits you!'",
    sound = "Interface\\AddOns\\HelloAzeroth\\sounds\\kelthuzad-01.wav",
  },
  KelThuzad2 = {
    quote = "Kel'Thuzad: 'MUAHAHA... MUAHAHAHAHAHAHAHAHAHAHAHA'",
    sound = "Interface\\AddOns\\HelloAzeroth\\sounds\\kelthuzad-02.wav",
  },
  Illidan = {
    quote = "Illidan: 'You are not prepared!'",
    sound = "Interface\\AddOns\\HelloAzeroth\\sounds\\illidan.wav",
  },
  LichKing = {
    quote = "The Lich King: 'All life must end!'",
    sound = "Interface\\AddOns\\HelloAzeroth\\sounds\\lichking.wav",
  }
}

local function TableLength(tbl)
  local count = 0

  for _ in pairs(tbl) do
    count = count + 1
  end

  return count
end

local function GetRandomBossQuote()
  local keys = {}

  for k in pairs(bosses) do
    table.insert(keys, k)
  end

  local keysCount = TableLength(keys)
  local selectedKey = keys[math.random(1, keysCount)]

  return bosses[selectedKey]
end

local function sayHello()
  local name = UnitName("player")
  local class = UnitClass("player")
  local zone = GetMinimapZoneText() or GetRealZoneText()

  local titles = classTitles[class] or {}
  local titlesCount = TableLength(titles)
  local title = titles[math.random(1, titlesCount)] or "Wanderer"

  local phraseList = phrasesByClass[class] or {"moves through %s."}
  local phrasesCount = TableLength(phraseList)
  local selectedPhrase = phraseList[math.random(1, phrasesCount)]
  local phrase = string.format(selectedPhrase, zone);

  local greetings = string.format("%s, %s, %s", name, title, phrase)
  local warning = GetRandomBossQuote()

  DEFAULT_CHAT_FRAME:AddMessage(greetings, 1.0, 0.5, 0.2)
  DEFAULT_CHAT_FRAME:AddMessage(warning.quote, 0.9, 0, 0)
  
  PlaySoundFile(warning.sound)
end

function sayHelloOnEvent()
  if event == "PLAYER_ENTERING_WORLD" then
    sayHello()
  end
end

frame:SetScript("OnEvent", sayHelloOnEvent)

SLASH_HELLOAZEROTH1 = "/ha"
SlashCmdList["HELLOAZEROTH"] = sayHello