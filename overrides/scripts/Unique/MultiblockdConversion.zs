#loader multiblocked
// Author: WaitingIdly

import crafttweaker.block.IBlockState;
import mods.multiblocked.MBDRegistry;
import mods.multiblocked.tile.Controller;
import mods.multiblocked.functions.IStructureFormed;
import mods.multiblocked.definition.ControllerDefinition;

print("STARTING MultiblockdConversion.zs");

// all conveyor stuff is broken
// because IE stores its data in a special tile entity {conveyorBeltSubtypeNBT: {dyeColour: -1, direction: 0}}
// and it not existing (which needs GrS in order to set, CT just wont do) breaks it.
// amazin
// https://github.com/BluSunrize/ImmersiveEngineering/blob/master/src/main/java/blusunrize/immersiveengineering/common/blocks/metal/BlockConveyor.java


// slabs are also broken, always place on the top half
// hoppers are also broken, always placing in the wrong orientation, i think always need the hopper to be facing down
// fluids are also broken, simply dont place

static helperConversion as IBlockState[string] = {
    "dj2:advanced_blast_furnace_helper": <blockstate:immersiveengineering:stone_decoration:type=blastbrick_reinforced>,
    "dj2:alchemical_construct_helper": <blockstate:thaumcraft:crucible>,
    "dj2:alloy_kiln_helper": <blockstate:immersiveengineering:stone_decoration:type=alloybrick>,
    "dj2:arc_furnace_helper": <blockstate:minecraft:cauldron>,
    "dj2:assembler_helper": <blockstate:immersiveengineering:conveyor:type=conveyor,facing=east>, // facing BACK of controller
    "dj2:attunement_altar_helper": <blockstate:astralsorcery:blockattunementaltar>,
    "dj2:automated_workbench_helper": <blockstate:immersiveengineering:treated_wood_slab:type=horizontal,slabtype=0>,
    "dj2:blast_furnace_helper": <blockstate:immersiveengineering:stone_decoration:type=blastbrick>,
    "dj2:blood_altar_tier_2_helper": <blockstate:bloodmagic:altar>,
    "dj2:blood_altar_tier_3_helper": <blockstate:bloodmagic:altar>,
    "dj2:blood_altar_tier_4_helper": <blockstate:bloodmagic:altar>,
    "dj2:blood_altar_tier_5_helper": <blockstate:bloodmagic:altar>,
    "dj2:blood_altar_tier_6_helper": <blockstate:bloodmagic:altar>,
    "dj2:boiler_small_helper": <blockstate:mekanism:basicblock2:type=boiler_valve>,
    "dj2:bottling_machine_helper": <blockstate:immersiveengineering:conveyor:type=conveyor,facing=east>, // facing RIGHT of controller
    "dj2:celestial_altar_helper": <blockstate:astralsorcery:blockaltar:altartype=altar_3>,
    "dj2:celestial_gateway_helper": <blockstate:astralsorcery:blockcelestialgateway>,
    "dj2:chaos_stabilizer_helper": <blockstate:draconicadditions:chaos_stabilizer_core>,
    "dj2:coke_oven_helper": <blockstate:immersiveengineering:stone_decoration:type=cokebrick>,
    "dj2:crusher_helper": <blockstate:immersiveengineering:metal_decoration1:type=steel_fence>,
    "dj2:diesel_generator_helper": <blockstate:immersiveengineering:metal_decoration0:type=generator>,
    "dj2:draconic_reactor_helper": <blockstate:draconicevolution:reactor_component>,
    "dj2:energy_core_1_helper": <blockstate:draconicevolution:energy_storage_core>,
    "dj2:energy_core_2_helper": <blockstate:draconicevolution:energy_storage_core>,
    "dj2:energy_core_3_helper": <blockstate:draconicevolution:energy_storage_core>,
    "dj2:energy_core_4_helper": <blockstate:draconicevolution:energy_storage_core>,
    "dj2:energy_core_5_helper": <blockstate:draconicevolution:energy_storage_core>,
    "dj2:energy_core_6_helper": <blockstate:draconicevolution:energy_storage_core>,
    "dj2:energy_core_7_helper": <blockstate:draconicevolution:energy_storage_core>,
    "dj2:energy_core_8_helper": <blockstate:draconicevolution:energy_storage_core>,
    "dj2:evershifting_fountain_helper": <blockstate:astralsorcery:blockbore>,
    "dj2:excavator_helper": <blockstate:immersiveengineering:metal_decoration0:type=heavy_engineering>,
    "dj2:fermenter_helper": <blockstate:minecraft:cauldron>,
    "dj2:fission_helper": <blockstate:alchemistry:fission_controller>,
    "dj2:fusion_helper": <blockstate:alchemistry:fusion_controller>,
    "dj2:gaia_guardian_helper": <blockstate:minecraft:beacon>,
    "dj2:golem_forge_helper": <blockstate:thaumcraft:table_stone>,
    "dj2:incense_altar_tier_2_helper": <blockstate:bloodmagic:incense_altar>,
    "dj2:incense_altar_tier_3_helper": <blockstate:bloodmagic:incense_altar>,
    "dj2:incense_altar_tier_4_helper": <blockstate:bloodmagic:incense_altar>,
    "dj2:incense_altar_tier_5_helper": <blockstate:bloodmagic:incense_altar>,
    "dj2:infernal_furnace_helper": <blockstate:minecraft:iron_bars>,
    "dj2:infusion_matrix_ancient_helper": <blockstate:thaumcraft:infusion_matrix>,
    "dj2:infusion_matrix_eldritch_helper": <blockstate:thaumcraft:infusion_matrix>,
    "dj2:infusion_matrix_normal_helper": <blockstate:thaumcraft:infusion_matrix>,
    "dj2:iridescent_altar_helper": <blockstate:astralsorcery:blockaltar:altartype=altar_4>,
    "dj2:lightning_rod_helper": <blockstate:immersiveengineering:metal_decoration0:type=light_engineering>,
    "dj2:mana_enchanter_helper": <blockstate:minecraft:lapis_block>,
    "dj2:metal_press_helper": <blockstate:minecraft:piston:facing=down>,
    "dj2:mixer_helper": <blockstate:immersiveengineering:sheetmetal:type=iron>,
    "dj2:refinery_helper": <blockstate:immersiveengineering:metal_decoration0:type=heavy_engineering>,
    "dj2:ritual_pedestal_helper": <blockstate:astralsorcery:blockritualpedestal>,
    "dj2:silo_helper": <blockstate:immersiveengineering:sheetmetal:type=iron>,
    "dj2:spectral_relay_helper": <blockstate:astralsorcery:blockattunementrelay>,
    "dj2:squeezer_helper": <blockstate:immersiveengineering:wooden_device0:type=barrel>,
    "dj2:starlight_altar_helper": <blockstate:astralsorcery:blockaltar:altartype=altar_2>,
    "dj2:starlight_infuser_helper": <blockstate:astralsorcery:blockstarlightinfuser>,
    "dj2:tank_helper": <blockstate:immersiveengineering:sheetmetal:type=iron>,
    "dj2:terrestrial_agglomeration_plate_helper": <blockstate:botania:terraplate>,
    "dj2:thermal_evaporation_plant_max_helper": <blockstate:mekanism:basicblock:type=thermal_evaporation_controller>,
    "dj2:thermal_evaporation_plant_small_helper": <blockstate:mekanism:basicblock:type=thermal_evaporation_controller>,
} as IBlockState[string];

for defName, replacementBlock in helperConversion {
    print(defName);
    val definition = MBDRegistry.getDefinition(defName) as ControllerDefinition;

    definition.structureFormed = function (controller as Controller) {
        if (controller.isFormed) controller.world.setBlockState(replacementBlock, controller.pos);
    } as IStructureFormed;
}


print("ENDING MultiblockdConversion.zs");
