#loader multiblocked
# Author: WaitingIdly

import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.MBDRegistry;
import mods.multiblocked.pattern.CTPredicate;
import mods.multiblocked.pattern.FactoryBlockPattern;
import mods.multiblocked.pattern.RelativeDirection;
import mods.multiblocked.recipe.RecipeMap;
import mods.thaumcraft.AspectStack;

print("STARTING AutoInfusionMatrix.zs");

val map = RecipeMap("auto_infusion_matrix") as RecipeMap;
RecipeMap.register(map);

val controller = MBDRegistry.getDefinition("dj2:auto_infusion_matrix") as ControllerDefinition;
controller.recipeMap = map;
controller.basePattern = FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.BACK, RelativeDirection.UP)
    .aisle("ABBBA", "BEAEB", "NAAAC", "BEAEB", "ABKBA")
    .aisle(" A@A ", "AFGFA", "BGAGB", "AFGFA", " ABA ") // controller is in the front middle of the second layer
    .aisle("ADDDA", "DHIHD", "DILID", "DHIHD", "ADDDA")
    .aisle("BDDDB", "D-J-D", "DJ-JD", "D-J-D", "BDDDB")
    .aisle("ADDDA", "DDDDD", "DDMDD", "DDDDD", "ADDDA")
    .aisle(" ABA ", "ABBBA", "BBBBB", "ABBBA", " ABA ")
    .aisle("ABBBA", "BEAEB", "BA AB", "BEAEB", "ABBBA")
    .where("A", CTPredicate.states(<blockstate:minecraft:stained_glass>))
    .where("B", CTPredicate.states(<blockstate:modularmachinery:blockcasing>))
    .where("C", CTPredicate.states(<blockstate:modularmachinery:blockoutputbus:size=small>))
    .where("D", CTPredicate.states(<blockstate:thaumicaugmentation:fortified_glass>))
    .where("E", CTPredicate.states(<blockstate:thaumicaugmentation:stone:ta_stone_type=ancient_light>))
    .where("F", CTPredicate.states(<blockstate:thaumcraft:metal_alchemical_advanced>))
    .where("G", CTPredicate.liquids(<fluid:liquid_death>) | CTPredicate.states(<blockstate:contenttweaker:liquid_death>))
    .where("H", CTPredicate.states(<blockstate:thaumcraft:pillar_arcane>))
    .where("I", CTPredicate.states(<blockstate:thaumicenergistics:infusion_provider>))
    .where("J", CTPredicate.states(<blockstate:thaumcraft:stabilizer>))
    .where("K", CTPredicate.states(<blockstate:modularmachinery:blockenergyinputhatch:size=big>))
    .where("L", CTPredicate.states(<blockstate:thaumcraft:pedestal_arcane>))
    .where("M", CTPredicate.states(<blockstate:thaumcraft:infusion_matrix>))
    .where("N", CTPredicate.states(<blockstate:modularmachinery:blockinputbus:size=small>))
    .where("@", CTPredicate.states(<blockstate:dj2:potato>).setCenter())
    .where(" ", CTPredicate.getAny())
    .where("-", CTPredicate.getAir())
    .build();

<contenttweaker:liquid_death>.addTooltip("Used to represent Liquid Death in a Multiblock'd Multiblock preview.");

map.start()
    .name("mysticalagriculture_aluminum_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <thermalfoundation:storage:4> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_metallum>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("metallum", 100))
    .outputItems(<mysticalagriculture:aluminum_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_RedstoneInlay")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<contenttweaker:fire_core>,
                <enderio:block_alloy:3>,
                <thermaldynamics:relay>,
                <thaumcraft:ingot>)
    .inputAspects(AspectStack("potentia", 20),
                  AspectStack("ignis", 10))
    .outputItems(<thaumcraft:inlay> * 4)
    .buildAndRegister();

map.start()
    .name("thaumicenergistics_arcane_assembler")
    .duration(16)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:arcane_workbench>,
                <appliedenergistics2:molecular_assembler> * 2,
                <thaumicenergistics:essentia_storage> * 2,
                <contenttweaker:condensed_vis_crystal_aer>,
                <contenttweaker:condensed_vis_crystal_terra>,
                <contenttweaker:condensed_vis_crystal_ignis>,
                <contenttweaker:condensed_vis_crystal_aqua>,
                <contenttweaker:condensed_vis_crystal_ordo>,
                <contenttweaker:condensed_vis_crystal_perditio>)
    .inputAspects(AspectStack("potentia", 120),
                  AspectStack("praecantatio", 100),
                  AspectStack("permutatio", 100),
                  AspectStack("fabrico", 100))
    .outputItems(<thaumicenergistics:arcane_assembler>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_rift_mover_output")
    .duration(140)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<thaumcraft:plate:3> * 3,
                <contenttweaker:condensed_vis_crystal_machina>,
                <thaumicaugmentation:material:5>,
                <thaumcraft:stone_eldritch_tile> * 2,
                <thaumcraft:mechanism_complex>,
                <contenttweaker:condensed_vis_crystal_vitium>)
    .inputAspects(AspectStack("perditio", 150),
                  AspectStack("machina", 150),
                  AspectStack("vacuos", 100),
                  AspectStack("vitium", 100),
                  AspectStack("alienis", 100),
                  AspectStack("permutatio", 100))
    .outputItems(<thaumicaugmentation:rift_mover_output>)
    .buildAndRegister();

map.start()
    .name("bewitchment_spinning_wheel")
    .duration(160)
    .perTick(true).inputFE(4000).perTick(false)
    .inputItems(<contenttweaker:witches_stonebrew>,
                <bewitchment:dragons_blood_wood> * 3,
                <atum:spinning_wheel>,
                <immersiveengineering:wooden_device1>,
                <bewitchment:wormwood> * 2)
    .inputAspects(AspectStack("machina", 240),
                  AspectStack("aqua", 200),
                  AspectStack("vacuos", 150),
                  AspectStack("alkimia", 100),
                  AspectStack("ignis", 100))
    .outputItems(<bewitchment:spinning_wheel>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_focus_3")
    .duration(120)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<contenttweaker:primordial_fragment>,
                <thaumcraft:mirrored_glass> * 2,
                <thaumcraft:focus_2>,
                <minecraft:nether_star>,
                <alchemistry:ingot:11> * 4)
    .inputAspects(AspectStack("vacuos", 150),
                  AspectStack("vitreus", 150),
                  AspectStack("ordo", 100),
                  AspectStack("praecantatio", 100),
                  AspectStack("instrumentum", 50),
                  AspectStack("auram", 50))
    .outputItems(<thaumcraft:focus_3>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_permutatio")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"permutatio"}]}) * 8)
    .inputAspects(AspectStack("permutatio", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_permutatio>)
    .buildAndRegister();

map.start()
    .name("bewitchment_goblet")
    .duration(80)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<contenttweaker:stirring_strength>,
                <bewitchment:cold_iron_plate> * 5,
                <thaumcraft:jar_normal>)
    .inputAspects(AspectStack("metallum", 150),
                  AspectStack("aqua", 150),
                  AspectStack("diabolus", 100))
    .outputItems(<bewitchment:goblet>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_primal_crusher")
    .duration(80)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:primordial_pearl>,
                <thaumcraft:void_pick>,
                <thaumcraft:void_shovel>,
                <thaumcraft:elemental_pick>,
                <thaumcraft:elemental_shovel>)
    .inputAspects(AspectStack("terra", 75),
                  AspectStack("instrumentum", 75),
                  AspectStack("perditio", 50),
                  AspectStack("vacuos", 50),
                  AspectStack("aversio", 50),
                  AspectStack("alienis", 50),
                  AspectStack("desiderium", 50))
    .outputItems(<thaumcraft:primal_crusher>.withTag({"infench":[{"lvl":"1s","id":"1s"},{"lvl":"1s","id":"4s"}]}))
    .buildAndRegister();

map.start()
    .name("thaumcraft_ElementalSword")
    .duration(56)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:nugget:10> * 2,
                <thaumcraft:thaumium_sword>,
                <thaumcraft:ingot> * 3,
                <enderutilities:enderpart:20>,
                <contenttweaker:condensed_vis_crystal_aer> * 2)
    .inputAspects(AspectStack("aer", 100),
                  AspectStack("aversio", 80),
                  AspectStack("motus", 60),
                  AspectStack("instrumentum", 40))
    .outputItems(<thaumcraft:elemental_sword>.withTag({"infench":[{"lvl":"2s","id":"5s"}]}))
    .buildAndRegister();

map.start()
    .name("thaumcraft_crystal_terra")
    .duration(5)
    .perTick(true).inputFE(1000).perTick(false)
    .inputItems(<thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"terra"}]}),
                <thaumcraft:salis_mundus>,
                <minecraft:wheat_seeds>)
    .inputAspects(AspectStack("terra", 10),
                  AspectStack("vitreus", 10),
                  AspectStack("vinculum", 5))
    .outputItems(<thaumcraft:crystal_terra>)
    .buildAndRegister();

