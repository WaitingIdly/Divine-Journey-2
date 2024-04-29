#loader multiblocked
# Author: WaitingIdly

import mods.multiblocked.MBDRegistry;
import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.definition.ComponentDefinition;
import mods.multiblocked.recipe.RecipeMap;
import mods.multiblocked.functions.ISetupRecipe;
import mods.multiblocked.recipe.RecipeLogic;
import mods.multiblocked.recipe.Recipe;
import mods.thaumcraft.AspectStack;

import crafttweaker.text.ITextComponent;

print("STARTING HighVoltagePlasmafier.zs");

val map = RecipeMap("high_voltage_plasmafier") as RecipeMap;
RecipeMap.register(map);

map.start()
    .name("contenttweaker_essence_of_time")
    .duration(600)
    .perTick(true).inputFE(16000000).perTick(false)
    .inputItems(<contenttweaker:essence_of_continuity>,
                <contenttweaker:essence_of_dimensionality>,
                <contenttweaker:essence_of_additivity>)
    .outputItems(<contenttweaker:essence_of_time>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_essence_of_matter")
    .duration(600)
    .perTick(true).inputFE(16000000).perTick(false)
    .inputItems(<extendedcrafting:singularity_ultimate>,
                <contenttweaker:essence_of_order>,
                <contenttweaker:essence_of_destruction>)
    .outputItems(<contenttweaker:essence_of_matter>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_essence_of_repetition")
    .duration(600)
    .perTick(true).inputFE(16000000).perTick(false)
    .inputItems(<contenttweaker:essence_of_logic>,
                <contenttweaker:essence_of_movement>)
    .outputItems(<contenttweaker:essence_of_repetition>)
    .buildAndRegister();

map.start()
    .name("avaritia_cosmic_meatballs")
    .duration(600)
    .perTick(true).inputFE(16000000).perTick(false)
    .inputItems(<contenttweaker:cosmic_neutronium_nugget>,
                <contenttweaker:cosmic_neutronium_burger>,
                <contenttweaker:cosmic_neutronium_taco>)
    .outputItems(<avaritia:cosmic_meatballs>)
    .buildAndRegister();

print("ENDING HighVoltagePlasmafier.zs");
