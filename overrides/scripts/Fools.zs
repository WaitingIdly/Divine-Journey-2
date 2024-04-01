# Author: WaitingIdly
import crafttweaker.event.PlayerLoggedInEvent;


mods.jei.JEI.hideCategory("minecraft.crafting");
mods.jei.JEI.hideCategory("ie.cokeoven");
mods.jei.JEI.hideCategory("ie.alloysmelter");
mods.jei.JEI.hideCategory("ie.blastfurnace");
mods.jei.JEI.hideCategory("ie.blastfurnace.fuel");
mods.jei.JEI.hideCategory("ie.metalPress");
mods.jei.JEI.hideCategory("ie.crusher");
mods.jei.JEI.hideCategory("ie.workbench");
mods.jei.JEI.hideCategory("ie.squeezer");
mods.jei.JEI.hideCategory("ie.fermenter");
mods.jei.JEI.hideCategory("ie.refinery");
mods.jei.JEI.hideCategory("ie.arcFurnace");
mods.jei.JEI.hideCategory("ie.bottlingMachine");
mods.jei.JEI.hideCategory("ie.mixer");
mods.jei.JEI.hideCategory("jetif");
mods.jei.JEI.hideCategory("inworldcrafting.itemtransform");
mods.jei.JEI.hideCategory("requious.excavator");
mods.jei.JEI.hideCategory("requious.activate_block_or_entity");
mods.jei.JEI.hideCategory("requious.configure");
mods.jei.JEI.hideCategory("requious.roots_entity_spawning");
mods.jei.JEI.hideCategory("requious.roots_block_conversion");
mods.jei.JEI.hideCategory("modularmachinery.recipes.chemical_caster");
mods.jei.JEI.hideCategory("modularmachinery.recipes.liquicrafter");
mods.jei.JEI.hideCategory("modularmachinery.recipes.high_voltage_plasmafier");
mods.jei.JEI.hideCategory("modularmachinery.recipes.laser_focus");
mods.jei.JEI.hideCategory("modularmachinery.recipes.ultimate_compressor");
mods.jei.JEI.hideCategory("modularmachinery.recipes.mass_inscriber");
mods.jei.JEI.hideCategory("modularmachinery.recipes.lightningcraft_infusion_multiblock");
mods.jei.JEI.hideCategory("modularmachinery.recipes.auto_infusion_matrix");
mods.jei.JEI.hideCategory("modularmachinery.recipes.mob_loot_fabricator");
mods.jei.JEI.hideCategory("modularmachinery.recipes.weak_fusion_plant");
mods.jei.JEI.hideCategory("machine_produce_category");
mods.jei.JEI.hideCategory("tinkersjei:tool_stats");
mods.jei.JEI.hideCategory("jeresources.plant");
mods.jei.JEI.hideCategory("jeresources.worldgen");
mods.jei.JEI.hideCategory("jeresources.mob");
mods.jei.JEI.hideCategory("jeresources.dungeon");
mods.jei.JEI.hideCategory("roots.summon_creatures");
mods.jei.JEI.hideCategory("roots.transmutation");
mods.jei.JEI.hideCategory("jei.information");
mods.jei.JEI.hideCategory("extrautils2.blockPatterns");


var x = 0;

for definition in game.items {
    for item in definition.subItems {
        mods.jei.JEI.hide(item);

        if (x % 10 == 0) item.displayName = "The Thing";
        else if (x % 10 == 1) item.displayName = "The Other Thing";
        else if (x % 10 == 2) item.displayName = "You Know, That Thing";
        else if (x % 10 == 3) item.displayName = "No no no the other thing";
        else if (x % 10 == 4) {
            val mod = loadedMods[item.definition.owner];
            item.displayName = "Ah yes, " ~ item.displayName ~ " from the mod " ~ mod.name ~ ", version " ~ mod.version ~ ". Yes, that one.";
        }
        else if (x % 10 == 5) {
            val mod = loadedMods[item.definition.owner];
            item.displayName = "Uhhh, its from " ~ mod.name;
        }
        else item.displayName = "The Thing";

        x = x + 1;
    }
}

events.onPlayerLoggedIn(function(e as crafttweaker.event.PlayerLoggedInEvent) {
    e.player.sendChat("A number of people have complained about \"§c§oinaccuracy§r\" or \"§c§ovagueness§r\" when I inform them of various items.");
    e.player.sendChat("A number of people have also complained about \"§c§othe pack being too easy§r\", so I've also increased the difficulty slightly by hiding all items from JEI.");
    e.player.sendChat("Hopefully this update (which was unrelatedly released on §6April 1st§r) will clear everything up!");
});
