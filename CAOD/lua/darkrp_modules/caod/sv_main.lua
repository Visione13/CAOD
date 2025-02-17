/*
Just edit the percentage variable to the value you want.
If you want to use a fixed value on dropped, just use the deathfee variable in DarkRPModification Addon
*/
local percentage = 20 --Percentage that gets dropped
local useCap = true --Enables a max Amount that will be dropped
local cap = 50000 --Sets the max Amount
local deathMessage --You can change the Message down below

function init()
	Msg("----------------------------" .. "\n")
	Msg("[Custom Amount on Drop]" .. "\n")
	Msg("(c) February 2025, Visione" .. "\n")
	Msg("CAOD version: 1.0" .. "\n")
	Msg("----------------------------" .. "\n")
end

function dropMoneyOnDeath(ply, weapon, killer)
	local amount = (math.floor(ply:getDarkRPVar("money")*(percentage/100)))

	if (useCap == true and amount > cap) then
		amount = cap
	end
	if (amount < 0) then
		amount = 0
		ply:setDarkRPVar("money",0)
	end
	if (amount > 0) then
		ply:addMoney(-amount)
		DarkRP.createMoneyBag(ply:GetPos(), amount)
		deathMessage = "You lost " .. amount .. " out of your wallet"
	end
	if (amount == 0) then
		deathMessage = "You lost nothing out of your wallet"
	end
end

hook.Add("PlayerDeath", "Drop money on death", dropMoneyOnDeath)
hook.Add("loadCustomDarkRPItems", "Server console log", init)