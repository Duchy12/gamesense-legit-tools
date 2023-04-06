local screenX, screenY = client.screen_size()
local maxFovRef = ui.reference('LEGIT', 'Aimbot', 'Maximum FOV')
local circleCheckBox = ui.new_checkbox('LEGIT', 'Other', 'FOV Circle')
local circleColor = ui.new_color_picker('LEGIT', 'Other', 'FOV Circle', 255, 255, 255, 255)

local function drawFovCircle()
    local r, g, b, a = ui.get(circleColor)
    if ui.get(circleCheckBox) == true then
        renderer.circle_outline(screenX / 2, screenY / 2, r, g, b, a, ui.get(maxFovRef), 1, 1, 1)
    end
end
client.set_event_callback('paint', drawFovCircle)