# infernoo_weapons
Weapons Menu for Fivem Using NativeUI, ACE Permissions, and WEBHOOK logs for unauthorized access

1. Download infernoo_weapons
2. Download NativeUI (https://github.com/Guad/NativeUI)
3. OPEN `server.lua` configure the discord webhook,
4. OPEN `client.lua` and add weapons.
   - name = (whatever weapon/component name is) "WEAPON_PISTOL"
   - displayName = (what you want displayed in the menu) "Pistol"
5. Add the following to server cfg
   - `ensure inferno_weapons`
   -  Ace Permissions `add_ace group.leo "weaponmenu.spawn allow` use whatever group you want.

Reccomended Resources: I would reccomend using Badgers Discord API and Discord ACE Perms to automatically give members access to the menu without needing to declare them individually in the `server.cfg`
