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

print("STARTING WeakFusionPlant.zs");

val weak_fusion_plant = RecipeMap("weak_fusion_plant") as RecipeMap;
RecipeMap.register(weak_fusion_plant);

weak_fusion_plant.start()
    .name("thorium")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<alchemistry:element:44> * 16,
                <alchemistry:element:46> * 16,
                <contenttweaker:fission_coolant>)
    .outputItems(<alchemistry:element:90> * 16)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("contenttweaker_proton_electron")
    .duration(1)
    .perTick(true).inputFE(3000000).perTick(false)
    .inputItems(<alchemistry:element:1>,
                <alchemistry:element:84> * 4,
                <contenttweaker:fission_catalyst>)
    .outputItems(<alchemistry:element:42> * 8,
                 <contenttweaker:proton>,
                 <contenttweaker:electron>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriculture_peridot_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagradditions:insanium> * 4,
                <projectred-core:resource_item:202> * 36,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagriculture:peridot_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriculture_sapphire_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagradditions:insanium> * 4,
                <projectred-core:resource_item:201> * 36,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagriculture:sapphire_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriculture_rock_crystal_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagriculture:cold_iron_seeds>,
                <mysticalagradditions:insanium> * 4,
                <astralsorcery:blockcustomore> * 36,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagriculture:rock_crystal_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriculture_chrome_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagradditions:insanium> * 4,
                <alchemistry:ingot:24> * 36,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagriculture:chrome_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriculture_ruby_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagradditions:insanium> * 4,
                <projectred-core:resource_item:200> * 36,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagriculture:ruby_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("uranium")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<alchemistry:element:41> * 16,
                <alchemistry:element:51> * 16,
                <contenttweaker:fission_coolant>)
    .outputItems(<alchemistry:element:92> * 16)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("radium")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<alchemistry:element:42> * 16,
                <alchemistry:element:46> * 16,
                <contenttweaker:fission_coolant>)
    .outputItems(<alchemistry:element:88> * 16)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("contenttweaker_perfect_vacuum")
    .duration(1)
    .perTick(true).inputFE(6000000).perTick(false)
    .inputItems(<minecraft:glass_bottle>,
                <contenttweaker:anti_air>,
                <botania:manaresource:15>,
                <minecraft:dragon_breath>,
                <contenttweaker:perfect_slate>,
                <contenttweaker:condensed_vis_crystal_vacuos>,
                <contenttweaker:fission_catalyst>)
    .outputItems(<contenttweaker:perfect_vacuum> * 3)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriadditions_tier_6_crafting_seed")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagradditions:insanium> * 8,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagradditions:insanium:1>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("contenttweaker_solar_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagradditions:insanium> * 4,
                <galacticraftplanets:basic_item_venus:4> * 36,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<contenttweaker:solar_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriculture_boron_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagradditions:insanium> * 4,
                <alchemistry:ingot:5> * 36,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagriculture:boron_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriadditions_inferium_seeds_tier_6")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagriculture:tier5_inferium_seeds>,
                <mysticalagradditions:insanium> * 8,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagradditions:tier6_inferium_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriculture_uranium_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagradditions:insanium> * 4,
                <immersiveengineering:storage:5> * 4,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagriculture:uranium_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriculture_magnesium_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagradditions:insanium> * 4,
                <alchemistry:ingot:12> * 36,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagriculture:magnesium_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("plutonium")
    .duration(120)
    .perTick(true).inputFE(3000000).perTick(false)
    .inputItems(<alchemistry:element:46> * 16,
                <alchemistry:element:48> * 16,
                <contenttweaker:fission_coolant>)
    .outputItems(<alchemistry:element:94> * 16)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriadditions_insanium_ingot")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:37>,
                <mysticalagradditions:insanium> * 2,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagradditions:insanium:2>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriadditions_neutronium_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagradditions:insanium> * 4,
                <avaritia:block_resource> * 4,
                <draconicevolution:chaos_shard> * 4,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagradditions:neutronium_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriculture_thorium_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagradditions:insanium> * 4,
                <alchemistry:ingot:90> * 36,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagriculture:thorium_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("contenttweaker_anti_hydrogen")
    .duration(1)
    .perTick(true).inputFE(3000000).perTick(false)
    .inputItems(<contenttweaker:anti_proton> * 16,
                <contenttweaker:anti_electron> * 16,
                <contenttweaker:fission_coolant>)
    .outputItems(<contenttweaker:anti_hydrogen> * 16)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriculture_tungsten_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagradditions:insanium> * 4,
                <alchemistry:ingot:74> * 36,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagriculture:tungsten_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriadditions_nether_star_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagriculture:wither_skeleton_seeds>,
                <mysticalagradditions:insanium> * 4,
                <extendedcrafting:storage:2> * 4,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagradditions:nether_star_seeds>)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("ytterbium")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<alchemistry:element:33> * 16,
                <alchemistry:element:37> * 16,
                <contenttweaker:fission_coolant>)
    .outputItems(<alchemistry:element:70> * 16)
    .buildAndRegister();

weak_fusion_plant.start()
    .name("mysticalagriadditions_awakened_draconium_seeds")
    .duration(30)
    .perTick(true).inputFE(12000000).perTick(false)
    .inputItems(<mysticalagradditions:insanium:1>,
                <mysticalagradditions:dragon_egg_seeds>,
                <mysticalagradditions:insanium> * 4,
                <draconicevolution:draconic_block> * 4,
                <rftools:infused_enderpearl> * 4,
                <contenttweaker:fission_coolant>)
    .outputItems(<mysticalagradditions:awakened_draconium_seeds>)
    .buildAndRegister();

print("ENDING WeakFusionPlant.zs");