map.start()
    .name("bewitchment_token_of_remedies")
    .duration(80)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<mysticalworld:amethyst_block> * 4,
                <bewitchment:block_of_cold_iron> * 4,
                <evilcraft:invigorating_pendant>)
    .inputAspects(AspectStack("instrumentum", 150),
                  AspectStack("luna", 100),
                  AspectStack("ordo", 100),
                  AspectStack("desiderium", 50))
    .outputItems(<bewitchment:token_of_remedies>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_stellae")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"stellae"}]}) * 8)
    .inputAspects(AspectStack("stellae", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_stellae>)
    .buildAndRegister();

map.start()
    .name("thaumicenergistics_infusion_provider")
    .duration(140)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<thaumicaugmentation:material:3>,
                <appliedenergistics2:interface> * 2,
                <contenttweaker:condensed_vis_crystal_machina>,
                <thaumicenergistics:coalescence_core>,
                <thaumcraft:salis_mundus> * 2,
                <thaumicaugmentation:impetus_mirror>,
                <thaumicenergistics:diffusion_core>)
    .inputAspects(AspectStack("machina", 240),
                  AspectStack("praecantatio", 200),
                  AspectStack("permutatio", 200),
                  AspectStack("aqua", 50))
    .outputItems(<thaumicenergistics:infusion_provider>)
    .buildAndRegister();

map.start()
    .name("thermaldynamics_cryo_stabilized_fluxduct_empty")
    .duration(54)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<simplyjetpacks:metaitemmods:26> * 2,
                <alchemistry:ingot:11>,
                <botania:elfglass> * 4,
                <evilcraft:potentia_sphere>,
                <thermaldynamics:duct_0:4>)
    .inputAspects(AspectStack("gelum", 100),
                  AspectStack("potentia", 100),
                  AspectStack("motus", 50),
                  AspectStack("machina", 20))
    .outputItems(<thermaldynamics:duct_0:9>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_aversio")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"aversio"}]}) * 8)
    .inputAspects(AspectStack("aversio", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_aversio>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_vinculum")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"vinculum"}]}) * 8)
    .inputAspects(AspectStack("vinculum", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_vinculum>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_thaumostatic_harness")
    .duration(160)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:morphic_resonator>,
                <contenttweaker:condensed_vis_crystal_aer> * 2,
                <thaumcraft:levitator>,
                <thaumcraft:plank_greatwood> * 4,
                <thaumicaugmentation:material:4>)
    .inputAspects(AspectStack("machina", 200),
                  AspectStack("potentia", 200),
                  AspectStack("volatus", 200),
                  AspectStack("motus", 200))
    .outputItems(<thaumicaugmentation:thaumostatic_harness>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_slime_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <mysticalagriculture:chunk:11> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_alkimia>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("alkimia", 100))
    .outputItems(<mysticalagriculture:slime_seeds>)
    .buildAndRegister();

map.start()
    .name("bewitchment_pentacle")
    .duration(80)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<contenttweaker:witches_stonebrew>,
                <bewitchment:diabolical_vein> * 2,
                <bewitchment:block_of_cold_iron_pentacle> * 2,
                <contenttweaker:coralium_decorated_blood_star>)
    .inputAspects(AspectStack("instrumentum", 200),
                  AspectStack("diabolus", 200))
    .outputItems(<bewitchment:pentacle>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_tool_upgrade_4")
    .duration(28)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<immersiveengineering:metal_device1:11> * 2,
                <draconicevolution:draconic_core> * 4,
                <lightningcraft:plate:9> * 2,
                <mysticalagriculture:charm:16>)
    .inputAspects(AspectStack("aversio", 80),
                  AspectStack("instrumentum", 60))
    .outputItems(<draconicevolution:tool_upgrade:4>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_VoidRobeChest")
    .duration(52)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:plate:3> * 2,
                <thaumcraft:cloth_chest>,
                <contenttweaker:magical_leather>,
                <thaumcraft:void_chest>,
                <thaumcraft:salis_mundus>,
                <thaumcraft:fabric>)
    .inputAspects(AspectStack("metallum", 60),
                  AspectStack("praemunio", 60),
                  AspectStack("vacuos", 60),
                  AspectStack("potentia", 40),
                  AspectStack("alienis", 40))
    .outputItems(<thaumcraft:void_robe_chest>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_steel_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:iron_seeds>,
                <thermalfoundation:storage_alloy> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_ignis>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("ignis", 100))
    .outputItems(<mysticalagriculture:steel_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_rift_feeder")
    .duration(120)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:plate:3> * 2,
                <thaumcraft:essentia_input>,
                <thaumcraft:morphic_resonator> * 2,
                <thaumcraft:mechanism_simple> * 2,
                <thaumcraft:tube_filter> * 2)
    .inputAspects(AspectStack("machina", 200),
                  AspectStack("vitium", 200),
                  AspectStack("alienis", 100),
                  AspectStack("vacuos", 50),
                  AspectStack("perditio", 50))
    .outputItems(<thaumicaugmentation:rift_feeder>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_soularium_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:gold_seeds>,
                <enderio:block_alloy:7> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_spiritus>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("spiritus", 100))
    .outputItems(<mysticalagriculture:soularium_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_crystal_ignis")
    .duration(5)
    .perTick(true).inputFE(1000).perTick(false)
    .inputItems(<thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"ignis"}]}),
                <thaumcraft:salis_mundus>,
                <minecraft:wheat_seeds>)
    .inputAspects(AspectStack("ignis", 10),
                  AspectStack("vitreus", 10),
                  AspectStack("vinculum", 5))
    .outputItems(<thaumcraft:crystal_ignis>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_tool_upgrade_2")
    .duration(28)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<mysticalagradditions:charm>,
                <thaumcraft:turret:2>,
                <lightningcraft:plate:9> * 2,
                <draconicevolution:draconic_core> * 4,
                <actuallyadditions:block_miner>)
    .inputAspects(AspectStack("perditio", 80),
                  AspectStack("instrumentum", 60))
    .outputItems(<draconicevolution:tool_upgrade:2>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_crystal_vitium")
    .duration(5)
    .perTick(true).inputFE(1000).perTick(false)
    .inputItems(<thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"vitium"}]}),
                <thaumcraft:salis_mundus>,
                <minecraft:wheat_seeds>)
    .inputAspects(AspectStack("vitium", 10),
                  AspectStack("vitreus", 10),
                  AspectStack("vinculum", 5))
    .outputItems(<thaumcraft:crystal_vitium>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_lumium_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:glowstone_seeds>,
                <thermalfoundation:storage_alloy:6> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_potentia>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("potentia", 100))
    .outputItems(<mysticalagriculture:lumium_seeds>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_spider_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <mysticalagriculture:chunk:14> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_motus>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("motus", 100))
    .outputItems(<mysticalagriculture:spider_seeds>)
    .buildAndRegister();

map.start()
    .name("bewitchment_witches_oven")
    .duration(142)
    .perTick(true).inputFE(4000).perTick(false)
    .inputItems(<divinerpg:mortum_chunk> * 2,
                <thaumcraft:morphic_resonator> * 2,
                <bewitchment:mandrake_root> * 2,
                <bewitchment:hellebore> * 2,
                <thaumcraft:smelter_thaumium>)
    .inputAspects(AspectStack("machina", 240),
                  AspectStack("ignis", 150),
                  AspectStack("sensus", 150),
                  AspectStack("alkimia", 100),
                  AspectStack("fabrico", 30),
                  AspectStack("herba", 30))
    .outputItems(<bewitchment:witches_oven>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_machina")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"machina"}]}) * 8)
    .inputAspects(AspectStack("machina", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_machina>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_spiritus")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"spiritus"}]}) * 8)
    .inputAspects(AspectStack("spiritus", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_spiritus>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_redstone_alloy_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:redstone_seeds>,
                <enderio:block_alloy:3> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_terra>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("terra", 100))
    .outputItems(<mysticalagriculture:redstone_alloy_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_VoidRobeHelm")
    .duration(51)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:void_helm>,
                <thaumcraft:plate:3> * 2,
                <thaumcraft:goggles>,
                <thaumcraft:salis_mundus>,
                <thaumcraft:fabric> * 2)
    .inputAspects(AspectStack("metallum", 50),
                  AspectStack("praemunio", 50),
                  AspectStack("vacuos", 50),
                  AspectStack("potentia", 35),
                  AspectStack("alienis", 35),
                  AspectStack("sensus", 35))
    .outputItems(<thaumcraft:void_robe_helm>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_ignis")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"ignis"}]}) * 8)
    .inputAspects(AspectStack("ignis", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_ignis>)
    .buildAndRegister();

map.start()
    .name("thaumicenergistics_arcane_inscriber")
    .duration(16)
    .perTick(true).inputFE(4000).perTick(false)
    .inputItems(<thaumicenergistics:arcane_terminal>,
                <thaumcraft:mind> * 2,
                <appliedenergistics2:part:340> * 2,
                <contenttweaker:estimation_processor> * 2)
    .inputAspects(AspectStack("machina", 180),
                  AspectStack("cognitio", 180),
                  AspectStack("fabrico", 100),
                  AspectStack("praecantatio", 60),
                  AspectStack("permutatio", 60),
                  AspectStack("vitium", 50))
    .outputItems(<thaumicenergistics:arcane_inscriber>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_primal_cutter")
    .duration(80)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:primordial_pearl>,
                <thaumcraft:void_axe>,
                <thaumcraft:void_sword>,
                <thaumcraft:elemental_axe>,
                <thaumcraft:elemental_sword>)
    .inputAspects(AspectStack("terra", 75),
                  AspectStack("aversio", 75),
                  AspectStack("instrumentum", 50),
                  AspectStack("praecantatio", 50),
                  AspectStack("vacuos", 50),
                  AspectStack("alienis", 50),
                  AspectStack("desiderium", 50))
    .outputItems(<thaumicaugmentation:primal_cutter>.withTag({"infench":[{"lvl":"2s","id":"5s"},{"lvl":"1s","id":"2s"}]}))
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_terra")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"terra"}]}) * 8)
    .inputAspects(AspectStack("terra", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_terra>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_verdant_charm_lifegiver")
    .duration(32)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<thaumcraft:verdant_charm>,
                <minecraft:golden_apple>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"victus"}]}),
                <minecraft:potion>.withTag({"Potion":"minecraft:strong_healing"}),
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"humanus"}]}))
    .inputAspects(AspectStack("victus", 80),
                  AspectStack("humanus", 80))
    .outputItems(<thaumcraft:verdant_charm>.withTag({"type":"1b"}))
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_gold_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <minecraft:gold_block> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_desiderium>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("desiderium", 100))
    .outputItems(<mysticalagriculture:gold_seeds>)
    .buildAndRegister();

