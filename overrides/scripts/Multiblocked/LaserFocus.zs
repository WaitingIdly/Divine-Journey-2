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

print("STARTING LaserFocus.zs");

val laser_focus = RecipeMap("laser_focus") as RecipeMap;
RecipeMap.register(laser_focus);

laser_focus.start()
    .name("mysticalagriculture_zinc_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:crafting:4> * 4,
                <alchemistry:ingot:30> * 36)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:zinc_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriadditions_dragon_egg_crux")
    .duration(600)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<draconicevolution:draconic_block>,
                <minecraft:dragon_egg>,
                <quark:enderdragon_scale>,
                <mysticalagriculture:crafting:4> * 4)
//    .inputMekLaser(102400000)
    .outputItems(<mysticalagradditions:special:1>)
    .buildAndRegister();


laser_focus.start()
    .name("draconicevolution_wyvern_energy_relay_crystal")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<draconicevolution:energy_crystal> * 4,
                <draconicevolution:wyvern_energy_core> * 4,
                <contenttweaker:condensed_vis_crystal_auram>)
//    .inputMekLaser(2560000)
    .outputItems(<draconicevolution:energy_crystal:1>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_desh_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:crafting:4> * 4,
                <galacticraftplanets:mars:8> * 4)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:desh_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_starmetal_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:crafting:4> * 4,
                <astralsorcery:itemcraftingcomponent:1> * 36)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:starmetal_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("contenttweaker_alchemical_machine_frame")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<contenttweaker:draconic_machine_frame>,
                <contenttweaker:crystal_core>,
                <draconicevolution:chaotic_core>,
                <draconicevolution:draconic_block>,
                <extendedcrafting:singularity:24>,
                <alchemistry:mineral_salt> * 8)
//    .inputMekLaser(2560000)
    .outputItems(<contenttweaker:alchemical_machine_frame>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_inferium_seeds_tier_5")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:tier4_inferium_seeds>,
                <mysticalagriculture:crafting:4> * 8)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:tier5_inferium_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("draconicadditions_basic_necklace_of_shielding")
    .duration(100)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<thaumcraft:baubles:4>,
                <draconicevolution:draconic_core>,
                <draconicevolution:wyvern_energy_core>)
//    .inputMekLaser(1280000)
    .outputItems(<draconicadditions:basic_shield_necklace>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_supremium_ingot")
    .duration(5)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:36>,
                <mysticalagriculture:crafting:4> * 2)
//    .inputMekLaser(320000)
    .outputItems(<mysticalagriculture:crafting:37>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_end_steel_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:dark_steel_seeds>,
                <mysticalagriculture:end_seeds>,
                <mysticalagriculture:crafting:4> * 4,
                <enderio:block_alloy:8> * 4)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:end_steel_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_wither_skeleton_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:skeleton_seeds>,
                <mysticalagriculture:crafting:4> * 4,
                <mysticalagriculture:chunk:20> * 4)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:wither_skeleton_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_void_metal_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:cold_iron_seeds>,
                <mysticalagriculture:crafting:4> * 4,
                <thaumcraft:metal_void> * 4)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:void_metal_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_cold_iron_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:thaumium_seeds>,
                <mysticalagriculture:crafting:4> * 4,
                <bewitchment:block_of_cold_iron> * 4)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:cold_iron_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_tier_5_mob_chunk")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:chunk:3>,
                <mysticalagriculture:crafting:4> * 4)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:chunk:4>)
    .buildAndRegister();


laser_focus.start()
    .name("draconicevolution_charged_draconium_block")
    .duration(40)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<draconicevolution:draconium_block>)
//    .inputMekLaser(2560000)
    .outputItems(<draconicevolution:draconium_block:1>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_yellorium_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:crafting:4> * 4,
                <bigreactors:blockyellorium> * 4)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:yellorium_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_titanium_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:crafting:4> * 4,
                <galacticraftplanets:asteroids_block:7> * 4)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:titanium_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("contenttweaker_elevatium_ingot")
    .duration(40)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<contenttweaker:glod_crystal> * 3,
                <thermalfoundation:material:294> * 3,
                <enderio:item_material:12> * 3,
                <roots:wildewheet> * 3,
                <minecraft:blaze_rod> * 3,
                <actuallyadditions:item_crystal:2>,
                <thermalfoundation:material:262>,
                <enderio:item_alloy_endergy_ingot:6>,
                <roots:cloud_berry>,
                <minecraft:clay>,
                <actuallyadditions:item_crystal:4>,
                <tconstruct:slime_congealed>,
                <enderio:item_material:13>,
                <roots:spirit_herb>,
                <minecraft:cactus>,
                <actuallyadditions:item_solidified_experience> * 12)
//    .inputMekLaser(320000)
    .outputItems(<contenttweaker:ingot_of_elevation> * 16)
    .buildAndRegister();


laser_focus.start()
    .name("draconicevolution_wyvern_flux_capacitor")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<simplyjetpacks:itemfluxpack:3>,
                <draconicevolution:wyvern_core> * 4,
                <draconicevolution:wyvern_energy_core> * 4)
