#loader multiblocked
# Author: WaitingIdly

import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.MBDRegistry;
import mods.multiblocked.pattern.CTPredicate;
import mods.multiblocked.pattern.FactoryBlockPattern;
import mods.multiblocked.pattern.RelativeDirection;
import mods.multiblocked.recipe.RecipeMap;

print("STARTING MassInscriber.zs");

val map = RecipeMap("mass_inscriber") as RecipeMap;
RecipeMap.register(map);

val controller = MBDRegistry.getDefinition("dj2:mass_inscriber") as ControllerDefinition;
controller.recipeMap = map;
controller.basePattern = FactoryBlockPattern.start(RelativeDirection.BACK, RelativeDirection.UP, RelativeDirection.RIGHT)
    .aisle(" A ", " B ", " B ", " B ", " C ")
    .aisle("@DE", "BFB", "BFB", "BFB", "CDC")
    .aisle(" G ", " B ", " B ", " B ", " C ")
    .where("A", CTPredicate.states(<blockstate:modularmachinery:blockoutputbus:size=normal>))
    .where("B", CTPredicate.states(<blockstate:contenttweaker:reinforced_glass_casing>))
    .where("C", CTPredicate.states(<blockstate:modularmachinery:blockcasing:casing=reinforced>))
    .where("D", CTPredicate.states(<blockstate:packagedauto:packager>))
    .where("E", CTPredicate.states(<blockstate:modularmachinery:blockenergyinputhatch:size=big>))
    .where("F", CTPredicate.states(<blockstate:appliedenergistics2:inscriber>))
    .where("G", CTPredicate.states(<blockstate:modularmachinery:blockinputbus:size=normal>))
    .where("@", CTPredicate.states(<blockstate:dj2:mass_inscriber>).setCenter())
    .where(" ", CTPredicate.getAny())
    .where("-", CTPredicate.getAir())
    .build();

map.start()
    .name("printed_engineering_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<minecraft:diamond> * 8)
    .outputItems(<appliedenergistics2:material:17> * 8)
    .buildAndRegister();

map.start()
    .name("printed_estimation_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<contenttweaker:coated_clathrate> * 8)
    .outputItems(<contenttweaker:printed_estimation_circuit> * 8)
    .buildAndRegister();

map.start()
    .name("clearance_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<contenttweaker:printed_clearance_circuit> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<contenttweaker:clearance_processor> * 8)
    .buildAndRegister();

map.start()
    .name("printed_calculation_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<appliedenergistics2:material:10> * 8)
    .outputItems(<appliedenergistics2:material:16> * 8)
    .buildAndRegister();

map.start()
    .name("thaumium_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<contenttweaker:printed_thaumium_circuit> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<contenttweaker:thaumium_processor> * 8)
    .buildAndRegister();

map.start()
    .name("printed_clearance_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<botania:manaresource:7> * 8)
    .outputItems(<contenttweaker:printed_clearance_circuit> * 8)
    .buildAndRegister();

map.start()
    .name("operation_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<contenttweaker:printed_operation_circuit> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<contenttweaker:operation_processor> * 8)
    .buildAndRegister();

map.start()
    .name("printed_silicon")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<appliedenergistics2:material:5> * 8)
    .outputItems(<appliedenergistics2:material:20> * 8)
    .buildAndRegister();

map.start()
    .name("methodology_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<contenttweaker:printed_methodolgy_circuit> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<contenttweaker:methodology_processor> * 8)
    .buildAndRegister();

map.start()
    .name("calculation_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<appliedenergistics2:material:16> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<appliedenergistics2:material:23> * 8)
    .buildAndRegister();

map.start()
    .name("scheduling_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<contenttweaker:printed_scheduling_circuit> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<contenttweaker:scheduling_processor> * 8)
    .buildAndRegister();

map.start()
    .name("printed_operation_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<thermalfoundation:material:136> * 8)
    .outputItems(<contenttweaker:printed_operation_circuit> * 8)
    .buildAndRegister();

map.start()
    .name("printed_scheduling_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<draconicevolution:draconic_ingot> * 8)
    .outputItems(<contenttweaker:printed_scheduling_circuit> * 8)
    .buildAndRegister();

map.start()
    .name("printed_logic_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<minecraft:gold_ingot> * 8)
    .outputItems(<appliedenergistics2:material:18> * 8)
    .buildAndRegister();

map.start()
    .name("printed_methodology_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<plustic:osmiridiumingot> * 8)
    .outputItems(<contenttweaker:printed_methodolgy_circuit> * 8)
    .buildAndRegister();

map.start()
    .name("printed_thaumium_circuit")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<thaumcraft:ingot> * 8)
    .outputItems(<contenttweaker:printed_thaumium_circuit> * 8)
    .buildAndRegister();

map.start()
    .name("logic_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<appliedenergistics2:material:18> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<appliedenergistics2:material:22> * 8)
    .buildAndRegister();

map.start()
    .name("engineering_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<appliedenergistics2:material:17> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<appliedenergistics2:material:24> * 8)
    .buildAndRegister();

map.start()
    .name("estimation_processor")
    .duration(1)
    .perTick(true).inputFE(20000).perTick(false)
    .inputItems(<contenttweaker:printed_estimation_circuit> * 8,
                <minecraft:redstone> * 8,
                <appliedenergistics2:material:20> * 8)
    .outputItems(<contenttweaker:estimation_processor> * 8)
    .buildAndRegister();




print("ENDING MassInscriber.zs");
