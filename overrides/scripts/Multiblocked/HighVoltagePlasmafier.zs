#loader multiblocked
# Author: WaitingIdly

import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.MBDRegistry;
import mods.multiblocked.pattern.CTPredicate;
import mods.multiblocked.pattern.FactoryBlockPattern;
import mods.multiblocked.pattern.RelativeDirection;
import mods.multiblocked.recipe.RecipeMap;

print("STARTING HighVoltagePlasmafier.zs");

val map = RecipeMap("high_voltage_plasmafier") as RecipeMap;
RecipeMap.register(map);

val controller = MBDRegistry.getDefinition("dj2:high_voltage_plasmafier") as ControllerDefinition;
controller.recipeMap = map;
controller.basePattern = FactoryBlockPattern.start(RelativeDirection.BACK, RelativeDirection.UP, RelativeDirection.RIGHT)
    .aisle("   ABA   ", "   CDC   ", "   CDC   ", "   CDC   ", "   CDC   ", "   CDC   ", "   CDC   ", "   CDC   ", "   AAA   ")
    .aisle("  A   A  ", "         ", "   EEE   ", "         ", "   EEE   ", "         ", "   EEE   ", "         ", "  A   A  ")
    .aisle(" A     A ", "         ", "  E   E  ", "         ", "  E   E  ", "         ", "  E   E  ", "         ", " A     A ")
    .aisle("A  AFA  A", "C  FDF  C", "CE FDF EC", "C  FDF  C", "CE FDF EC", "C  FDF  C", "CE FDF EC", "C  FDF  C", "A  AFA  A")
    .aisle("@  FGF  H", "D  DID  D", "DE DID ED", "D  DID  D", "DE DID ED", "D  DID  D", "DE DID ED", "D  DID  D", "A  FGF  A") // controller is in the front middle of the first layer
    .aisle("A  AFA  A", "C  FDF  C", "CE FDF EC", "C  FDF  C", "CE FDF EC", "C  FDF  C", "CE FDF EC", "C  FDF  C", "A  AFA  A")
    .aisle(" A     A ", "         ", "  E   E  ", "         ", "  E   E  ", "         ", "  E   E  ", "         ", " A     A ")
    .aisle("  A   A  ", "         ", "   EEE   ", "         ", "   EEE   ", "         ", "   EEE   ", "         ", "  A   A  ")
    .aisle("   AJA   ", "   CDC   ", "   CDC   ", "   CDC   ", "   CDC   ", "   CDC   ", "   CDC   ", "   CDC   ", "   AAA   ")
    .where("A", CTPredicate.states(<blockstate:contenttweaker:reinforced_machine_stabilizer>))
    .where("B", CTPredicate.states(<blockstate:modularmachinery:blockoutputbus:size=huge>))
    .where("C", CTPredicate.states(<blockstate:modularmachinery:blockcasing:casing=reinforced>))
    .where("D", CTPredicate.states(<blockstate:contenttweaker:reinforced_glass_casing>))
    .where("E", CTPredicate.states(<blockstate:contenttweaker:reinforced_machine_electrolyzer>))
    .where("F", CTPredicate.states(<blockstate:contenttweaker:reinforced_starlight_infused_machine_block>))
    .where("G", CTPredicate.states(<blockstate:modularmachinery:blockcasing:casing=gearbox>))
    .where("H", CTPredicate.states(<blockstate:modularmachinery:blockenergyinputhatch:size=ludicrous>))
    .where("I", CTPredicate.states(<blockstate:contenttweaker:reinforced_machine_accelerator>))
    .where("J", CTPredicate.states(<blockstate:modularmachinery:blockinputbus:size=huge>))
    .where("@", CTPredicate.states(<blockstate:dj2:high_voltage_plasmafier>).setCenter())
    .where(" ", CTPredicate.getAny())
    .where("-", CTPredicate.getAir())
    .build();

map.start()
    .name("contenttweaker_essence_of_time")
    .duration(600)
    .perTick(true).inputFE(16000000).perTick(false)
    .inputItems(<contenttweaker:essence_of_continuity>,
                <contenttweaker:essence_of_dimensionality>,
                <contenttweaker:essence_of_additivity>)
    .outputItems(<contenttweaker:essence_of_time>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_essence_of_matter")
    .duration(600)
    .perTick(true).inputFE(16000000).perTick(false)
    .inputItems(<extendedcrafting:singularity_ultimate>,
                <contenttweaker:essence_of_order>,
                <contenttweaker:essence_of_destruction>)
    .outputItems(<contenttweaker:essence_of_matter>)
    .buildAndRegister();

map.start()
    .name("contenttweaker_essence_of_repetition")
    .duration(600)
    .perTick(true).inputFE(16000000).perTick(false)
    .inputItems(<contenttweaker:essence_of_logic>,
                <contenttweaker:essence_of_movement>)
    .outputItems(<contenttweaker:essence_of_repetition>)
    .buildAndRegister();

map.start()
    .name("avaritia_cosmic_meatballs")
    .duration(600)
    .perTick(true).inputFE(16000000).perTick(false)
    .inputItems(<contenttweaker:cosmic_neutronium_nugget>,
                <contenttweaker:cosmic_neutronium_burger>,
                <contenttweaker:cosmic_neutronium_taco>)
    .outputItems(<avaritia:cosmic_meatballs>)
    .buildAndRegister();

print("ENDING HighVoltagePlasmafier.zs");