map.start()
    .name("lightningcraft_demonstone")
    .duration(16)
    .perTick(true).inputFE(4000).perTick(false)
    .inputItems(<lightningcraft:stone_block>,
                <contenttweaker:dense_demonic_elixir>,
                <lightningcraft:material:5> * 4)
    .inputAspects(AspectStack("diabolus", 40),
                  AspectStack("terra", 20),
                  AspectStack("ignis", 10),
                  AspectStack("vitreus", 10))
    .outputItems(<lightningcraft:stone_block:3>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_energy_pylon")
    .duration(76)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<draconicevolution:wyvern_energy_core>,
                <draconicevolution:draconic_core> * 2,
                <galacticraftcore:basic_item:20> * 2)
    .inputAspects(AspectStack("potentia", 150),
                  AspectStack("permutatio", 150),
                  AspectStack("auram", 80))
    .outputItems(<draconicevolution:energy_pylon>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_elytra_harness_augment")
    .duration(150)
    .perTick(true).inputFE(7000).perTick(false)
    .inputItems(<thaumicaugmentation:material:3>,
                <thaumcraft:plate:3> * 2,
                <contenttweaker:condensed_vis_crystal_vacuos>,
                <thaumicaugmentation:material:5>,
                <contenttweaker:condensed_vis_crystal_alienis>,
                <contenttweaker:magical_leather> * 2,
                <thaumcraft:baubles:6>)
    .inputAspects(AspectStack("volatus", 200),
                  AspectStack("motus", 200),
                  AspectStack("potentia", 200),
                  AspectStack("alienis", 150))
    .outputItems(<thaumicaugmentation:elytra_harness_augment>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_redstone_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <minecraft:redstone_block> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_potentia>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("potentia", 100))
    .outputItems(<mysticalagriculture:redstone_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_fortress_helm_sipping_fiend")
    .duration(36)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:fortress_helm>,
                <thermalfoundation:material:32> * 2,
                <minecraft:dye:1>,
                <minecraft:leather>,
                <minecraft:milk_bucket>,
                <minecraft:ghast_tear>)
    .inputAspects(AspectStack("exanimis", 80),
                  AspectStack("victus", 80),
                  AspectStack("praemunio", 20))
    .outputItems(<thaumcraft:fortress_helm>.withTag({"mask":"0"}))
    .buildAndRegister();

map.start()
    .name("thaumcraft_BootsTraveller")
    .duration(52)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<thaumcraft:cloth_boots>,
                <thaumcraft:fabric> * 2,
                <contenttweaker:magical_leather> * 2,
                <botania:terrasteelboots>,
                <botania:supertravelbelt>)
    .inputAspects(AspectStack("motus", 120),
                  AspectStack("volatus", 120),
                  AspectStack("praemunio", 20))
    .outputItems(<thaumcraft:traveller_boots>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_metallum")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"metallum"}]}) * 8)
    .inputAspects(AspectStack("metallum", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_metallum>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_crystal_ordo")
    .duration(5)
    .perTick(true).inputFE(1000).perTick(false)
    .inputItems(<thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"ordo"}]}),
                <thaumcraft:salis_mundus>,
                <minecraft:wheat_seeds>)
    .inputAspects(AspectStack("ordo", 10),
                  AspectStack("vitreus", 10),
                  AspectStack("vinculum", 5))
    .outputItems(<thaumcraft:crystal_ordo>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_guardian_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <mysticalagriculture:chunk:16> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_aqua>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("aqua", 100))
    .outputItems(<mysticalagriculture:guardian_seeds>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_tool_upgrade_8")
    .duration(28)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<spartanshields:shield_tower_platinum> * 2,
                <draconicevolution:draconic_core> * 4,
                <enderio:block_cap_bank:3> * 2,
                <mysticalagriculture:charm:6>)
    .inputAspects(AspectStack("praemunio", 80),
                  AspectStack("potentia", 60))
    .outputItems(<draconicevolution:tool_upgrade:8>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_SealBreak")
    .duration(16)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<thaumcraft:seal>,
                <thaumcraft:thaumium_pick>,
                <thaumcraft:thaumium_shovel>,
                <openblocks:block_breaker>)
    .inputAspects(AspectStack("instrumentum", 30),
                  AspectStack("perditio", 30),
                  AspectStack("sensus", 20))
    .outputItems(<thaumcraft:seal:12>)
    .buildAndRegister();

