# Infernoo Weapons Menu

**A customizable weapon menu for FiveM, allowing players to spawn weapons, manage components, and select ammo.**

## Features
- **Weapon Selection:** Easily select and spawn a variety of weapons.
- **Component Selection:** Customize your weapons with a range of components such as flashlights, suppressors, extended clips, and scopes.
- **Ammo Selection:** Choose from multiple ammunition options.
- **Remove All Weapons:** Instantly clear all weapons from your character with a single click.
- **Key Bindings:** Default key binding set to F5, customizable to suit your preferences.
- **Permissions Management:** Control access with ACE permissions, ensuring only authorized players can use the menu.
- **Discord Webhook Integration:** Keep track of unauthorized access attempts with real-time notifications to your Discord server.
- **Configurable Options:** Easily enable or disable features through the `config.lua` file.

## Installation
1. **Download the Script:** Get the latest version from our Tebex store.
2. **Place in Resources Folder:** Drop the script into your server’s resources folder.
3. **Add to Server Config:** Add `start infernoo_weaponmenu` to your server config file.

## Configuration
Edit the `config.lua` file to configure the following settings:
- **Webhook Settings:**
  - `Config.WebhookEnabled` (true/false) - Enable or disable the Discord webhook.
  - `Config.WebhookURL` - Set the URL for the Discord webhook.
- **ACE Permissions:**
  - `Config.ACEPermissionEnabled` (true/false) - Enable or disable ACE permissions.

## Usage
- **Open Menu:** Press the default key (F5) or use the `/openWeaponMenu` command to access the menu.
- **Spawn Weapon:** Select your weapon of choice from the menu.
- **Despawn Weapon:** Remove selected weapons with a simple click.
- **Select Components:** Customize your weapons with available components.
- **Choose Ammo:** Select the desired amount of ammunition.
- **Remove All Weapons:** Clear your arsenal with the Remove All Weapons button.

## Commands
- **/openWeaponMenu:** Opens the weapon menu.
- **/testWebhook:** Sends a test message to your configured Discord webhook to ensure it's working correctly.
