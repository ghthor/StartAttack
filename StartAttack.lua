SLASH_FINDATTACK1 = "/findattack"
SLASH_STARTATTACK1 = "/startattack"
SLASH_STOPATTACK1 = "/stopattack"

local scantip = CreateFrame("GameTooltip", "scantip", nil, "GameTooltipTemplate")
scantip:SetOwner(WorldFrame, "ANCHOR_NONE")

local AtkSpell

local function print(text, name, r, g, b, frame, delay)
	if not text or string.len(text) == 0 then
		text = " "
	end
	if not name or name == AceConsole then
		(frame or DEFAULT_CHAT_FRAME):AddMessage(text, r, g, b, nil, delay or 5)
	else
		(frame or DEFAULT_CHAT_FRAME):AddMessage("|cffffff78" .. tostring(name) .. ":|r " .. text, r, g, b, nil, delay or 5)
	end
end

local function findAttackSpell()
	for AtkSlot = 12,72 do
		if IsAttackAction(AtkSlot) then
			AtkSpell = AtkSlot
		end
	end
end

function SlashCmdList.FINDATTACK(msg, editbox)
	-- TODO: Run this when the character loads
	findAttackSpell()
	if AtkSpell == nil then
		print("Attack skill not found")
	else
		print("found Attack skill at ".. tostring(AtkSpell))
	end
end

function SlashCmdList.STARTATTACK(msg, editbox)
	if not IsCurrentAction(AtkSpell) then
		UseAction(AtkSpell)
	end
end

function SlashCmdList.STOPATTACK(msg, editbox)
	if IsCurrentAction(AtkSpell) then
		UseAction(AtkSpell)
	end
end

