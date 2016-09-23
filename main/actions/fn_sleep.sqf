sleepMarker = (_this select 0);
playerBackpack = backpack player;
playerBackpackMagazines = getMagazineCargo (unitBackpack player);
playerBackpackItems = getItemCargo (unitBackpack player);

[player,"PRONE_INJURED","ASIS", sleepMarker] call BIS_fnc_ambientAnim;

cutText ["","BLACK OUT"];
sleep 1;
skipTime 6;
saveGame;
sleep 1;
cutText ["","BLACK IN"];	
player setDamage 0;
player call BIS_fnc_ambientAnim__terminate;

player addBackpack (playerBackpack); 
i = 0;
magazineName = playerBackpackMagazines select 0;
magazineAmount = playerBackpackMagazines select 1;
{
 (unitBackpack player) addMagazineCargo [(magazineName select i), (magazineAmount select i)];
 i = i + 1;
} forEach magazineName;

i = 0;
itemName = playerBackpackItems select 0;
itemAmount = playerBackpackItems select 1;
{
 (unitBackpack player) addItemCargo [(itemName select i), (itemAmount select i)];
 i = i + 1;
} forEach itemName;