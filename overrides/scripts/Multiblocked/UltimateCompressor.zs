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

print("STARTING UltimateCompressor.zs");

val ultimate_compressor = RecipeMap("ultimate_compressor") as RecipeMap;
RecipeMap.register(ultimate_compressor);

<contenttweaker:molten_mystic>.addTooltip("Used to represent Molten Mystic in a Multiblock'd Multiblock preview.");

ultimate_compressor.start()
    .name("compressed_desh")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftplanets:item_basic_mars:2> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftplanets:item_basic_mars:5> * 4)
    .buildAndRegister();

ultimate_compressor.start()
    .name("compressed_steel")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<immersiveengineering:sheetmetal:8> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftcore:basic_item:9> * 4)
    .buildAndRegister();

ultimate_compressor.start()
    .name("compressed_titanium")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftplanets:item_basic_asteroids> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftplanets:item_basic_asteroids:6> * 4)
    .buildAndRegister();

ultimate_compressor.start()
    .name("heavy_duty_plate_tier_2")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftcore:heavy_plating> * 24,
                <galacticraftcore:item_basic_moon:1> * 12)
    .outputItems(<galacticraftplanets:item_basic_mars:3> * 12)
    .buildAndRegister();

ultimate_compressor.start()
    .name("compressed_iron")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<immersiveengineering:sheetmetal:9> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftcore:basic_item:11> * 4)
    .buildAndRegister();

ultimate_compressor.start()
    .name("compressed_tin")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<contenttweaker:tin_sheetmetal> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftcore:basic_item:7> * 4)
    .buildAndRegister();

ultimate_compressor.start()
    .name("compressed_bronze")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftcore:basic_item:6> * 4,
                <galacticraftcore:basic_item:7> * 4)
    .outputItems(<galacticraftcore:basic_item:10> * 4)
    .buildAndRegister();

ultimate_compressor.start()
    .name("heavy_duty_plate_tier_3")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftplanets:item_basic_mars:5> * 24,
                <galacticraftplanets:item_basic_mars:3> * 12)
    .outputItems(<galacticraftplanets:item_basic_asteroids:5> * 12)
    .buildAndRegister();

ultimate_compressor.start()
    .name("compressed_meteoric_iron")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftcore:item_basic_moon> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftcore:item_basic_moon:1> * 4)
    .buildAndRegister();

ultimate_compressor.start()
    .name("compressed_copper")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<immersiveengineering:sheetmetal> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftcore:basic_item:6> * 4)
    .buildAndRegister();

ultimate_compressor.start()
    .name("heavy_duty_plate_tier_1")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftcore:basic_item:9> * 12,
                <galacticraftcore:basic_item:8> * 12,
                <galacticraftcore:basic_item:10> * 12)
    .outputItems(<galacticraftcore:heavy_plating> * 4)
    .buildAndRegister();


ultimate_compressor.start()
    .name("compressed_aluminum")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<immersiveengineering:sheetmetal:1> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftcore:basic_item:8> * 4)
    .buildAndRegister();





print("ENDING UltimateCompressor.zs");
