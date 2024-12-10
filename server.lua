local webhook = "https://discordapp.com/api/webhooks/1315523520171610182/jhw2vb5PKG5piMV4DOqZzGryji6nreNiezFIsxa2OUWJRddsWISGL8ddL9SOqoixcSAr"

-- Function to send a message to Discord
local function sendToDiscord(name, message, color)
    local embeds = {
        {
            ["title"] = message,
            ["type"] = "rich",
            ["color"] = color,
            ["footer"] = {
                ["text"] = "Unauthorized Attempt Log"
            },
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterCommand('weapons', function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "weaponmenu.spawn") then
        TriggerClientEvent('openWeaponMenu', source)
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = {"^1SYSTEM", "You do not have permission to use this command."}
        })

        -- Send log to Discord
        local playerName = GetPlayerName(source)
        sendToDiscord("Unauthorized Attempt", playerName .. " tried to use the weapons command without permission.", 16711680) -- Red color
    end
end, false)
