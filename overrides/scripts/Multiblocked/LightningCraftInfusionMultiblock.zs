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

print("STARTING LightningCraftInfusionMultiblock.zs");

<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("skyfather_ingot_recipe")
    .duration(300)
    .perTick(true).inputFE(3000).perTick(false)
    .addItemInput(<divinerpg:skythern_chunk>,
                  <lightningcraft:stone_block> * 4)
    .addItemOutput(<lightningcraft:ingot:1> * 4)
    .build();


<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("ichor")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .addItemInput(<lightningcraft:material:5>,
                  <lightningcraft:ingot:1>,
                  <minecraft:emerald>)
    .addItemOutput(<lightningcraft:material:11>)
    .build();


<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("mystic_ingot_recipe")
    .duration(300)
    .perTick(true).inputFE(30000).perTick(false)
    .addItemInput(<lightningcraft:stone_block:3>,
                  <lightningcraft:material:11> * 2,
                  <lightningcraft:material:13> * 2)
    .addItemOutput(<lightningcraft:ingot:2> * 8)
    .build();



<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("empowered_underpowder_recipe")
    .duration(300)
    .perTick(true).inputFE(7500).perTick(false)
    .addItemInput(<lightningcraft:material:12>,
                  <lightningcraft:material:8> * 2,
                  <lightningcraft:dust> * 2)
    .addItemOutput(<lightningcraft:material:13>)
    .build();

<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("divine_underpowder_recipe")
    .duration(300)
    .perTick(true).inputFE(15000).perTick(false)
    .addItemInput(<lightningcraft:material:13>,
                  <lightningcraft:dust:1> * 4)
    .addItemOutput(<lightningcraft:material:14> * 4)
    .build();


<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("encorcelled_core_recipe")
    .duration(300)
    .perTick(true).inputFE(50000).perTick(false)
    .addItemInput(<lightningcraft:material:13>,
                  <contenttweaker:mystical_iron_ingot> * 2,
                  <lightningcraft:metal_block> * 2)
    .addItemOutput(<lightningcraft:material:9>)
    .build();


<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("bonemeal_recipe")
    .duration(300)
    .perTick(true).inputFE(1000).perTick(false)
    .addItemInput(<lightningcraft:material:7>,
                  <thermalfoundation:material:1027> * 16,
                  <bloodmagic:cutting_fluid:0>)
    .addItemOutput(<lightningcraft:material:8> * 3)
    .build();

# Add Electricium to Modular Machine
<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("electricium_ingot_recipe")
    .duration(300)
    .perTick(true).inputFE(1000).perTick(false)
    .addItemInput(<minecraft:diamond>,
                  <minecraft:iron_ingot>,
                  <minecraft:gold_ingot>)
    .addItemOutput(<lightningcraft:ingot:0>)
    .build();

<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("electricium_block_recipe")
    .duration(300)
    .perTick(true).inputFE(1000).perTick(false)
    .addItemInput(<ore:blockDiamond>,
                  <minecraft:iron_block>,
                  <minecraft:gold_block>)
    .addItemOutput(<lightningcraft:metal_block:0>)
    .build();

# Add weapons to Modular Machine
<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("soul_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .addItemInput(<minecraft:stone_sword>,
                  <minecraft:soul_sand> * 4)
    .addItemOutput(<lightningcraft:soul_sword>)
    .build();

<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("zombie_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .addItemInput(<minecraft:stone_sword>,
                  <minecraft:rotten_flesh> * 4)
    .addItemOutput(<lightningcraft:zombie_sword>)
    .build();

<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("feather_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .addItemInput(<minecraft:stone_sword>,
                  <minecraft:feather> * 4)
    .addItemOutput(<lightningcraft:feather_sword>)
    .build();

<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("ender_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .addItemInput(<minecraft:stone_sword>,
                  <minecraft:ender_pearl> * 4)
    .addItemOutput(<lightningcraft:ender_sword>)
    .build();

<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("blaze_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .addItemInput(<minecraft:stone_sword>,
                  <minecraft:blaze_rod> * 4)
    .addItemOutput(<lightningcraft:blaze_sword>)
    .build();

<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("ice_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .addItemInput(<minecraft:stone_sword>,
                  <minecraft:packed_ice> * 4)
    .addItemOutput(<lightningcraft:ice_sword>)
    .build();

<mbd:recipe_map:lightningcraft_infusion_multiblock>.start()
    .name("mystic_sword")
    .duration(300)
    .perTick(true).inputFE(5000).perTick(false)
    .addItemInput(<lightningcraft:sky_sword>,
                  <lightningcraft:dust:2> * 4)
    .addItemOutput(<lightningcraft:mystic_sword>)
    .build();


























print("ENDING LightningCraftInfusionMultiblock.zs");