//    .inputMekLaser(2560000)
    .outputItems(<draconicevolution:draconium_capacitor>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_terrasteel_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:manasteel_seeds>,
                <mysticalagriculture:crafting:4> * 4,
                <botania:storage:1> * 4)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:terrasteel_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("draconicevolution_draconic_energy_core")
    .duration(20)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<draconicevolution:wyvern_core>,
                <draconicevolution:wyvern_energy_core> * 2,
                <draconicevolution:draconic_ingot> * 4)
//    .inputMekLaser(5120000)
    .outputItems(<draconicevolution:draconic_energy_core>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_tier_5_crafting_seed")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:20>,
                <mysticalagriculture:crafting:4> * 8)
//    .inputMekLaser(51200000)
    .outputItems(<mysticalagriculture:crafting:21>)
    .buildAndRegister();


laser_focus.start()
    .name("plustic_mirion_ingot")
    .duration(5)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<botania:manaresource>,
                <tconstruct:ingots>,
                <botania:manaresource:7>,
                <botania:manaresource:4>,
                <minecraft:glass>)
//    .inputMekLaser(320000)
    .outputItems(<plustic:mirioningot> * 4)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_alchemical_brass_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:elementium_seeds>,
                <mysticalagriculture:crafting:4> * 4,
                <thaumcraft:metal_brass> * 4)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:brass_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("contenttweaker_plasma_core")
    .duration(20)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<contenttweaker:empty_core>)
//    .inputMekLaser(1280000)
    .outputItems(<contenttweaker:plasma_core>)
    .buildAndRegister();


laser_focus.start()
    .name("avaritia_extreme_crafting_table")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<extendedcrafting:table_ultimate>,
                <avaritia:resource:1> * 8)
//    .inputMekLaser(2560000)
    .outputItems(<avaritia:extreme_crafting_table>)
    .buildAndRegister();


laser_focus.start()
    .name("draconicevolution_energy_core_stabilizer")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<draconicevolution:particle_generator>,
                <actuallyadditions:block_crystal_empowered:2> * 16)
//    .inputMekLaser(2560000)
    .outputItems(<draconicevolution:particle_generator:2>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_draconium_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:crafting:4> * 4,
                <draconicevolution:draconium_block> * 4)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:draconium_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("contenttweaker_stabilized_dimensional_machine_frame")
    .duration(200)
    .perTick(true).inputFE(1024000).perTick(false)
    .inputItems(<contenttweaker:alchemical_machine_frame>,
                <rftools:machine_frame> * 16,
                <contenttweaker:highly_radioactive_dimension_splitting_compound> * 8,
                <draconicadditions:chaotic_energy_core>,
                <draconicevolution:reactor_part:4>)
//    .inputMekLaser(2560000)
    .outputItems(<contenttweaker:stabilized_dimensional_machine_frame>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculture_thaumium_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:brass_seeds>,
                <mysticalagriculture:crafting:4> * 4,
                <thaumcraft:metal_thaumium> * 4)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:thaumium_seeds>)
    .buildAndRegister();


laser_focus.start()
    .name("draconicevolution_basic_energy_relay_crystal")
    .duration(100)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<draconicevolution:wyvern_energy_core>,
                <actuallyadditions:block_laser_relay_extreme>,
                <extendedcrafting:material:24>)
//    .inputMekLaser(1280000)
    .outputItems(<draconicevolution:energy_crystal>)
    .buildAndRegister();


laser_focus.start()
    .name("draconicevolution_wyvern_energy_core")
    .duration(20)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<draconicevolution:draconic_core>,
                <abyssalcraft:crystalcluster:11> * 16)
//    .inputMekLaser(1280000)
    .outputItems(<draconicevolution:wyvern_energy_core>)
    .buildAndRegister();


laser_focus.start()
    .name("mysticalagriculturetieredcrystals_supremium_infusion_crystal")
    .duration(400)
    .perTick(true).inputFE(128000).perTick(false)
    .inputItems(<matc:superiumcrystal>,
                <mysticalagriculture:crafting:4> * 4,
                <alchemistry:ingot:45> * 8)
//    .inputMekLaser(102400000)
    .outputItems(<matc:supremiumcrystal>)
    .buildAndRegister();

laser_focus.start()
    .name("mysticalagriculture_aquamarine_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:crafting:4> * 4,
                <astralsorcery:itemcraftingcomponent> * 36)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:aquamarine_seeds>)
    .buildAndRegister();

laser_focus.start()
    .name("mysticalagriadditions_dragon_egg_seeds")
    .duration(600)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <mysticalagriculture:crafting:4> * 4,
                <quark:enderdragon_scale>,
                <contenttweaker:awakened_dragon_token>)
//    .inputMekLaser(409600000)
    .outputItems(<mysticalagradditions:dragon_egg_seeds>)
    .buildAndRegister();

laser_focus.start()
    .name("mysticalagriculture_meteoric_iron_seeds")
    .duration(200)
    .perTick(true).inputFE(32000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:21>,
                <roots:moonglow_seed>,
                <mysticalagriculture:dark_steel_seeds>,
                <mysticalagriculture:elementium_seeds>,
                <mysticalagriculture:crafting:4> * 4,
                <galacticraftcore:basic_block_core:12> * 4)
//    .inputMekLaser(25600000)
    .outputItems(<mysticalagriculture:meteoric_iron_seeds>)
    .buildAndRegister();



print("ENDING LaserFocus.zs");
