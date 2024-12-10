_menuPool = NativeUI.CreatePool()
local menuHeader = "Infernoo Weapons"
local mainMenu = NativeUI.CreateMenu(menuHeader, "Select Weapons")
_menuPool:Add(mainMenu)

local weaponList = {
    {
        name = "", -- ex. WEAPON_GLOCK20
        displayName = "", -- ex. GLOCK 20
        components = {
            { name = "" , displayName = "" }
        }
    }
}


local ammoOptions = {50, 100, 150, 200, 250, 300, 350, 400, 450, 500}

local function AddWeaponSubMenu(menu, weapon)
    local submenu = _menuPool:AddSubMenu(menu, weapon.displayName, "Select components and ammo")

    -- Add Spawn Button
    local spawnItem = NativeUI.CreateItem("Spawn " .. weapon.displayName, "Spawn this weapon")
    submenu:AddItem(spawnItem)
    spawnItem.Activated = function(sender, item)
        GiveWeaponToPed(PlayerPedId(), GetHashKey(weapon.name), 100, false, false)
    end

    -- Add Despawn Button
    local despawnItem = NativeUI.CreateItem("Despawn " .. weapon.displayName, "Despawn this weapon")
    submenu:AddItem(despawnItem)
    despawnItem.Activated = function(sender, item)
        RemoveWeaponFromPed(PlayerPedId(), GetHashKey(weapon.name))
    end

    for _, component in ipairs(weapon.components) do
        local item = NativeUI.CreateItem(component.displayName, "Toggle this component")
        submenu:AddItem(item)
        item.Activated = function(sender, item)
            local ped = PlayerPedId()
            local weaponHash = GetHashKey(weapon.name)
            local componentHash = GetHashKey(component.name)

            if HasPedGotWeaponComponent(ped, weaponHash, componentHash) then
                RemoveWeaponComponentFromPed(ped, weaponHash, componentHash)
            else
                GiveWeaponComponentToPed(ped, weaponHash, componentHash)
            end
        end
    end

    local ammoSelector = NativeUI.CreateListItem("Select Ammo", ammoOptions, 1, "Choose Ammo Amount")
    submenu:AddItem(ammoSelector)
    submenu.OnListSelect = function(sender, item, index)
        if item == ammoSelector then
            local ammoAmount = ammoOptions[index]
            AddAmmoToPed(PlayerPedId(), GetHashKey(weapon.name), ammoAmount)
        end
    end
end

for _, weaponData in ipairs(weaponList) do
    AddWeaponSubMenu(mainMenu, weaponData)
end

-- Add Remove All Weapons button to main menu 
local removeAllWeaponsItem = NativeUI.CreateItem("Remove All Weapons", "Remove all weapons from your character") 
mainMenu:AddItem(removeAllWeaponsItem) 
removeAllWeaponsItem.Activated = function(sender, item) 
    RemoveAllPedWeapons(PlayerPedId(), true) 
end

_menuPool:ControlDisablingEnabled(false)
_menuPool:MouseControlsEnabled(false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
    end
end)

RegisterNetEvent('openWeaponMenu')
AddEventHandler('openWeaponMenu', function()
    mainMenu:Visible(true)
end)

RegisterCommand('openWeaponMenu', function()
    TriggerEvent('openWeaponMenu')
end, false)

RegisterKeyMapping('openWeaponMenu', 'Open Weapon Menu', 'keyboard', 'F5') -- Default keybind is F5


