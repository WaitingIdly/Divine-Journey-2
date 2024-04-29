#loader multiblocked
# Author: WaitingIdly

import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.MBDRegistry;
import mods.multiblocked.pattern.CTPredicate;
import mods.multiblocked.pattern.FactoryBlockPattern;
import mods.multiblocked.pattern.RelativeDirection;
import mods.multiblocked.recipe.RecipeMap;

print("STARTING LightningCraftInfusionMultiblock.zs");

val map = RecipeMap("lightningcraft_infusion_multiblock") as RecipeMap;
RecipeMap.register(map);

val controller = MBDRegistry.getDefinition("dj2:lightningcraft_infusion_multiblock") as ControllerDefinition;
controller.recipeMap = map;
controller.basePattern = FactoryBlockPattern.start(RelativeDirection.BACK, RelativeDirection.UP, RelativeDirection.RIGHT)
    .aisle("ABA","BCB", "ABA", "   ")
    .aisle("BDB","@EF", "BAB", " G ")
    .aisle("ABA","BHB", "ABA", "   ")
    .where("A", CTPredicate.states(<blockstate:lightningcraft:stone_block:variant=3>))
    .where("B", CTPredicate.states(<blockstate:modularmachinery:blockcasing>))
    .where("C", CTPredicate.states(<blockstate:modularmachinery:blockoutputbus:size=tiny>))
    .where("D", CTPredicate.states(<blockstate:lightningcraft:lightning_cell:variant=1>))
    .where("E", CTPredicate.states(<blockstate:lightningcraft:lightning_infuser>))
    .where("F", CTPredicate.states(<blockstate:modularmachinery:blockenergyinputhatch:size=huge>))
    .where("G", CTPredicate.states(<blockstate:lightningcraft:air_terminal:variant=skyfather>))
    .where("H", CTPredicate.states(<blockstate:modularmachinery:blockinputbus:size=big>))
    .where("@", CTPredicate.states(<blockstate:dj2:lightningcraft_infusion_multiblock>).setCenter())
    .where(" ", CTPredicate.getAny())
    .where("-", CTPredicate.getAir())
    .build();

map.start()
    .name("skyfather_ingot_recipe")
    .duration(300)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<divinerpg:skythern_chunk>,
                  <lightningcraft:stone_block> * 4)
    .outputItems(<lightningcraft:ingot:1> * 4)
    .build();


map.start()
    .name("ichor")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<lightningcraft:material:5>,
                  <lightningcraft:ingot:1>,
                  <minecraft:emerald>)
    .outputItems(<lightningcraft:material:11>)
    .build();


map.start()
    .name("mystic_ingot_recipe")
    .duration(300)
    .perTick(true).inputFE(30000).perTick(false)
    .inputItems(<lightningcraft:stone_block:3>,
                  <lightningcraft:material:11> * 2,
                  <lightningcraft:material:13> * 2)
    .outputItems(<lightningcraft:ingot:2> * 8)
    .build();



map.start()
    .name("empowered_underpowder_recipe")
    .duration(300)
    .perTick(true).inputFE(7500).perTick(false)
    .inputItems(<lightningcraft:material:12>,
                  <lightningcraft:material:8> * 2,
                  <lightningcraft:dust> * 2)
    .outputItems(<lightningcraft:material:13>)
    .build();

map.start()
    .name("divine_underpowder_recipe")
    .duration(300)
    .perTick(true).inputFE(15000).perTick(false)
    .inputItems(<lightningcraft:material:13>,
                  <lightningcraft:dust:1> * 4)
    .outputItems(<lightningcraft:material:14> * 4)
    .build();


map.start()
    .name("encorcelled_core_recipe")
    .duration(300)
    .perTick(true).inputFE(50000).perTick(false)
    .inputItems(<lightningcraft:material:13>,
                  <contenttweaker:mystical_iron_ingot> * 2,
                  <lightningcraft:metal_block> * 2)
    .outputItems(<lightningcraft:material:9>)
    .build();


map.start()
    .name("bonemeal_recipe")
    .duration(300)
    .perTick(true).inputFE(1000).perTick(false)
    .inputItems(<lightningcraft:material:7>,
                  <thermalfoundation:material:1027> * 16,
                  <bloodmagic:cutting_fluid>)
    .outputItems(<lightningcraft:material:8> * 3)
    .build();

# Add Electricium to Modular Machine
map.start()
    .name("electricium_ingot_recipe")
    .duration(300)
    .perTick(true).inputFE(1000).perTick(false)
    .inputItems(<minecraft:diamond>,
                  <minecraft:iron_ingot>,
                  <minecraft:gold_ingot>)
    .outputItems(<lightningcraft:ingot>)
    .build();

map.start()
    .name("electricium_block_recipe")
    .duration(300)
    .perTick(true).inputFE(1000).perTick(false)
    .inputItems(<ore:blockDiamond>,
                  <minecraft:iron_block>,
                  <minecraft:gold_block>)
    .outputItems(<lightningcraft:metal_block>)
    .build();

# Add weapons to Modular Machine
map.start()
    .name("soul_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<minecraft:stone_sword>,
                  <minecraft:soul_sand> * 4)
    .outputItems(<lightningcraft:soul_sword>)
    .build();

map.start()
    .name("zombie_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<minecraft:stone_sword>,
                  <minecraft:rotten_flesh> * 4)
    .outputItems(<lightningcraft:zombie_sword>)
    .build();

map.start()
    .name("feather_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<minecraft:stone_sword>,
                  <minecraft:feather> * 4)
    .outputItems(<lightningcraft:feather_sword>)
    .build();

map.start()
    .name("ender_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<minecraft:stone_sword>,
                  <minecraft:ender_pearl> * 4)
    .outputItems(<lightningcraft:ender_sword>)
    .build();

map.start()
    .name("blaze_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<minecraft:stone_sword>,
                  <minecraft:blaze_rod> * 4)
    .outputItems(<lightningcraft:blaze_sword>)
    .build();

map.start()
    .name("ice_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<minecraft:stone_sword>,
                  <minecraft:packed_ice> * 4)
    .outputItems(<lightningcraft:ice_sword>)
    .build();

map.start()
    .name("mystic_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<lightningcraft:sky_sword>,
                  <lightningcraft:dust:2> * 4)
    .outputItems(<lightningcraft:mystic_sword>)
    .build();


























print("ENDING LightningCraftInfusionMultiblock.zs");
