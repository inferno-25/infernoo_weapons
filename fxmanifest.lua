fx_version 'cerulean'
game 'gta5'

author '@infernoo_25'
description 'inferno_weaponmenu'
version '1.0.0'

lua54 'yes' -- Enable Lua 5.4

shared_script 'config.lua' -- Load the shared configuration

client_scripts {
    '@NativeUI/NativeUI.lua',
    'client.lua'
}

server_scripts {
    'server.lua'
}
