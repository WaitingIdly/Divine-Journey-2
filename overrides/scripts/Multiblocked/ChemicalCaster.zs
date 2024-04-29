#loader multiblocked
# Author: WaitingIdly

import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.MBDRegistry;
import mods.multiblocked.pattern.CTPredicate;
import mods.multiblocked.pattern.FactoryBlockPattern;
import mods.multiblocked.pattern.RelativeDirection;
import mods.multiblocked.recipe.RecipeMap;

print("STARTING ChemicalCaster.zs");

val map = RecipeMap("chemical_caster") as RecipeMap;
RecipeMap.register(map);

val controller = MBDRegistry.getDefinition("dj2:chemical_caster") as ControllerDefinition;
controller.recipeMap = map;
controller.basePattern = FactoryBlockPattern.start(RelativeDirection.BACK, RelativeDirection.UP, RelativeDirection.RIGHT)
    .aisle("  A  ", "  B  ", "  B  ", "  B  ", "  C  ", "     ", "     ")
    .aisle(" DED ", " FGF ", " FGF ", " FGF ", " F F ", "  D  ", "     ")
    .aisle("@EHEI", "BGJGB", "BGKGB", "BGJGB", "C L C", " DLD ", "  D  ")
    .aisle(" DED ", " FGF ", " FGF ", " FGF ", " F F ", "  D  ", "     ")
    .aisle("  M  ", "  B  ", "  B  ", "  B  ", "  C  ", "     ", "     ")
    .where("A", CTPredicate.states(<blockstate:modularmachinery:blockoutputbus:size=normal>))
    .where("B", CTPredicate.states(<blockstate:tconstruct:smeltery_io>))
    .where("C", CTPredicate.states(<blockstate:minecraft:stained_glass:color=pink>))
    .where("D", CTPredicate.states(<blockstate:modularmachinery:blockcasing:casing=reinforced>))
    .where("E", CTPredicate.states(<blockstate:tconstruct:casting:type=table>))
    .where("F", CTPredicate.states(<blockstate:contenttweaker:reinforced_glass_casing>))
    .where("G", CTPredicate.states(<blockstate:tconstruct:faucet>))
    .where("H", CTPredicate.states(<blockstate:minecraft:stained_glass:color=magenta>))
    .where("I", CTPredicate.states(<blockstate:modularmachinery:blockenergyinputhatch:size=huge>))
    .where("J", CTPredicate.states(<blockstate:contenttweaker:crystal_core>))
    .where("K", CTPredicate.states(<blockstate:draconicevolution:draconic_block>))
    .where("L", CTPredicate.states(<blockstate:alchemistry:chemical_dissolver>))
    .where("M", CTPredicate.states(<blockstate:modularmachinery:blockinputbus:size=normal>))
    .where("@", CTPredicate.states(<blockstate:dj2:chemical_caster>).setCenter())
    .where(" ", CTPredicate.getAny())
    .where("-", CTPredicate.getAir())
    .build();

map.start()
    .name("alchemistry_ingot_19")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:19> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:19>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_102")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:102> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:102>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_112")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:112> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:112>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_88")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:88> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:88>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_95")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:95> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:95>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_57")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:57> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:57>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_77")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:77> * 16)
    .inputHeat(500)
    .outputItems(<thermalfoundation:material:135>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_104")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:104> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:104>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_74")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:74> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:74>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_66")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:66> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:66>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_109")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:109> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:109>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_23")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:23> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:23>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_39")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:39> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:39>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_49")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:49> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:49>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_118")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:118> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:118>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_68")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:68> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:68>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_91")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:91> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:91>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_81")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:81> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:81>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_25")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:25> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:25>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_46")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:46> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:46>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_85")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:85> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:85>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_73")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:73> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:73>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_4")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:4> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:4>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_82")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:82> * 16)
    .inputHeat(500)
    .outputItems(<thermalfoundation:material:131>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_71")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:71> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:71>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_101")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:101> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:101>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_110")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:110> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:110>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_116")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:116> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:116>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_89")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:89> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:89>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_30")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:30> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:30>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_70")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:70> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:70>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_117")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:117> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:117>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_103")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:103> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:103>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_111")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:111> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:111>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_113")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:113> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:113>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_93")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:93> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:93>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_64")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:64> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:64>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_63")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:63> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:63>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_60")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:60> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:60>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_83")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:83> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:83>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_27")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:27> * 16)
    .inputHeat(500)
    .outputItems(<tconstruct:ingots>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_50")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:50> * 16)
    .inputHeat(500)
    .outputItems(<thermalfoundation:material:129>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_98")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:98> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:98>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_106")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:106> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:106>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_41")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:41> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:41>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_34")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:34> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:34>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_52")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:52> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:52>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_92")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:92> * 16)
    .inputHeat(500)
    .outputItems(<immersiveengineering:metal:5>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_108")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:108> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:108>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_107")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:107> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:107>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_45")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:45> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:45>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_43")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:43> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:43>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_26")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:26> * 16)
    .inputHeat(500)
    .outputItems(<minecraft:iron_ingot>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_47")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:47> * 16)
    .inputHeat(500)
    .outputItems(<thermalfoundation:material:130>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_99")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:99> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:99>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_32")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:32> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:32>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_97")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:97> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:97>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_96")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:96> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:96>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_94")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:94> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:94>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_61")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:61> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:61>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_28")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:28> * 16)
    .inputHeat(500)
    .outputItems(<thermalfoundation:material:133>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_24")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:24> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:24>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_20")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:20> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:20>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_48")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:48> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:48>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_87")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:87> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:87>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_22")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:22> * 16)
    .inputHeat(500)
    .outputItems(<galacticraftplanets:item_basic_asteroids>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_56")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:56> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:56>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_78")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:78> * 16)
    .inputHeat(500)
    .outputItems(<thermalfoundation:material:134>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_100")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:100> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:100>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_3")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:3> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:3>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_75")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:75> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:75>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_114")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:114> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:114>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_11")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:11> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:11>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_37")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:37> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:37>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_62")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:62> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:62>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_21")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:21> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:21>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_44")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:44> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:44>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_76")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:76> * 16)
    .inputHeat(500)
    .outputItems(<mekanism:ingot:1>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_12")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:12> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:12>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_13")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:13> * 16)
    .inputHeat(500)
    .outputItems(<thermalfoundation:material:132>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_58")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:58> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:58>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_40")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:40> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:40>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_72")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:72> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:72>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_105")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:105> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:105>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_55")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:55> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:55>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_51")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:51> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:51>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_42")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:42> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:42>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_31")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:31> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:31>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_115")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:115> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:115>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_5")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:5> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:5>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_84")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:84> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:84>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_67")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:67> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:67>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_69")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:69> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:69>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_29")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:29> * 16)
    .inputHeat(500)
    .outputItems(<thermalfoundation:material:128>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_38")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:38> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:38>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_79")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:79> * 16)
    .inputHeat(500)
    .outputItems(<minecraft:gold_ingot>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_65")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:65> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:65>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_90")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:90> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:90>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_33")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:33> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:33>)
    .buildAndRegister();

map.start()
    .name("alchemistry_ingot_59")
    .duration(10)
    .perTick(true).inputFE(100000).perTick(false)
    .inputItems(<alchemistry:element:59> * 16)
    .inputHeat(500)
    .outputItems(<alchemistry:ingot:59>)
    .buildAndRegister();


print("ENDING ChemicalCaster.zs");
