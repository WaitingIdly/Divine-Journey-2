#loader multiblocked
# Author: WaitingIdly

import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.MBDRegistry;
import mods.multiblocked.capability.IO;
import mods.multiblocked.pattern.CTPredicate;
import mods.multiblocked.pattern.FactoryBlockPattern;
import mods.multiblocked.pattern.RelativeDirection;
import mods.multiblocked.recipe.RecipeMap;

print("STARTING UltimateCompressor.zs");

val map = RecipeMap("ultimate_compressor") as RecipeMap;
RecipeMap.register(map);

val controller = MBDRegistry.getDefinition("dj2:ultimate_compressor") as ControllerDefinition;
controller.recipeMap = map;
controller.basePattern = FactoryBlockPattern.start(RelativeDirection.BACK, RelativeDirection.UP, RelativeDirection.RIGHT)
    .aisle("ABA", "CAB", "ABA")
    .aisle("@BD", "AEA", "BBB")
    .aisle("ABA", "FAB", "ABA")
    .where("A", CTPredicate.states(<blockstate:galacticraftcore:machine4>).disableRenderFormed())
    .where("B", CTPredicate.states(<blockstate:modularmachinery:blockcasing:casing=reinforced>))
    .where("C", CTPredicate.states(<blockstate:actuallyadditions:block_giant_chest>).setIO(IO.OUT))
    .where("D", CTPredicate.states(<blockstate:modularmachinery:blockenergyinputhatch:size=ludicrous>))
    .where("E", CTPredicate.liquids(<fluid:molten_mystic>) | CTPredicate.states(<blockstate:contenttweaker:molten_mystic>))
    .where("F", CTPredicate.states(<blockstate:actuallyadditions:block_giant_chest>).setIO(IO.IN))
    .where("@", CTPredicate.states(<blockstate:dj2:ultimate_compressor>).setCenter())
    .where(" ", CTPredicate.getAny())
    .where("-", CTPredicate.getAir())
    .build();

<contenttweaker:molten_mystic>.addTooltip("Used to represent Molten Mystic in a Multiblock'd Multiblock preview.");

map.start()
    .name("compressed_desh")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftplanets:item_basic_mars:2> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftplanets:item_basic_mars:5> * 4)
    .buildAndRegister();

map.start()
    .name("compressed_steel")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<immersiveengineering:sheetmetal:8> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftcore:basic_item:9> * 4)
    .buildAndRegister();

map.start()
    .name("compressed_titanium")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftplanets:item_basic_asteroids> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftplanets:item_basic_asteroids:6> * 4)
    .buildAndRegister();

map.start()
    .name("heavy_duty_plate_tier_2")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftcore:heavy_plating> * 24,
                <galacticraftcore:item_basic_moon:1> * 12)
    .outputItems(<galacticraftplanets:item_basic_mars:3> * 12)
    .buildAndRegister();

map.start()
    .name("compressed_iron")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<immersiveengineering:sheetmetal:9> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftcore:basic_item:11> * 4)
    .buildAndRegister();

map.start()
    .name("compressed_tin")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<contenttweaker:tin_sheetmetal> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftcore:basic_item:7> * 4)
    .buildAndRegister();

map.start()
    .name("compressed_bronze")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftcore:basic_item:6> * 4,
                <galacticraftcore:basic_item:7> * 4)
    .outputItems(<galacticraftcore:basic_item:10> * 4)
    .buildAndRegister();

map.start()
    .name("heavy_duty_plate_tier_3")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftplanets:item_basic_mars:5> * 24,
                <galacticraftplanets:item_basic_mars:3> * 12)
    .outputItems(<galacticraftplanets:item_basic_asteroids:5> * 12)
    .buildAndRegister();

map.start()
    .name("compressed_meteoric_iron")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftcore:item_basic_moon> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftcore:item_basic_moon:1> * 4)
    .buildAndRegister();

map.start()
    .name("compressed_copper")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<immersiveengineering:sheetmetal> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftcore:basic_item:6> * 4)
    .buildAndRegister();

map.start()
    .name("heavy_duty_plate_tier_1")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<galacticraftcore:basic_item:9> * 12,
                <galacticraftcore:basic_item:8> * 12,
                <galacticraftcore:basic_item:10> * 12)
    .outputItems(<galacticraftcore:heavy_plating> * 4)
    .buildAndRegister();


map.start()
    .name("compressed_aluminum")
    .duration(1)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<immersiveengineering:sheetmetal:1> * 24,
                <contenttweaker:tough_galactic_plating> * 8,
                <contenttweaker:galactic_ingot> * 4)
    .outputItems(<galacticraftcore:basic_item:8> * 4)
    .buildAndRegister();





print("ENDING UltimateCompressor.zs");
