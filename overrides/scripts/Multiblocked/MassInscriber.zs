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

print("STARTING MassInscriber.zs");

<mbd:recipe_map:mass_inscriber>.start()
    .name("printed_engineering_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<minecraft:diamond> * 8)
    .outputItems(<appliedenergistics2:material:17> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("clearance_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<contenttweaker:printed_clearance_circuit> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<contenttweaker:clearance_processor> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("printed_calculation_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<appliedenergistics2:material:10> * 8)
    .outputItems(<appliedenergistics2:material:16> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("thaumium_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<contenttweaker:printed_thaumium_circuit> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<contenttweaker:thaumium_processor> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("printed_clearance_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<botania:manaresource:7> * 8)
    .outputItems(<contenttweaker:printed_clearance_circuit> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("operation_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<contenttweaker:printed_operation_circuit> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<contenttweaker:operation_processor> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("printed_silicon")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<appliedenergistics2:material:5> * 8)
    .outputItems(<appliedenergistics2:material:20> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("methodology_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<contenttweaker:printed_methodolgy_circuit> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<contenttweaker:methodology_processor> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("calculation_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<appliedenergistics2:material:16> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<appliedenergistics2:material:23> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("scheduling_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<contenttweaker:printed_scheduling_circuit> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<contenttweaker:scheduling_processor> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("printed_operation_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<thermalfoundation:material:136> * 8)
    .outputItems(<contenttweaker:printed_operation_circuit> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("printed_scheduling_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<draconicevolution:draconic_ingot> * 8)
    .outputItems(<contenttweaker:printed_scheduling_circuit> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("printed_logic_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<minecraft:gold_ingot> * 8)
    .outputItems(<appliedenergistics2:material:18> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("printed_methodology_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<plustic:osmiridiumingot> * 8)
    .outputItems(<contenttweaker:printed_methodolgy_circuit> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("printed_thaumium_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<thaumcraft:ingot> * 8)
    .outputItems(<contenttweaker:printed_thaumium_circuit> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("logic_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<appliedenergistics2:material:18> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<appliedenergistics2:material:22> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("engineering_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<appliedenergistics2:material:17> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<appliedenergistics2:material:24> * 8)
    .buildAndRegister();

<mbd:recipe_map:mass_inscriber>.start()
    .name("estimation_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<contenttweaker:printed_estimation_circuit> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<contenttweaker:estimation_processor> * 8)
    .buildAndRegister();




print("ENDING MassInscriber.zs");