map.start()
    .name("bewitchment_sigil_table")
    .duration(110)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<bewitchment:block_of_cold_iron>,
                <bloodmagic:sigil_suppression>,
                <bewitchment:witches_oven>,
                <bloodmagic:sigil_phantom_bridge>,
                <extendedcrafting:table_advanced>)
    .inputAspects(AspectStack("machina", 200),
                  AspectStack("vinculum", 150),
                  AspectStack("diabolus", 100),
                  AspectStack("cognitio", 50),
                  AspectStack("fabrico", 50))
    .outputItems(<bewitchment:sigil_table>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_potentia")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"potentia"}]}) * 8)
    .inputAspects(AspectStack("potentia", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_potentia>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_auram")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"auram"}]}) * 8)
    .inputAspects(AspectStack("auram", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_auram>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_sensus")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"sensus"}]}) * 8)
    .inputAspects(AspectStack("sensus", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_sensus>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_LampGrowth")
    .duration(24)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:lamp_arcane>,
                <botania:quartz:3>,
                <contenttweaker:rune_of_summer>,
                <thaumcraft:ingot> * 2)
    .inputAspects(AspectStack("lux", 40),
                  AspectStack("sol", 20),
                  AspectStack("desiderium", 20),
                  AspectStack("victus", 20),
                  AspectStack("herba", 20))
    .outputItems(<thaumcraft:lamp_growth>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_essence_of_destruction")
    .duration(114)
    .perTick(true).inputFE(8000).perTick(false)
    .inputItems(<projecte:item.pe_destruction_catalyst>,
                <contenttweaker:antimatter_cluster> * 3,
                <thaumcraft:primal_crusher>,
                <contenttweaker:condensed_vis_crystal_perditio>)
    .inputAspects(AspectStack("perditio", 240),
                  AspectStack("diabolus", 100),
                  AspectStack("motus", 100),
                  AspectStack("tenebrae", 50),
                  AspectStack("praecantatio", 50),
                  AspectStack("luna", 20))
    .outputItems(<contenttweaker:essence_of_destruction>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_nickel_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <thermalfoundation:storage:5> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_metallum>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("metallum", 100))
    .outputItems(<mysticalagriculture:nickel_seeds>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_quicksilver_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <thaumcraft:quicksilver> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_mortuus>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("mortuus", 100))
    .outputItems(<mysticalagriculture:quicksilver_seeds>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_jade_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <erebus:jade_block> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_terra>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("terra", 100))
    .outputItems(<mysticalagriculture:jade_seeds>)
    .buildAndRegister();

map.start()
    .name("bewitchment_embittered_brick_witches_altar")
    .duration(33)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<bloodmagic:incense_altar>,
                <contenttweaker:lively_nature>,
                <bewitchment:embittered_bricks> * 2,
                <bewitchment:elder_wood> * 3)
    .inputAspects(AspectStack("machina", 50),
                  AspectStack("terra", 30),
                  AspectStack("auram", 30),
                  AspectStack("herba", 25),
                  AspectStack("praecantatio", 15),
                  AspectStack("ordo", 15))
    .outputItems(<bewitchment:embittered_brick_witches_altar>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_aluminum_brass_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:aluminum_seeds>,
                <tconstruct:metal:5> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_permutatio>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("permutatio", 100))
    .outputItems(<mysticalagriculture:aluminum_brass_seeds>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_constantan_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:nickel_seeds>,
                <thermalfoundation:storage_alloy:4> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_instrumentum>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("instrumentum", 100))
    .outputItems(<mysticalagriculture:constantan_seeds>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_tool_upgrade_10")
    .duration(28)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<draconicevolution:draconic_core> * 4,
                <minecraft:potion>.withTag({"Potion":"cofhcore:swiftness4"}) * 2,
                <mysticalagriculture:charm:9>,
                <teslacorelib:speed_tier2> * 2)
    .inputAspects(AspectStack("motus", 80),
                  AspectStack("praemunio", 60))
    .outputItems(<draconicevolution:tool_upgrade:10>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_bestia")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"bestia"}]}) * 8)
    .inputAspects(AspectStack("bestia", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_bestia>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_MirrorHand")
    .duration(28)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<contenttweaker:rune_of_greed>,
                <botania:autocraftinghalo>,
                <thaumcraft:mirror>,
                <thaumcraft:ingot> * 2)
    .inputAspects(AspectStack("instrumentum", 60),
                  AspectStack("motus", 60),
                  AspectStack("humanus", 20))
    .outputItems(<thaumcraft:hand_mirror>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_praemunio")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"praemunio"}]}) * 8)
    .inputAspects(AspectStack("praemunio", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_praemunio>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_fracture_locator")
    .duration(110)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<contenttweaker:impetus_crystal>,
                <contenttweaker:condensed_vis_crystal_vacuos> * 2,
                <thaumcraft:plate> * 4,
                <thaumcraft:nugget:10> * 2)
    .inputAspects(AspectStack("vacuos", 240),
                  AspectStack("auram", 200),
                  AspectStack("perditio", 100))
    .outputItems(<thaumicaugmentation:fracture_locator>)
    .buildAndRegister();

map.start()
    .name("lightningcraft_underworld_charge")
    .duration(250)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<evilcraft:inverted_potentia>,
                <lightningcraft:stone_block:3> * 2,
                <contenttweaker:condensed_vis_crystal_diabolus> * 2,
                <contenttweaker:condensed_vis_crystal_potentia> * 2)
    .inputAspects(AspectStack("diabolus", 240),
                  AspectStack("tenebrae", 240),
                  AspectStack("potentia", 240),
                  AspectStack("ignis", 240),
                  AspectStack("perditio", 240))
    .outputItems(<lightningcraft:material:6>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_Stabilizer")
    .duration(58)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<thaumcraft:stone_arcane> * 2,
                <thaumcraft:vis_resonator> * 2,
                <thaumcraft:plate:2> * 2,
                <thaumcraft:inlay> * 2,
                <thaumcraft:mechanism_complex>)
    .inputAspects(AspectStack("machina", 100),
                  AspectStack("ordo", 100),
                  AspectStack("potentia", 60),
                  AspectStack("vacuos", 30))
    .outputItems(<thaumcraft:stabilizer>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_vacuos")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"vacuos"}]}) * 8)
    .inputAspects(AspectStack("vacuos", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_vacuos>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_dye_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:mystical_flower_seeds>,
                <mysticalagriculture:crafting:7> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_sensus>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("sensus", 100))
    .outputItems(<mysticalagriculture:dye_seeds>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_glowstone_ingot_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:glowstone_seeds>,
                <mekanism:basicblock:4> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_potentia>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("potentia", 100))
    .outputItems(<mysticalagriculture:glowstone_ingot_seeds>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_platinum_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:nickel_seeds>,
                <thermalfoundation:storage:6> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_praemunio>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("praemunio", 100))
    .outputItems(<mysticalagriculture:platinum_seeds>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_sol")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"sol"}]}) * 8)
    .inputAspects(AspectStack("sol", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_sol>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_gauntlet_2")
    .duration(100)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:plate:3>,
                <thaumcraft:thaumometer>,
                <bewitchment:diabolical_vein> * 2,
                <thaumicaugmentation:gauntlet>,
                <alchemistry:ingot:11> * 2,
                <thaumcraft:fabric> * 2,
                <thaumcraft:vis_resonator>,
                <thaumcraft:voidseer_charm>)
    .inputAspects(AspectStack("alienis", 150),
                  AspectStack("vacuos", 150),
                  AspectStack("potentia", 100),
                  AspectStack("instrumentum", 100))
    .outputItems(<thaumicaugmentation:gauntlet:1>.withTag({"cap":{"slots":"3"},"color":"2498903"}))
    .buildAndRegister();

map.start()
    .name("thaumcraft_MindBiothaumic")
    .duration(28)
    .perTick(true).inputFE(2500).perTick(false)
    .inputItems(<thaumcraft:brain> * 2,
                <thaumcraft:mind>,
                <contenttweaker:rune_of_earth>,
                <thaumcraft:mechanism_complex>)
    .inputAspects(AspectStack("cognitio", 60),
                  AspectStack("machina", 40),
                  AspectStack("herba", 30),
                  AspectStack("bestia", 10))
    .outputItems(<thaumcraft:mind:1>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_tool_upgrade_1")
    .duration(28)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<draconicevolution:draconic_core> * 4,
                <lightningcraft:plate:9> * 4,
                <minecraft:golden_pickaxe>)
    .inputAspects(AspectStack("motus", 80),
                  AspectStack("instrumentum", 60))
    .outputItems(<draconicevolution:tool_upgrade:1>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_SealButcher")
    .duration(16)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<contenttweaker:condensed_vis_crystal_bestia>,
                <thaumcraft:seal>,
                <thaumcraft:thaumium_sword>,
                <industrialforegoing:animal_byproduct_recolector>)
    .inputAspects(AspectStack("bestia", 30),
                  AspectStack("humanus", 30),
                  AspectStack("sensus", 20))
    .outputItems(<thaumcraft:seal:8>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_tool_upgrade_0")
    .duration(28)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<draconicevolution:wyvern_energy_core>,
                <draconicevolution:draconic_core> * 4,
                <enderio:block_cap_bank:3> * 2,
                <draconicevolution:draconium_block> * 2)
    .inputAspects(AspectStack("potentia", 80),
                  AspectStack("instrumentum", 60))
    .outputItems(<draconicevolution:tool_upgrade>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_tier3_crafting_seed")
    .duration(30)
    .perTick(true).inputFE(2500).perTick(false)
    .inputItems(<mysticalagriculture:crafting:18>,
                <mysticalagriculture:crafting:2> * 8)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("praecantatio", 50))
    .outputItems(<mysticalagriculture:crafting:19>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_experience_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <mysticalagriculture:chunk:5> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_cognitio>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("cognitio", 100))
    .outputItems(<mysticalagriculture:experience_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_charm_undying")
    .duration(54)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<thaumcraft:plate>,
                <minecraft:totem_of_undying>)
    .inputAspects(AspectStack("victus", 25))
    .outputItems(<thaumcraft:charm_undying>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_silver_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <thermalfoundation:storage:2> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_desiderium>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("desiderium", 100))
    .outputItems(<mysticalagriculture:silver_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_ElementalAxe")
    .duration(56)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:nugget:10>,
                <contenttweaker:condensed_vis_crystal_aqua> * 2,
                <thaumcraft:ingot> * 4,
                <enderutilities:enderpart:20>,
                <thaumcraft:thaumium_axe>)
    .inputAspects(AspectStack("aqua", 100),
                  AspectStack("instrumentum", 80),
                  AspectStack("herba", 60),
                  AspectStack("aversio", 40))
    .outputItems(<thaumcraft:elemental_axe>.withTag({"infench":[{"lvl":"1s","id":"2s"},{"lvl":"1s","id":"0s"}]}))
    .buildAndRegister();

map.start()
    .name("thaumcraft_crystal_aqua")
    .duration(5)
    .perTick(true).inputFE(1000).perTick(false)
    .inputItems(<thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"aqua"}]}),
                <thaumcraft:salis_mundus>,
                <minecraft:wheat_seeds>)
    .inputAspects(AspectStack("aqua", 10),
                  AspectStack("vitreus", 10),
                  AspectStack("vinculum", 5))
    .outputItems(<thaumcraft:crystal_aqua>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_SealHarvest")
    .duration(16)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<enderio:block_farm_station>,
                <thaumcraft:seal>,
                <mysticalagriculture:crafting:6> * 2)
    .inputAspects(AspectStack("herba", 30),
                  AspectStack("humanus", 30),
                  AspectStack("sensus", 20))
    .outputItems(<thaumcraft:seal:7>)
    .buildAndRegister();

map.start()
    .name("matc_intermediumcrystal")
    .duration(78)
    .perTick(true).inputFE(1000).perTick(false)
    .inputItems(<matc:prudentiumcrystal>,
                <mysticalagriculture:crafting:2> * 4,
                <astralsorcery:itemcraftingcomponent:2> * 4)
    .inputAspects(AspectStack("vitreus", 100),
                  AspectStack("alkimia", 70),
                  AspectStack("herba", 70),
                  AspectStack("praecantatio", 50),
                  AspectStack("instrumentum", 50),
                  AspectStack("ignis", 50))
    .outputItems(<matc:intermediumcrystal>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_impetus_diffuser")
    .duration(130)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<thaumcraft:plate:3> * 3,
                <thaumcraft:morphic_resonator> * 2,
                <thaumicaugmentation:material:5>,
                <thaumcraft:stone_eldritch_tile> * 2,
                <botania:hourglass>)
    .inputAspects(AspectStack("alienis", 200),
                  AspectStack("machina", 200),
                  AspectStack("permutatio", 100),
                  AspectStack("metallum", 100),
                  AspectStack("auram", 50))
    .outputItems(<thaumicaugmentation:impetus_diffuser>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_tin_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <thermalfoundation:storage:1> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_metallum>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("metallum", 100))
    .outputItems(<mysticalagriculture:tin_seeds>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_amber_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <thaumcraft:amber_block> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_vinculum>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("vinculum", 100))
    .outputItems(<mysticalagriculture:amber_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_impetus_drainer")
    .duration(130)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:plate:3> * 4,
                <thaumicaugmentation:material:5>,
                <thaumcraft:stone_eldritch_tile> * 2,
                <thaumicaugmentation:bars>,
                <thaumcraft:metal_void>)
    .inputAspects(AspectStack("alienis", 200),
                  AspectStack("machina", 200),
                  AspectStack("potentia", 100),
                  AspectStack("metallum", 100),
                  AspectStack("auram", 50))
    .outputItems(<thaumicaugmentation:impetus_drainer>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_fortress_helm_goggles_of_revealing")
    .duration(16)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<thaumcraft:fortress_helm>,
                <thaumcraft:goggles>,
                <minecraft:slime_ball>)
    .inputAspects(AspectStack("sensus", 40),
                  AspectStack("auram", 20),
                  AspectStack("praemunio", 20))
    .outputItems(<thaumcraft:fortress_helm>.withTag({"goggles":"1b"}))
    .buildAndRegister();

map.start()
    .name("draconicevolution_tool_upgrade_9")
    .duration(28)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<draconicevolution:draconic_core> * 4,
                <mysticalagriculture:charm:2>,
                <enderio:block_cap_bank:3> * 2,
                <minecraft:potion>.withTag({"Potion":"cofhcore:regeneration4"}) * 2)
    .inputAspects(AspectStack("praemunio", 80),
                  AspectStack("potentia", 60))
    .outputItems(<draconicevolution:tool_upgrade:9>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_void_boots")
    .duration(51)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:plate:3> * 2,
                <contenttweaker:primordial_fragment>,
                <thaumicaugmentation:material:5>,
                <thaumcraft:fabric> * 2,
                <thaumcraft:traveller_boots>)
    .inputAspects(AspectStack("metallum", 50),
                  AspectStack("praemunio", 50),
                  AspectStack("vacuos", 50),
                  AspectStack("potentia", 35),
                  AspectStack("alienis", 35),
                  AspectStack("motus", 35))
    .outputItems(<thaumicaugmentation:void_boots>.withTag({"color":"6961280"}))
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_zombie_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <mysticalagriculture:chunk:6> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_exanimis>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("exanimis", 100))
    .outputItems(<mysticalagriculture:zombie_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_fortress_helm_angry_ghost")
    .duration(36)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:fortress_helm>,
                <thermalfoundation:material:32> * 2,
                <minecraft:dye:15>,
                <minecraft:leather>,
                <minecraft:skull:1>,
                <minecraft:poisonous_potato>)
    .inputAspects(AspectStack("perditio", 80),
                  AspectStack("mortuus", 80),
                  AspectStack("praemunio", 20))
    .outputItems(<thaumcraft:fortress_helm>.withTag({"mask":"1"}))
    .buildAndRegister();

map.start()
    .name("thaumcraft_crystal_aer")
    .duration(5)
    .perTick(true).inputFE(1000).perTick(false)
    .inputItems(<thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"aer"}]}),
                <thaumcraft:salis_mundus>,
                <minecraft:wheat_seeds>)
    .inputAspects(AspectStack("aer", 10),
                  AspectStack("vitreus", 10),
                  AspectStack("vinculum", 5))
    .outputItems(<thaumcraft:crystal_aer>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_arcane_terraformer")
    .duration(220)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<thaumicaugmentation:material:5>,
                <contenttweaker:condensed_vis_crystal_terra> * 2,
                <thaumcraft:potion_sprayer>,
                <thaumcraft:mechanism_complex> * 2,
                <thaumicaugmentation:impetus_diffuser>,
                <thaumcraft:metal_thaumium> * 2)
    .inputAspects(AspectStack("machina", 240),
                  AspectStack("terra", 240),
                  AspectStack("permutatio", 200),
                  AspectStack("potentia", 150),
                  AspectStack("auram", 150),
                  AspectStack("sensus", 100))
    .outputItems(<thaumicaugmentation:arcane_terraformer>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_infernium_seed")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:tier2_inferium_seeds>,
                <mysticalagriculture:crafting:2> * 8)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("praecantatio", 50))
    .outputItems(<mysticalagriculture:tier3_inferium_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_JarBrain")
    .duration(28)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<contenttweaker:rune_of_greed>,
                <contenttweaker:rune_of_pride>,
                <thaumcraft:jar_normal>,
                <thaumcraft:ingot>,
                <thaumcraft:brain>)
    .inputAspects(AspectStack("cognitio", 60),
                  AspectStack("exanimis", 50),
                  AspectStack("sensus", 30))
    .outputItems(<thaumcraft:jar_brain>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_focus_2")
    .duration(44)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<thaumcraft:vis_resonator>,
                <thaumcraft:alumentum> * 2,
                <alchemistry:ingot:11>,
                <thaumcraft:ingot> * 2,
                <thaumcraft:focus_1>)
    .inputAspects(AspectStack("vitreus", 80),
                  AspectStack("praecantatio", 40),
                  AspectStack("ordo", 40),
                  AspectStack("instrumentum", 40),
                  AspectStack("auram", 20))
    .outputItems(<thaumcraft:focus_2>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_exanimis")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"exanimis"}]}) * 8)
    .inputAspects(AspectStack("exanimis", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_exanimis>)
    .buildAndRegister();

map.start()
    .name("bewitchment_stone_witches_altar")
    .duration(33)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<bloodmagic:incense_altar>,
                <contenttweaker:lively_nature>,
                <ore:stone> * 2,
                <bewitchment:elder_wood> * 3)
    .inputAspects(AspectStack("machina", 50),
                  AspectStack("terra", 30),
                  AspectStack("auram", 30),
                  AspectStack("herba", 25),
                  AspectStack("praecantatio", 15),
                  AspectStack("ordo", 15))
    .outputItems(<bewitchment:stone_witches_altar>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_tier3_mob_chunk")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:chunk:1>,
                <mysticalagriculture:crafting:2> * 4)
    .inputAspects(AspectStack("bestia", 100),
                  AspectStack("victus", 50),
                  AspectStack("aversio", 50))
    .outputItems(<mysticalagriculture:chunk:2>)
    .buildAndRegister();

map.start()
    .name("bewitchment_nether_brick_witches_altar")
    .duration(33)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<bloodmagic:incense_altar>,
                <contenttweaker:lively_nature>,
                <minecraft:nether_brick> * 2,
                <bewitchment:elder_wood> * 3)
    .inputAspects(AspectStack("machina", 50),
                  AspectStack("terra", 30),
                  AspectStack("auram", 30),
                  AspectStack("herba", 25),
                  AspectStack("praecantatio", 15),
                  AspectStack("ordo", 15))
    .outputItems(<bewitchment:nether_brick_witches_altar>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_nether_quartz_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <minecraft:quartz_block> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_vitreus>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("vitreus", 100))
    .outputItems(<mysticalagriculture:nether_quartz_seeds>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_alienis")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"alienis"}]}) * 8)
    .inputAspects(AspectStack("alienis", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_alienis>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_rift_mover_input")
    .duration(140)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<thaumcraft:plate:3> * 4,
                <contenttweaker:condensed_vis_crystal_praecantatio>,
                <contenttweaker:condensed_vis_crystal_machina>,
                <thaumicaugmentation:material:5>,
                <thaumcraft:stone_eldritch_tile>,
                <thaumcraft:mechanism_complex>)
    .inputAspects(AspectStack("vinculum", 150),
                  AspectStack("machina", 150),
                  AspectStack("vacuos", 100),
                  AspectStack("vitium", 100),
                  AspectStack("alienis", 100),
                  AspectStack("permutatio", 100))
    .outputItems(<thaumicaugmentation:rift_mover_input>)
    .buildAndRegister();

map.start()
    .name("bewitchment_distillery")
    .duration(160)
    .perTick(true).inputFE(4000).perTick(false)
    .inputItems(<bewitchment:block_of_opal> * 3,
                <enderio:block_enhanced_vat> * 3,
                <bewitchment:witches_oven>,
                <thaumcraft:essentia_input> * 2)
    .inputAspects(AspectStack("machina", 240),
                  AspectStack("aqua", 200),
                  AspectStack("vacuos", 150),
                  AspectStack("alkimia", 100),
                  AspectStack("ignis", 100))
    .outputItems(<bewitchment:distillery>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_glowstone_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <minecraft:glowstone> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_lux>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("lux", 100))
    .outputItems(<mysticalagriculture:glowstone_seeds>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_vitreus")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"vitreus"}]}) * 8)
    .inputAspects(AspectStack("vitreus", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_vitreus>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_alkimia")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"alkimia"}]}) * 8)
    .inputAspects(AspectStack("alkimia", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_alkimia>)
    .buildAndRegister();

map.start()
    .name("draconicadditions_infused_potato_chestplate")
    .duration(46)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<draconicadditions:inert_potato_chest>,
                <draconicevolution:draconic_core>,
                <draconicevolution:wyvern_energy_core>,
                <draconicevolution:draconium_ingot> * 6)
    .inputAspects(AspectStack("praemunio", 100),
                  AspectStack("herba", 80),
                  AspectStack("terra", 30),
                  AspectStack("praecantatio", 20))
    .outputItems(<draconicadditions:infused_potato_chest>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_copper_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <thermalfoundation:storage> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_permutatio>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("permutatio", 100))
    .outputItems(<mysticalagriculture:copper_seeds>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_tool_upgrade_3")
    .duration(28)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<mysticalagriculture:charm:8>,
                <draconicevolution:draconic_core> * 4,
                <minecraft:potion>.withTag({"Potion":"cofhcore:strength3+"}) * 2,
                <lightningcraft:plate:9> * 2)
    .inputAspects(AspectStack("aversio", 80),
                  AspectStack("instrumentum", 60))
    .outputItems(<draconicevolution:tool_upgrade:3>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_fancyBelt")
    .duration(12)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<contenttweaker:empowered_glod_crystal>,
                <thaumcraft:ingot:2> * 2,
                <thaumcraft:baubles:2>,
                <actuallyadditions:item_crystal_empowered:2>)
    .inputAspects(AspectStack("desiderium", 40),
                  AspectStack("instrumentum", 10),
                  AspectStack("vitreus", 10))
    .outputItems(<thaumcraft:baubles:6>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_ThaumiumFortressLegs")
    .duration(40)
    .perTick(true).inputFE(2500).perTick(false)
    .inputItems(<contenttweaker:magical_leather> * 3,
                <thaumcraft:plate:2> * 4,
                <thaumcraft:plate>,
                <thaumcraft:thaumium_legs>)
    .inputAspects(AspectStack("praemunio", 100),
                  AspectStack("metallum", 60),
                  AspectStack("potentia", 40))
    .outputItems(<thaumcraft:fortress_legs>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_vis_regenerator")
    .duration(42)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:stone_eldritch_tile> * 4,
                <contenttweaker:condensed_vis_crystal_aer> * 2,
                <thaumicaugmentation:bars>,
                <thaumcraft:mechanism_complex>,
                <thaumicaugmentation:material>)
    .inputAspects(AspectStack("machina", 50),
                  AspectStack("aer", 50),
                  AspectStack("ordo", 50),
                  AspectStack("auram", 30),
                  AspectStack("potentia", 30))
    .outputItems(<thaumicaugmentation:vis_regenerator>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_fancyRing")
    .duration(12)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<contenttweaker:empowered_glod_crystal>,
                <thaumcraft:ingot:2> * 2,
                <thaumcraft:baubles:1>,
                <actuallyadditions:item_crystal_empowered:2>)
    .inputAspects(AspectStack("desiderium", 40),
                  AspectStack("instrumentum", 10),
                  AspectStack("vitreus", 10))
    .outputItems(<thaumcraft:baubles:5>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_rainbow_tablet")
    .duration(24)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<contenttweaker:rainbow_slate> * 4,
                <botania:manaresource:14> * 4,
                <contenttweaker:plasma_core>)
    .inputAspects(AspectStack("victus", 99),
                  AspectStack("ignis", 99),
                  AspectStack("sol", 99),
                  AspectStack("herba", 99),
                  AspectStack("instrumentum", 99),
                  AspectStack("praecantatio", 99))
    .outputItems(<contenttweaker:rainbow_tablet> * 32)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_black_quartz_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <actuallyadditions:block_misc:2> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_tenebrae>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("tenebrae", 100))
    .outputItems(<mysticalagriculture:black_quartz_seeds>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_tool_upgrade_6")
    .duration(28)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<draconicevolution:draconic_core> * 4,
                <lightningcraft:plate:9> * 2,
                <mysticalagriculture:charm:13>,
                <mysticalagriculture:supremium_arrow> * 2)
    .inputAspects(AspectStack("motus", 80),
                  AspectStack("volatus", 60))
    .outputItems(<draconicevolution:tool_upgrade:6>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_end_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <mysticalagriculture:crafting:9> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_alienis>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("alienis", 100))
    .outputItems(<mysticalagriculture:end_seeds>)
    .buildAndRegister();

map.start()
    .name("draconicadditions_infused_potato_boots")
    .duration(46)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<draconicadditions:inert_potato_boots>,
                <draconicevolution:draconic_core>,
                <draconicevolution:wyvern_energy_core>,
                <draconicevolution:draconium_ingot> * 6)
    .inputAspects(AspectStack("praemunio", 100),
                  AspectStack("herba", 80),
                  AspectStack("terra", 30),
                  AspectStack("praecantatio", 20))
    .outputItems(<draconicadditions:infused_potato_boots>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_diabolus")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"diabolus"}]}) * 8)
    .inputAspects(AspectStack("diabolus", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_diabolus>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_luna")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"luna"}]}) * 8)
    .inputAspects(AspectStack("luna", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_luna>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_blaze_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <mysticalagriculture:chunk:17> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_ignis>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("ignis", 100))
    .outputItems(<mysticalagriculture:blaze_seeds>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_certus_quartz_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <appliedenergistics2:quartz_block> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_vitreus>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("vitreus", 100))
    .outputItems(<mysticalagriculture:certus_quartz_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_fancyAmulet")
    .duration(12)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<contenttweaker:empowered_glod_crystal>,
                <thaumcraft:ingot:2> * 2,
                <thaumcraft:baubles>,
                <actuallyadditions:item_crystal_empowered:2>)
    .inputAspects(AspectStack("desiderium", 40),
                  AspectStack("instrumentum", 10),
                  AspectStack("vitreus", 10))
    .outputItems(<thaumcraft:baubles:4>)
    .buildAndRegister();

map.start()
    .name("bewitchment_horseshoe")
    .duration(40)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<bewitchment:pure_filament>,
                <contenttweaker:travelers_tenacity>,
                <bewitchment:cold_iron_ingot> * 6,
                <bewitchment:hoof>)
    .inputAspects(AspectStack("motus", 100),
                  AspectStack("metallum", 50),
                  AspectStack("praemunio", 50))
    .outputItems(<bewitchment:horseshoe>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_vitium")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"vitium"}]}) * 8)
    .inputAspects(AspectStack("vitium", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_vitium>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_creeper_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <mysticalagriculture:chunk:13> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_perditio>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("perditio", 100))
    .outputItems(<mysticalagriculture:creeper_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_verdant_charm")
    .duration(30)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<thaumcraft:baubles:4>,
                <thaumcraft:nugget:10>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"victus"}]}),
                <minecraft:milk_bucket>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"herba"}]}))
    .inputAspects(AspectStack("victus", 60),
                  AspectStack("herba", 60),
                  AspectStack("ordo", 30))
    .outputItems(<thaumcraft:verdant_charm>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_voidseer_charm")
    .duration(200)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<contenttweaker:primordial_fragment>,
                <thaumicaugmentation:material:5>,
                <alchemistry:ingot:11> * 2,
                <contenttweaker:rune_of_pride>,
                <thaumcraft:void_seed> * 2,
                <contenttweaker:rune_of_greed>,
                <thaumcraft:baubles:4>)
    .inputAspects(AspectStack("cognitio", 240),
                  AspectStack("vacuos", 240),
                  AspectStack("praecantatio", 240),
                  AspectStack("alienis", 240))
    .outputItems(<thaumcraft:voidseer_charm>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_blitz_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <mysticalagriculture:chunk:22> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_ignis>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("ignis", 100))
    .outputItems(<mysticalagriculture:blitz_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_verdant_charm_sustainer")
    .duration(32)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<thaumcraft:verdant_charm>,
                <thaumcraft:triple_meat_treat>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"desiderium"}]}),
                <minecraft:potion>.withTag({"Potion":"minecraft:strong_regeneration"}),
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"aer"}]}))
    .inputAspects(AspectStack("desiderium", 80),
                  AspectStack("aer", 80))
    .outputItems(<thaumcraft:verdant_charm>.withTag({"type":"2b"}))
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_blizz_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <mysticalagriculture:chunk:21> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_gelum>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("gelum", 100))
    .outputItems(<mysticalagriculture:blizz_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_impetus_mirror")
    .duration(100)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<contenttweaker:condensed_vis_crystal_vitreus>,
                <thaumcraft:plate:3> * 2,
                <thaumcraft:mirror_essentia>,
                <thaumicaugmentation:material:5>,
                <thaumcraft:stone_eldritch_tile> * 4)
    .inputAspects(AspectStack("vitreus", 100),
                  AspectStack("permutatio", 150),
                  AspectStack("motus", 150),
                  AspectStack("potentia", 100))
    .outputItems(<thaumicaugmentation:impetus_mirror>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_desiderium")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"desiderium"}]}) * 8)
    .inputAspects(AspectStack("desiderium", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_desiderium>)
    .buildAndRegister();

map.start()
    .name("draconicadditions_infused_potato_helm")
    .duration(46)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<draconicadditions:inert_potato_helm>,
                <draconicevolution:draconic_core>,
                <draconicevolution:wyvern_energy_core>,
                <draconicevolution:draconium_ingot> * 6)
    .inputAspects(AspectStack("praemunio", 100),
                  AspectStack("herba", 80),
                  AspectStack("terra", 30),
                  AspectStack("praecantatio", 20))
    .outputItems(<draconicadditions:infused_potato_helm>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_bronze_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:copper_seeds>,
                <thermalfoundation:storage_alloy:3> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_instrumentum>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("instrumentum", 100))
    .outputItems(<mysticalagriculture:bronze_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_warding_sigil")
    .duration(44)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<thaumcraft:seal>,
                <thaumcraft:tallow>,
                <contenttweaker:infused_magical_core>,
                <thaumcraft:plate:2> * 4)
    .inputAspects(AspectStack("vinculum", 100),
                  AspectStack("auram", 50),
                  AspectStack("praecantatio", 50),
                  AspectStack("instrumentum", 20))
    .outputItems(<thaumicaugmentation:material:1>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_lead_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <thermalfoundation:storage:3> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_ordo>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("ordo", 100))
    .outputItems(<mysticalagriculture:lead_seeds>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_lapis_lazuli_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <minecraft:lapis_block> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_terra>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("terra", 100))
    .outputItems(<mysticalagriculture:lapis_lazuli_seeds>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_osmium_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <mekanism:basicblock> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_metallum>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("metallum", 100))
    .outputItems(<mysticalagriculture:osmium_seeds>)
    .buildAndRegister();

map.start()
    .name("bewitchment_scorned_brick_witches_altar")
    .duration(33)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<bloodmagic:incense_altar>,
                <contenttweaker:lively_nature>,
                <bewitchment:scorned_bricks> * 2,
                <bewitchment:elder_wood> * 3)
    .inputAspects(AspectStack("machina", 50),
                  AspectStack("terra", 30),
                  AspectStack("auram", 30),
                  AspectStack("herba", 25),
                  AspectStack("praecantatio", 15),
                  AspectStack("ordo", 15))
    .outputItems(<bewitchment:scorned_brick_witches_altar>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_tool_upgrade_11")
    .duration(28)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<draconicevolution:draconic_core> * 4,
                <mysticalagriculture:charm:10>,
                <tconstruct:slime_boots> * 2,
                <minecraft:potion>.withTag({"Potion":"cofhcore:leaping4"}) * 2)
    .inputAspects(AspectStack("motus", 80),
                  AspectStack("volatus", 60))
    .outputItems(<draconicevolution:tool_upgrade:11>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_AlchemicalConstruct")
    .duration(8)
    .perTick(true).inputFE(1000).perTick(false)
    .inputItems(<thaumcraft:stone_arcane> * 4,
                <contenttweaker:cosmic_alloy>,
                <thaumcraft:tube_valve> * 2,
                <thaumcraft:tube> * 2)
    .inputAspects(AspectStack("alkimia", 20),
                  AspectStack("machina", 20))
    .outputItems(<thaumcraft:metal_alchemical>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_fortress_helm_grinning_devil")
    .duration(36)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:fortress_helm>,
                <thermalfoundation:material:32> * 2,
                <minecraft:dye>,
                <minecraft:leather>,
                <thaumcraft:shimmerleaf>,
                <thaumcraft:brain>)
    .inputAspects(AspectStack("cognitio", 80),
                  AspectStack("victus", 80),
                  AspectStack("praemunio", 20))
    .outputItems(<thaumcraft:fortress_helm>.withTag({"mask":"0"}))
    .buildAndRegister();

map.start()
    .name("thaumcraft_Mirror")
    .duration(24)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<thaumcraft:mirrored_glass>,
                <contenttweaker:rune_of_deception>,
                <alchemistry:ingot:11>,
                <contenttweaker:holy_core> * 2)
    .inputAspects(AspectStack("permutatio", 40),
                  AspectStack("motus", 30),
                  AspectStack("desiderium", 30),
                  AspectStack("vacuos", 20))
    .outputItems(<thaumcraft:mirror>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_iron_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <minecraft:iron_block> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_metallum>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("metallum", 100))
    .outputItems(<mysticalagriculture:iron_seeds>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_invar_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:iron_seeds>,
                <thermalfoundation:storage_alloy:2> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_instrumentum>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("instrumentum", 100))
    .outputItems(<mysticalagriculture:invar_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_ElementalPick")
    .duration(56)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:thaumium_pick>,
                <contenttweaker:condensed_vis_crystal_ignis> * 2,
                <thaumcraft:nugget:10> * 2,
                <thaumcraft:ingot> * 3,
                <enderutilities:enderpart:20>)
    .inputAspects(AspectStack("ignis", 100),
                  AspectStack("instrumentum", 80),
                  AspectStack("aversio", 40),
                  AspectStack("metallum", 30),
                  AspectStack("sensus", 30))
    .outputItems(<thaumcraft:elemental_pick>.withTag({"infench":[{"lvl":"1s","id":"4s"},{"lvl":"2s","id":"3s"}]}))
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_refined_obsidian_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:obsidian_seeds>,
                <mekanism:basicblock:2> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_potentia>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("potentia", 100))
    .outputItems(<mysticalagriculture:refined_obsidian_seeds>)
    .buildAndRegister();

