if Config.WebhookEnabled then
    local function sendToDiscord(name, message, color)
        local embeds = {
            {
                ["title"] = message,
                ["type"] = "rich",
                ["color"] = color,
                ["footer"] = {
                    ["text"] = "Test Log"
                },
            }
        }

        PerformHttpRequest(Config.WebhookURL, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end
end

RegisterCommand('weapons', function(source, args, rawCommand)
    local hasPermission = not Config.ACEPermissionEnabled or IsPlayerAceAllowed(source, "weaponmenu.spawn")

    if hasPermission then
        TriggerClientEvent('openWeaponMenu', source)
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = {"^1SYSTEM", "You do not have permission to use this command."}
        })

        if Config.WebhookEnabled then
            -- Send log to Discord
            local playerName = GetPlayerName(source)
            sendToDiscord("Unauthorized Attempt", playerName .. " tried to use the weapons command without permission.", 16711680) -- Red color
        end
    end
end, false)

RegisterCommand('testWebhook', function(source, args, rawCommand)
    if Config.WebhookEnabled then
        sendToDiscord("Webhook Test", "This is a test message to ensure the webhook is working correctly.", 65280) -- Green color
        TriggerClientEvent('chat:addMessage', source, {
            args = {"^2SYSTEM", "Test message sent to Discord webhook."}
        })
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = {"^1SYSTEM", "Webhook is disabled in the config."}
        })
    end
end, false)
