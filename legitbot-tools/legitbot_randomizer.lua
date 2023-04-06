--https://github.com/Duchy12/gamesense-legit-tools

local menuTable = {
    "Speed",
    "Speed (in attack)",
    "Reaction time",
    "Maximum FOV"
}
local multiSelect = ui.new_multiselect("Legit", "Aimbot", "Randomize", menuTable)
local minFOV = ui.new_slider("Legit", "Aimbot", "Min FOV", 0, 900, 10, true, "°", 0.1)
local maxFOV = ui.new_slider("Legit", "Aimbot", "Max FOV", 0, 900, 10, true, "°", 0.1)
local minSpeed = ui.new_slider("Legit", "Aimbot", "Min Speed", 0, 700, 10, true, "", 0.01)
local maxSpeed = ui.new_slider("Legit", "Aimbot", "Max Speed", 0, 700, 10, true, "", 0.01)
local minAttackSpeed = ui.new_slider("Legit", "Aimbot", "Min Speed (in attack)", 0, 700, 10, true, "", 0.01)
local maxAttackSpeed = ui.new_slider("Legit", "Aimbot", "Max Speed (in attack)", 0, 700, 10, true, "", 0.01)
local minReaction = ui.new_slider("Legit", "Aimbot", "Min Reaction", 0, 200, 10, true, "ms", 1)
local maxReaction = ui.new_slider("Legit", "Aimbot", "Max Reaction", 0, 200, 10, true, "ms", 1)


client.set_event_callback("weapon_fire", function(e)
    if client.userid_to_entindex(e.userid) == entity.get_local_player() then
            for i = 1, #menuTable do
                if ui.get(multiSelect)[i] then
                    local quickRef = ui.reference("Legit", "Aimbot", menuTable[i])
                    local value = 0
                    if menuTable[i] == "Speed" then
                        value = client.random_int(ui.get(minSpeed), ui.get(maxSpeed))
                    elseif menuTable[i] == "Speed (in attack)" then
                        value = client.random_int(ui.get(minAttackSpeed), ui.get(maxAttackSpeed))
                    elseif menuTable[i] == "Reaction time" then
                        value = client.random_int(ui.get(minReaction), ui.get(maxReaction))
                    elseif menuTable[i] == "Maximum FOV" then
                        value = client.random_int(ui.get(minFOV), ui.get(maxFOV))
                    end
                    ui.set(quickRef, value)
                end
            end
        end
end)