map.start()
    .name("cloud_ring")
    .duration(10)
    .perTick(true).inputFE(1000).perTick(false)
    .inputItems(<thaumcraft:baubles:1>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"aer"}]}),
                <minecraft:feather>)
    .inputAspects(AspectStack("aer", 50))
    .outputItems(<thaumcraft:cloud_ring>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_ElementalHoe")
    .duration(56)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<contenttweaker:condensed_vis_crystal_ordo> * 2,
                <thaumcraft:nugget:10> * 2,
                <thaumcraft:thaumium_hoe>,
                <enderutilities:enderpart:20>,
                <thaumcraft:ingot> * 3)
    .inputAspects(AspectStack("ordo", 100),
                  AspectStack("instrumentum", 80),
                  AspectStack("herba", 60),
                  AspectStack("perditio", 40))
    .outputItems(<thaumcraft:elemental_hoe>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_VoidRobeLegs")
    .duration(44)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:plate:3> * 2,
                <thaumcraft:cloth_legs>,
                <contenttweaker:magical_leather>,
                <thaumcraft:salis_mundus>,
                <thaumcraft:fabric>,
                <thaumcraft:void_legs>)
    .inputAspects(AspectStack("metallum", 50),
                  AspectStack("praemunio", 50),
                  AspectStack("vacuos", 50),
                  AspectStack("potentia", 35),
                  AspectStack("alienis", 35))
    .outputItems(<thaumcraft:void_robe_legs>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_fabrico")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"fabrico"}]}) * 8)
    .inputAspects(AspectStack("fabrico", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_fabrico>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_menril_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <integrateddynamics:crystalized_menril_block> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_vitreus>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("vitreus", 100))
    .outputItems(<mysticalagriculture:menril_seeds>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_volatus")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"volatus"}]}) * 8)
    .inputAspects(AspectStack("volatus", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_volatus>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_impulse_cannon")
    .duration(152)
    .perTick(true).inputFE(7000).perTick(false)
    .inputItems(<thaumcraft:focus_3>,
                <thaumicaugmentation:material:3>,
                <thaumcraft:plate:3> * 2,
                <thaumcraft:morphic_resonator> * 2,
                <thaumcraft:inlay> * 2,
                <thaumicaugmentation:stability_field_generator>,
                <thaumicaugmentation:material:5> * 2,
                <contenttweaker:condensed_vis_crystal_aversio> * 2)
    .inputAspects(AspectStack("alienis", 150),
                  AspectStack("aversio", 150),
                  AspectStack("potentia", 150),
                  AspectStack("machina", 100),
                  AspectStack("mortuus", 100),
                  AspectStack("vacuos", 60),
                  AspectStack("tenebrae", 50))
    .outputItems(<thaumicaugmentation:impulse_cannon>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_lux")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"lux"}]}) * 8)
    .inputAspects(AspectStack("lux", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_lux>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_gelum")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"gelum"}]}) * 8)
    .inputAspects(AspectStack("gelum", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_gelum>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_ElementalShovel")
    .duration(56)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:nugget:10> * 2,
                <thaumcraft:thaumium_shovel>,
                <thaumcraft:ingot> * 3,
                <enderutilities:enderpart:20>,
                <contenttweaker:condensed_vis_crystal_terra> * 2)
    .inputAspects(AspectStack("terra", 100),
                  AspectStack("instrumentum", 80),
                  AspectStack("fabrico", 60),
                  AspectStack("herba", 40))
    .outputItems(<thaumcraft:elemental_shovel>.withTag({"infench":[{"lvl":"1s","id":"1s"}]}))
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_autocaster_placer")
    .duration(130)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<thaumcraft:morphic_resonator> * 2,
                <thaumcraft:plate> * 2,
                <thaumcraft:mind:1>,
                <thaumicaugmentation:gauntlet:1>,
                <thaumcraft:mechanism_complex>,
                <thaumcraft:vis_resonator> * 2)
    .inputAspects(AspectStack("machina", 200),
                  AspectStack("aversio", 200),
                  AspectStack("cognitio", 150),
                  AspectStack("sensus", 50),
                  AspectStack("auram", 50))
    .outputItems(<thaumicaugmentation:autocaster_placer>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_stability_field_generator")
    .duration(128)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:plate> * 2,
                <thaumicaugmentation:material:5>,
                <thaumcraft:stone_arcane> * 3,
                <contenttweaker:condensed_vis_crystal_auram> * 2,
                <thaumcraft:stabilizer>)
    .inputAspects(AspectStack("machina", 200),
                  AspectStack("ordo", 200),
                  AspectStack("potentia", 120),
                  AspectStack("vacuos", 60),
                  AspectStack("auram", 60))
    .outputItems(<thaumicaugmentation:stability_field_generator>)
    .buildAndRegister();

map.start()
    .name("draconicadditions_infused_potato_leggings")
    .duration(46)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<draconicadditions:inert_potato_legs>,
                <draconicevolution:draconic_core>,
                <draconicevolution:wyvern_energy_core>,
                <draconicevolution:draconium_ingot> * 6)
    .inputAspects(AspectStack("praemunio", 100),
                  AspectStack("herba", 80),
                  AspectStack("terra", 30),
                  AspectStack("praecantatio", 20))
    .outputItems(<draconicadditions:infused_potato_legs>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_ordo")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"ordo"}]}) * 8)
    .inputAspects(AspectStack("ordo", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_ordo>)
    .buildAndRegister();

map.start()
    .name("bewitchment_obsidian_witches_altar")
    .duration(33)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<bloodmagic:incense_altar>,
                <contenttweaker:lively_nature>,
                <ore:obsidian> * 2,
                <bewitchment:elder_wood> * 3)
    .inputAspects(AspectStack("machina", 50),
                  AspectStack("terra", 30),
                  AspectStack("auram", 30),
                  AspectStack("herba", 25),
                  AspectStack("praecantatio", 15),
                  AspectStack("ordo", 15))
    .outputItems(<bewitchment:obsidian_witches_altar>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_elytra_harness")
    .duration(70)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:plate:3> * 2,
                <contenttweaker:condensed_vis_crystal_volatus> * 2,
                <minecraft:elytra>,
                <thaumicaugmentation:material:4>,
                <thaumcraft:vis_resonator>)
    .inputAspects(AspectStack("volatus", 150),
                  AspectStack("motus", 100),
                  AspectStack("potentia", 100))
    .outputItems(<thaumicaugmentation:elytra_harness>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_cognitio")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"cognitio"}]}) * 8)
    .inputAspects(AspectStack("cognitio", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_cognitio>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_electrum_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:gold_seeds>,
                <thermalfoundation:storage_alloy:1> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_potentia>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("potentia", 100))
    .outputItems(<mysticalagriculture:electrum_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_ThaumiumFortressHelm")
    .duration(40)
    .perTick(true).inputFE(2500).perTick(false)
    .inputItems(<contenttweaker:magical_leather> * 3,
                <thaumcraft:thaumium_helm>,
                <thaumcraft:plate:2> * 2,
                <thaumcraft:plate> * 3)
    .inputAspects(AspectStack("praemunio", 100),
                  AspectStack("metallum", 60),
                  AspectStack("potentia", 40))
    .outputItems(<thaumcraft:fortress_helm>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_thaumostatic_harness_augment_1")
    .duration(45)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<contenttweaker:magical_leather> * 2,
                <contenttweaker:condensed_vis_crystal_volatus>,
                <contenttweaker:travelers_tenacity>,
                <thaumcraft:baubles:6>)
    .inputAspects(AspectStack("aer", 100),
                  AspectStack("motus", 75),
                  AspectStack("volatus", 50))
    .outputItems(<thaumicaugmentation:thaumostatic_harness_augment:1>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_herba")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"herba"}]}) * 8)
    .inputAspects(AspectStack("herba", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_herba>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_MirrorEssentia")
    .duration(28)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<contenttweaker:rune_of_lust>,
                <thaumcraft:mirror>,
                <thaumcraft:ingot> * 3)
    .inputAspects(AspectStack("motus", 40),
                  AspectStack("aqua", 40),
                  AspectStack("permutatio", 30),
                  AspectStack("auram", 20),
                  AspectStack("ordo", 10))
    .outputItems(<thaumcraft:mirror_essentia>)
    .buildAndRegister();

map.start()
    .name("rftools_infused_enderpearl")
    .duration(58)
    .perTick(true).inputFE(7000).perTick(false)
    .inputItems(<botania:manaresource:1>,
                <rftools:dimensional_shard> * 4,
                <avaritia:resource:1> * 4,
                <extendedcrafting:material:24> * 2)
    .inputAspects(AspectStack("vitreus", 100),
                  AspectStack("auram", 100),
                  AspectStack("alienis", 50),
                  AspectStack("sol", 20),
                  AspectStack("praecantatio", 20))
    .outputItems(<rftools:infused_enderpearl>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_CuriosityBand")
    .duration(100)
    .perTick(true).inputFE(2500).perTick(false)
    .inputItems(<actuallyadditions:block_xp_solidifier>,
                <thaumcraft:scribing_tools> * 2,
                <actuallyadditions:block_crystal_empowered:4>,
                <thaumcraft:baubles:6>)
    .inputAspects(AspectStack("cognitio", 200),
                  AspectStack("vinculum", 150),
                  AspectStack("humanus", 50),
                  AspectStack("volatus", 50),
                  AspectStack("vacuos", 50))
    .outputItems(<thaumcraft:curiosity_band>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_seal_copier")
    .duration(17)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<contenttweaker:condensed_vis_crystal_cognitio> * 2,
                <thaumcraft:seal>,
                <thaumcraft:plate:2> * 2,
                <thaumcraft:golem_bell>,
                <thaumcraft:resonator>,
                <evilcraft:dark_stick> * 2)
    .inputAspects(AspectStack("cognitio", 30),
                  AspectStack("instrumentum", 30),
                  AspectStack("machina", 15),
                  AspectStack("humanus", 10))
    .outputItems(<thaumicaugmentation:seal_copier>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_basalz_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <mysticalagriculture:chunk:23> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_perditio>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("perditio", 100))
    .outputItems(<mysticalagriculture:basalz_seeds>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_tenebrae")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"tenebrae"}]}) * 8)
    .inputAspects(AspectStack("tenebrae", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_tenebrae>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_praecantatio")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"praecantatio"}]}) * 8)
    .inputAspects(AspectStack("praecantatio", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_praecantatio>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_moon_stone_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:lapis_lazuli_seeds>,
                <extrautils2:ingredients:5> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_luna>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("luna", 100))
    .outputItems(<mysticalagriculture:moonstone_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_crystal_perditio")
    .duration(5)
    .perTick(true).inputFE(1000).perTick(false)
    .inputItems(<thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"perditio"}]}),
                <thaumcraft:salis_mundus>,
                <minecraft:wheat_seeds>)
    .inputAspects(AspectStack("perditio", 10),
                  AspectStack("vitreus", 10),
                  AspectStack("vinculum", 5))
    .outputItems(<thaumcraft:crystal_perditio>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_intermedium_ingot")
    .duration(4)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<mysticalagriculture:crafting:34>,
                <mysticalagriculture:crafting:2> * 2)
    .inputAspects(AspectStack("metallum", 10),
                  AspectStack("praecantatio", 10))
    .outputItems(<mysticalagriculture:crafting:35>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_perditio")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"perditio"}]}) * 8)
    .inputAspects(AspectStack("perditio", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_perditio>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_energy_storage_core")
    .duration(122)
    .perTick(true).inputFE(7000).perTick(false)
    .inputItems(<draconicevolution:wyvern_core>,
                <draconicevolution:wyvern_energy_core> * 4,
                <enderio:block_cap_bank:3> * 4,
                <galacticraftplanets:basic_item_venus:6> * 4)
    .inputAspects(AspectStack("potentia", 240),
                  AspectStack("ignis", 120),
                  AspectStack("lux", 120),
                  AspectStack("auram", 80),
                  AspectStack("diabolus", 40))
    .outputItems(<draconicevolution:energy_storage_core>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_fluix_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:certus_quartz_seeds>,
                <appliedenergistics2:fluix_block> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_potentia>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("potentia", 100))
    .outputItems(<mysticalagriculture:fluix_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumicenergistics_blank_knowledge_core")
    .duration(16)
    .perTick(true).inputFE(8000).perTick(false)
    .inputItems(<thaumcraft:jar_brain>,
                <thaumcraft:focus_3> * 2,
                <thaumicaugmentation:fortified_glass> * 2)
    .inputAspects(AspectStack("cognitio", 180),
                  AspectStack("fabrico", 100),
                  AspectStack("praemunio", 100),
                  AspectStack("potentia", 80),
                  AspectStack("vinculum", 80),
                  AspectStack("exanimis", 10),
                  AspectStack("vacuos", 10))
    .outputItems(<thaumicenergistics:blank_knowledge_core>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_aer")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"aer"}]}) * 8)
    .inputAspects(AspectStack("aer", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_aer>)
    .buildAndRegister();

map.start()
    .name("bewitchment_ritual_chalk")
    .duration(8)
    .perTick(true).inputFE(1500).perTick(false)
    .inputItems(<undergroundbiomes:sedimentary_stone:1>,
                <contenttweaker:gypsum> * 3,
                <bewitchment:salt> * 3)
    .inputAspects(AspectStack("terra", 20),
                  AspectStack("cognitio", 10),
                  AspectStack("praecantatio", 10))
    .outputItems(<bewitchment:ritual_chalk>)
    .buildAndRegister();

map.start()
    .name("bewitchment_witches_cauldron")
    .duration(130)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<divinerpg:mortum_chunk> * 2,
                <contenttweaker:witches_delicacy>,
                <thaumcraft:crucible>,
                <thaumcraft:metal_alchemical> * 2)
    .inputAspects(AspectStack("alkimia", 240),
                  AspectStack("metallum", 200),
                  AspectStack("machina", 100),
                  AspectStack("fabrico", 100))
    .outputItems(<bewitchment:witches_cauldron>)
    .buildAndRegister();

map.start()
    .name("rftools_infused_diamond")
    .duration(58)
    .perTick(true).inputFE(7000).perTick(false)
    .inputItems(<botania:manaresource:2>,
                <rftools:dimensional_shard> * 4,
                <avaritia:resource:1> * 4,
                <extendedcrafting:material:24> * 2)
    .inputAspects(AspectStack("vitreus", 100),
                  AspectStack("auram", 100),
                  AspectStack("desiderium", 50),
                  AspectStack("sol", 20),
                  AspectStack("praecantatio", 20))
    .outputItems(<rftools:infused_diamond>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_amulet_vis")
    .duration(40)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<thaumcraft:baubles>,
                <thaumcraft:vis_resonator>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"aer"}]}),
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"ignis"}]}),
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"aqua"}]}),
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"terra"}]}),
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"ordo"}]}))
    .inputAspects(AspectStack("potentia", 100),
                  AspectStack("auram", 50),
                  AspectStack("vacuos", 50))
    .outputItems(<thaumcraft:amulet_vis:1>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_CausalityCollapser")
    .duration(26)
    .perTick(true).inputFE(5000).perTick(false)
    .inputItems(<thaumcraft:morphic_resonator>,
                <contenttweaker:brew_of_the_void> * 2,
                <thaumcraft:alumentum> * 2,
                <thaumcraft:vis_resonator>,
                <thaumcraft:nitor_pink> * 2,
                <mekanism:obsidiantnt>)
    .inputAspects(AspectStack("perditio", 40),
                  AspectStack("potentia", 30),
                  AspectStack("alienis", 30),
                  AspectStack("vitium", 30))
    .outputItems(<thaumcraft:causality_collapser>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_void_recharge_pedestal")
    .duration(158)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<thaumcraft:plate:3> * 2,
                <contenttweaker:condensed_vis_crystal_alienis> * 2,
                <thaumicaugmentation:material:5>,
                <thaumcraft:stone_eldritch_tile> * 3,
                <thaumcraft:recharge_pedestal>)
    .inputAspects(AspectStack("machina", 200),
                  AspectStack("alienis", 200),
                  AspectStack("potentia", 150),
                  AspectStack("permutatio", 120),
                  AspectStack("auram", 120))
    .outputItems(<thaumicaugmentation:void_recharge_pedestal>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_stabilized_end_crystal")
    .duration(72)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<enderutilities:enderpart:17>,
                <thaumcraft:plate:2> * 2,
                <minecraft:end_crystal>,
                <thaumcraft:vis_resonator>)
    .inputAspects(AspectStack("alienis", 100),
                  AspectStack("auram", 100),
                  AspectStack("sol", 80),
                  AspectStack("lux", 40),
                  AspectStack("fabrico", 40))
    .outputItems(<contenttweaker:stabilized_end_crystal>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_ThaumiumFortressChest")
    .duration(40)
    .perTick(true).inputFE(2500).perTick(false)
    .inputItems(<contenttweaker:magical_leather> * 2,
                <thaumcraft:thaumium_chest>,
                <thaumcraft:plate:2> * 5,
                <thaumcraft:plate>)
    .inputAspects(AspectStack("praemunio", 100),
                  AspectStack("metallum", 60),
                  AspectStack("potentia", 40))
    .outputItems(<thaumcraft:fortress_chest>)
    .buildAndRegister();

map.start()
    .name("thaumicaugmentation_impetus_cell")
    .duration(150)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<thaumcraft:amber_block> * 2,
                <contenttweaker:condensed_vis_crystal_vacuos>,
                <contenttweaker:condensed_vis_crystal_alienis>,
                <contenttweaker:impetus_crystal> * 4,
                <enderutilities:enderpart:17>)
    .inputAspects(AspectStack("alienis", 240),
                  AspectStack("vacuos", 240),
                  AspectStack("potentia", 240))
    .outputItems(<thaumicaugmentation:material:3>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_victus")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"victus"}]}) * 8)
    .inputAspects(AspectStack("victus", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_victus>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_instrumentum")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"instrumentum"}]}) * 8)
    .inputAspects(AspectStack("instrumentum", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_instrumentum>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_motus")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"motus"}]}) * 8)
    .inputAspects(AspectStack("motus", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_motus>)
    .buildAndRegister();

map.start()
    .name("bewitchment_mandrake_seeds")
    .duration(108)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<thaumcraft:cinderpearl>,
                <thaumcraft:nugget:10>,
                <mysticalagriculture:creeper_seeds>,
                <thaumcraft:mind:1>,
                <contenttweaker:mysterious_leaking_soul>,
                <thaumcraft:nitor_brown> * 2)
    .inputAspects(AspectStack("herba", 200),
                  AspectStack("victus", 120),
                  AspectStack("aversio", 100),
                  AspectStack("motus", 60),
                  AspectStack("perditio", 40),
                  AspectStack("sensus", 20))
    .outputItems(<bewitchment:mandrake_seeds>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_ArcaneBore")
    .duration(80)
    .perTick(true).inputFE(2500).perTick(false)
    .inputItems(<thaumcraft:morphic_resonator> * 2,
                <thaumcraft:nugget:10> * 2,
                <thaumcraft:turret>,
                <thaumcraft:plate> * 2,
                <industrialforegoing:laser_drill>,
                <industrialforegoing:laser_base>,
                <thaumcraft:mechanism_complex> * 2)
    .inputAspects(AspectStack("machina", 120),
                  AspectStack("potentia", 80),
                  AspectStack("ignis", 60),
                  AspectStack("terra", 60),
                  AspectStack("vacuos", 40),
                  AspectStack("motus", 40))
    .outputItems(<thaumcraft:turret:2>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_mortuus")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"mortuus"}]}) * 8)
    .inputAspects(AspectStack("mortuus", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_mortuus>)
    .buildAndRegister();

map.start()
    .name("bewitchment_coquina_witches_altar")
    .duration(33)
    .perTick(true).inputFE(3500).perTick(false)
    .inputItems(<bloodmagic:incense_altar>,
                <contenttweaker:lively_nature>,
                <ore:coquina> * 2,
                <bewitchment:elder_wood> * 3)
    .inputAspects(AspectStack("machina", 50),
                  AspectStack("terra", 30),
                  AspectStack("auram", 30),
                  AspectStack("herba", 25),
                  AspectStack("praecantatio", 15),
                  AspectStack("ordo", 15))
    .outputItems(<bewitchment:coquina_witches_altar>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_LampFertility")
    .duration(24)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<contenttweaker:rune_of_spring>,
                <botania:quartz:3>,
                <thaumcraft:lamp_arcane>,
                <thaumcraft:ingot> * 2)
    .inputAspects(AspectStack("lux", 40),
                  AspectStack("sol", 20),
                  AspectStack("desiderium", 20),
                  AspectStack("victus", 20),
                  AspectStack("bestia", 20))
    .outputItems(<thaumcraft:lamp_fertility>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_skeleton_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <mysticalagriculture:chunk:12> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_mortuus>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("mortuus", 100))
    .outputItems(<mysticalagriculture:skeleton_seeds>)
    .buildAndRegister();

map.start()
    .name("bewitchment_hellebore_seeds")
    .duration(84)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:nether_seeds>,
                <thaumcraft:nugget:10>,
                <thaumcraft:nitor_lime> * 2,
                <thaumcraft:mind:1>,
                <thaumcraft:shimmerleaf>,
                <contenttweaker:mysterious_leaking_soul>)
    .inputAspects(AspectStack("herba", 200),
                  AspectStack("ignis", 160),
                  AspectStack("sensus", 60))
    .outputItems(<bewitchment:hellebore_seeds>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_tool_upgrade_7")
    .duration(28)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<draconicevolution:draconic_core> * 4,
                <mysticalagriculture:supremium_arrow>,
                <lightningcraft:plate:9> * 2,
                <minecraft:tipped_arrow>.withTag({"Potion":"cofhcore:swiftness4"}) * 2)
    .inputAspects(AspectStack("motus", 80),
                  AspectStack("volatus", 60))
    .outputItems(<draconicevolution:tool_upgrade:7>)
    .buildAndRegister();

map.start()
    .name("mysticalagriculture_dark_gem_seeds")
    .duration(40)
    .perTick(true).inputFE(3000).perTick(false)
    .inputItems(<mysticalagriculture:crafting:19>,
                <evilcraft:dark_power_gem_block> * 4,
                <mysticalagriculture:crafting:2> * 4,
                <contenttweaker:condensed_vis_crystal_tenebrae>)
    .inputAspects(AspectStack("herba", 100),
                  AspectStack("tenebrae", 100))
    .outputItems(<mysticalagriculture:dark_gem_seeds>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_humanus")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"humanus"}]}) * 8)
    .inputAspects(AspectStack("humanus", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_humanus>)
    .buildAndRegister();

map.start()
    .name("draconicevolution_tool_upgrade_5")
    .duration(28)
    .perTick(true).inputFE(6000).perTick(false)
    .inputItems(<draconicevolution:draconic_core> * 4,
                <lightningcraft:plate:9> * 2,
                <mysticalagriculture:charm:14>,
                <mysticalagriculture:supremium_arrow> * 2)
    .inputAspects(AspectStack("aversio", 80),
                  AspectStack("volatus", 60))
    .outputItems(<draconicevolution:tool_upgrade:5>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_condensed_vis_crystal_aqua")
    .duration(6)
    .perTick(true).inputFE(2000).perTick(false)
    .inputItems(<thaumcraft:salis_mundus>,
                <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"aqua"}]}) * 8)
    .inputAspects(AspectStack("aqua", 30))
    .outputItems(<contenttweaker:condensed_vis_crystal_aqua>)
    .buildAndRegister();



print("ENDING AutoInfusionMatrix.zs");
