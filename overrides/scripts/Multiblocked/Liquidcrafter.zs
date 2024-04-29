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

print("STARTING Liquidcrafter.zs");

val map = RecipeMap("liquidcrafter") as RecipeMap;
RecipeMap.register(map);

<contenttweaker:starlight>.addTooltip("Used to represent Liquid Starlight in a Multiblock'd Multiblock preview.");


map.start()
    .name("contenttweaker_essence_of_dimensionality")
    .duration(100)
    .perTick(true).inputFE(500000).perTick(false)
    .inputItems(<contenttweaker:essence_of_extension>,
                <rftoolsdim:dimension_builder> * 2,
                <enderio:block_transceiver> * 4)
    .inputFluids(<liquid:space> * 2048000)
    .outputItems(<contenttweaker:essence_of_dimensionality>)
    .buildAndRegister();

map.start()
    .name("mercury_iodine")
    .duration(100)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<alchemistry:element:53> * 16,
                <alchemistry:element:80> * 16,
                <alchemistry:compound:44> * 16)
    .outputItems(<thermalfoundation:material:64>)
    .outputFluids(<liquid:mercury> * 144,
                  <liquid:impure_mercury_iodine_mixture> * 144)
    .buildAndRegister();

map.start()
    .name("contenttweaker_essence_of_thought")
    .duration(100)
    .perTick(true).inputFE(500000).perTick(false)
    .inputItems(<contenttweaker:knowledge_of_the_sky> * 16,
                <thaumcraft:brain> * 64,
                <galacticraftcore:canvas> * 16,
                <projecte:item.pe_covalence_dust:1> * 16,
                <projecte:item.pe_covalence_dust:2> * 16,
                <contenttweaker:white_matter> * 2)
    .inputFluids(<liquid:experience> * 2048000)
    .outputItems(<contenttweaker:essence_of_thought>)
    .buildAndRegister();

map.start()
    .name("iodine")
    .duration(100)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<alchemistry:compound:41> * 16)
    .inputFluids(<liquid:impure_mercury_iodine_mixture> * 500)
    .outputItems(<thermalfoundation:material:69>)
    .outputFluids(<liquid:liquid_iodine> * 500)
    .buildAndRegister();

map.start()
    .name("contenttweaker_oxygen_rich_barium_calcite_perpetuator")
    .duration(200)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<galacticraftcore:canister:1>,
                <alchemistry:compound:1001>,
                <alchemistry:compound:1004> * 12,
                <galacticraftplanets:dense_ice> * 8,
                <projectred-core:resource_item:201> * 3)
    .inputFluids(<liquid:tungsten> * 1000,
                 <liquid:nitrogen> * 1000)
    .outputItems(<contenttweaker:oxygen_rich_barium_calcite_perpetuator>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_tiny_chaos_fragment")
    .duration(5)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<alchemistry:compound:48>,
                <alchemistry:compound:32> * 2)
    .inputFluids(<liquid:liquid_iodine> * 10)
    .outputItems(<draconicevolution:chaos_shard:3> * 12)
    .buildAndRegister();

map.start()
    .name("contenttweaker_empowered_thermal_controller")
    .duration(100)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<galacticraftcore:basic_item:20>,
                <contenttweaker:secret_alien_technology>)
    .inputFluids(<liquid:bacterialsludge> * 1000,
                 <liquid:rocket_fuel> * 1000)
    .outputItems(<contenttweaker:empowered_thermal_controller>)
    .buildAndRegister();

map.start()
    .name("oil")
    .duration(100)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<galacticraftcore:basic_item:13>)
    .inputFluids(<liquid:empoweredoil> * 1000,
                 <liquid:tree_oil> * 1000)
    .outputItems(<projectred-core:resource_item:301> * 2)
    .outputFluids(<liquid:oil> * 1000)
    .buildAndRegister();

map.start()
    .name("contenttweaker_highly_radioactive_dimension_splitting_compound")
    .duration(200)
    .perTick(true).inputFE(200000).perTick(false)
    .inputItems(<alchemistry:ingot:94>,
                <alchemistry:ingot:45> * 2)
    .inputFluids(<liquid:uranium> * 1000,
                 <liquid:bromine> * 360)
    .outputItems(<contenttweaker:highly_radioactive_dimension_splitting_compound>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_solar_ingot")
    .duration(100)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<contenttweaker:empowered_solar_dust> * 4,
                <bewitchment:bottled_hellfire> * 2,
                <contenttweaker:angelic_silicon_crystal_mixture> * 2,
                <contenttweaker:condensed_vis_crystal_ignis>,
                <galacticraftplanets:basic_item_venus:5>)
    .inputFluids(<liquid:if.protein> * 300,
                 <liquid:creosote> * 1000)
    .outputItems(<contenttweaker:solar_ingot> * 8)
    .buildAndRegister();

map.start()
    .name("contenttweaker_zysc_baach_sheet")
    .duration(100)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<contenttweaker:copper_bismid_carbonate_sheet>,
                <alchemistry:compound:1007>,
                <alchemistry:ingot:21> * 16)
    .inputFluids(<liquid:helium> * 250,
                 <liquid:argon> * 50)
    .outputItems(<contenttweaker:zysc_baach_sheet>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_clay")
    .duration(200)
    .perTick(true).inputFE(16000000).perTick(false)
    .inputItems(<extendedcrafting:singularity_custom:100> * 4,
                <tconstruct:edible:31> * 8,
                <contenttweaker:antimatter_cluster>,
                <bewitchment:ink_cap_dye> * 4,
                <alchemistry:element:93> * 32,
                <contenttweaker:condensed_vis_crystal_alkimia> * 4)
    .inputFluids(<liquid:purifying_fluid> * 2000,
                 <liquid:nutrient_distillation> * 2000)
    .outputItems(<contenttweaker:clay>)
    .buildAndRegister();

map.start()
    .name("sulfuric_acid")
    .duration(100)
    .perTick(true).inputFE(200).perTick(false)
    .inputItems(<abyssalcraft:crystalcluster:2>)
    .inputFluids(<liquid:sulphuricacid> * 500)
    .outputFluids(<liquid:sulphuricacid> * 1000)
    .buildAndRegister();

map.start()
    .name("contenttweaker_empowered_solar_dust")
    .duration(100)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<galacticraftplanets:basic_item_venus:4>,
                <galacticraftplanets:venus:2> * 2)
    .inputFluids(<liquid:sulphuricacid> * 500,
                 <liquid:purifying_fluid> * 500)
    .outputItems(<contenttweaker:empowered_solar_dust>)
    .buildAndRegister();

print("ENDING Liquidcrafter.zs");
