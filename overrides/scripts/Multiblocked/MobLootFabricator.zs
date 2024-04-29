#loader multiblocked
# Author: WaitingIdly

import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.MBDRegistry;
import mods.multiblocked.pattern.CTPredicate;
import mods.multiblocked.pattern.FactoryBlockPattern;
import mods.multiblocked.pattern.RelativeDirection;
import mods.multiblocked.recipe.RecipeMap;

print("STARTING MobLootFabricator.zs");

val map = RecipeMap("mob_loot_fabricator") as RecipeMap;
RecipeMap.register(map);

val controller = MBDRegistry.getDefinition("dj2:mob_loot_fabricator") as ControllerDefinition;
controller.recipeMap = map;
controller.basePattern = FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.BACK, RelativeDirection.DOWN)
    .aisle("ABBBA", "B   B", "B G B", "B   B", "ABBBA")
    .aisle("C   C", "     ", "     ", "     ", "C   C")
    .aisle("C   C", "     ", "     ", "     ", "C   C")
    .aisle("C   C", "     ", "  F  ", "     ", "C   C")
    .aisle("AB@BA", "BBDBB", "BBBBB", "BBEBB", "ABBBA")
    .where("A", CTPredicate.states(<blockstate:astralsorcery:blockblackmarble:marbletype=chiseled>))
    .where("B", CTPredicate.states(<blockstate:astralsorcery:blockblackmarble:marbletype=arch>))
    .where("C", CTPredicate.states(<blockstate:astralsorcery:blockblackmarble:marbletype=pillar>))
    .where("D", CTPredicate.states(<blockstate:modularmachinery:blockinputbus:size=big>))
    .where("E", CTPredicate.states(<blockstate:modularmachinery:blockoutputbus>))
    .where("F", CTPredicate.states(<blockstate:bloodmagic:ritual_controller:type=imperfect>))
    .where("G", CTPredicate.states(<blockstate:astralsorcery:blockcelestialcollectorcrystal>).setNBTParser("astralsorcery.constellation.lucerna").addTooltips("Must be a Celestial Collector Crystal attuned to Lucerna"))
    .where("@", CTPredicate.states(<blockstate:dj2:mob_loot_fabricator>).setCenter())
    .where(" ", CTPredicate.getAny())
    .where("-", CTPredicate.getAir())
    .build();

map.start()
    .name("abyssalcraft")
    .duration(20)
    .inputItems(<abyssalcraft:lifecrystal>)
    .inputLP(500)
    .outputItems(<abyssalcraft:dreadshard> * 64,
                 <abyssalcraft:dreadchunk> * 64,
                 <abyssalcraft:abychunk> * 64,
                 <abyssalcraft:dreadfragment> * 64,
                 <abyssalcraft:eldritchscale> * 64,
                 <abyssalcraft:omotholflesh> * 64,
                 <abyssalcraft:shadowshard> * 64,
                 <abyssalcraft:shadowgem> * 64,
                 <contenttweaker:soul_of_the_dark_realm>)
    .buildAndRegister();

map.start()
    .name("end")
    .duration(20)
    .inputItems(<contenttweaker:stabilized_end_crystal>)
    .inputLP(500)
    .outputItems(<minecraft:ender_pearl> * 64,
                 <minecraft:ender_eye> * 64,
                 <quantumflux:craftingpiece:3> * 64,
                 <divinerpg:ender_shards> * 64,
                 <divinerpg:watching_eye> * 64,
                 <minecraft:shulker_shell> * 4)
    .buildAndRegister();

map.start()
    .name("vethea")
    .duration(20)
    .inputItems(<divinerpg:moon_clock>)
    .inputLP(1000)
    .outputItems(<divinerpg:clean_pearls> * 64,
                 <divinerpg:dirty_pearls> * 64,
                 <divinerpg:shiny_pearls> * 64,
                 <divinerpg:polished_pearls> * 64,
                 <divinerpg:acid> * 32)
    .buildAndRegister();

map.start()
    .name("nether")
    .duration(20)
    .inputItems(<thaumicaugmentation:augment_builder_power>.withTag({"id":"thaumicaugmentation:strength_nether"}))
    .inputLP(500)
    .outputItems(<minecraft:blaze_rod> * 64,
                 <minecraft:magma_cream> * 64,
                 <minecraft:gold_nugget> * 64,
                 <minecraft:gold_ingot> * 64,
                 <minecraft:ghast_tear> * 64,
                 <tconstruct:materials:17> * 64,
                 <minecraft:skull:1> * 64,
                 <minecraft:coal> * 64,
                 <divinerpg:molten_shards> * 64,
                 <thermalfoundation:material:771> * 64,
                 <bewitchment:hellhound_horn>,
                 <divinerpg:purple_blaze>)
    .buildAndRegister();

map.start()
    .name("twilight_forest")
    .duration(20)
    .inputItems(<bewitchment:ravens_feather>)
    .inputLP(500)
    .outputItems(<twilightforest:armor_shard> * 64,
                 <twilightforest:torchberries> * 64,
                 <twilightforest:magic_beans> * 64,
                 <twilightforest:raw_meef> * 64,
                 <twilightforest:raw_venison> * 64,
                 <twilightforest:raven_feather> * 64,
                 <twilightforest:borer_essence> * 64,
                 <twilightforest:arctic_fur> * 64)
    .buildAndRegister();

map.start()
    .name("evilcraft")
    .duration(20)
    .inputItems(<evilcraft:sanguinary_pedestal:1>)
    .inputLP(500)
    .outputItems(<evilcraft:vengeance_essence>)
    .outputFluids(<liquid:evilcraftblood> * 8000)
    .buildAndRegister();

map.start()
    .name("gaia_spirits")
    .duration(20)
    .inputItems(<botania:laputashard:19>)
    .inputLP(20000)
    .outputItems(<botania:manaresource:5> * 4)
    .buildAndRegister();

map.start()
    .name("elemental")
    .duration(20)
    .inputItems(<bloodmagic:sigil_elemental_affinity>)
    .inputLP(500)
    .outputItems(<thermalfoundation:material:770> * 64,
                 <thermalfoundation:material:771> * 64,
                 <thermalfoundation:material:772> * 64,
                 <minecraft:blaze_rod> * 64,
                 <thermalfoundation:material:2048> * 64,
                 <thermalfoundation:material:2050> * 64,
                 <thermalfoundation:material:2052> * 64)
    .buildAndRegister();

map.start()
    .name("passive")
    .duration(20)
    .inputItems(<torchmaster:dread_lamp>)
    .inputLP(500)
    .outputItems(<minecraft:feather> * 64,
                 <minecraft:chicken> * 64,
                 <minecraft:porkchop> * 64,
                 <minecraft:beef> * 64,
                 <minecraft:leather> * 64,
                 <minecraft:rabbit_hide> * 64,
                 <minecraft:rabbit_foot> * 64,
                 <minecraft:rabbit> * 64,
                 <minecraft:dye> * 64,
                 <minecraft:mutton> * 64,
                 <minecraft:wool> * 64,
                 <minecraft:snowball> * 64,
                 <totemic:buffalo_items> * 64,
                 <natura:materials:6> * 64)
    .buildAndRegister();

map.start()
    .name("shards")
    .duration(20)
    .inputItems(<divinerpg:arcanium>)
    .inputLP(500)
    .outputItems(<divinerpg:cyclops_eye_shards> * 64,
                 <divinerpg:ender_shards> * 64,
                 <divinerpg:ice_shards> * 64,
                 <divinerpg:jungle_shards> * 64,
                 <divinerpg:molten_shards> * 64,
                 <divinerpg:terran_shards> * 64,
                 <divinerpg:collector_fragments> * 64)
    .buildAndRegister();

map.start()
    .name("twilight_forest_bosses")
    .duration(20)
    .inputItems(<twilightforest:lamp_of_cinders>)
    .inputLP(5000)
    .outputItems(<twilightforest:trophy>,
                 <twilightforest:trophy:1>,
                 <twilightforest:trophy:2>,
                 <twilightforest:trophy:3>,
                 <twilightforest:trophy:4>,
                 <twilightforest:trophy:5>,
                 <twilightforest:giant_pickaxe>,
                 <twilightforest:giant_sword>,
                 <twilightforest:naga_scale>,
                 <twilightforest:meef_stroganoff>,
                 <twilightforest:alpha_fur>,
                 <twilightforest:fiery_blood>,
                 <twilightforest:fiery_tears>,
                 <twilightforest:hydra_chop>)
    .buildAndRegister();

map.start()
    .name("vanilla_hostile")
    .duration(20)
    .inputItems(<mob_grinding_utils:saw>)
    .inputLP(500)
    .outputItems(<minecraft:iron_ingot> * 64,
                 <minecraft:gunpowder> * 64,
                 <minecraft:potato> * 64,
                 <minecraft:carrot> * 64,
                 <minecraft:redstone> * 64,
                 <minecraft:sugar> * 64,
                 <minecraft:stick> * 64,
                 <minecraft:glowstone_dust> * 64,
                 <minecraft:prismarine_shard> * 64,
                 <minecraft:prismarine_crystals> * 64,
                 <minecraft:slime_ball> * 64,
                 <mysticalagriculture:chunk> * 64,
                 <minecraft:glass_bottle> * 16)
    .buildAndRegister();

map.start()
    .name("clock")
    .duration(20)
    .inputItems(<divinerpg:twilight_clock>)
    .inputLP(1000)
    .outputItems(<divinerpg:eden_soul> * 64,
                 <divinerpg:wildwood_soul> * 64,
                 <divinerpg:apalachia_soul> * 64,
                 <divinerpg:skythern_soul> * 64,
                 <divinerpg:mortum_soul> * 64,
                 <divinerpg:raw_empowered_meat> * 64,
                 <divinerpg:magic_meat> * 64,
                 <divinerpg:enriched_magic_meat> * 64,
                 <divinerpg:eden_heart>,
                 <divinerpg:wildwood_heart>,
                 <divinerpg:apalachia_heart>,
                 <divinerpg:skythern_heart>,
                 <divinerpg:mortum_heart>)
    .buildAndRegister();

map.start()
    .name("vanilla_hostile_basic")
    .duration(20)
    .inputItems(<enderio:block_killer_joe>)
    .inputLP(500)
    .outputItems(<minecraft:rotten_flesh> * 64,
                 <minecraft:bone> * 64,
                 <minecraft:arrow> * 64,
                 <minecraft:string> * 64,
                 <minecraft:spider_eye> * 64,
                 <minecraft:slime_ball> * 64,
                 <minecraft:fish> * 64,
                 <actuallyadditions:item_solidified_experience> * 64)
    .buildAndRegister();

map.start()
    .name("blood_magic")
    .duration(20)
    .inputItems(<bloodmagic:blood_shard>)
    .inputLP(500)
    .outputItems(<bloodmagic:blood_shard>)
    .outputFluids(<liquid:lifeessence> * 8000)
    .outputLP(2500)
//    .outputBMWill(Will(raw, max:100, min:0,
//                  Will(corrosive, max:100, min:0,
//                  Will(destructive, max:100, min:0,
//                  Will(vengeful, max:100, min:0,
//                  Will(steadfast, max:100, min:0)
    .buildAndRegister();

map.start()
    .name("lightningcraft")
    .duration(20)
    .inputItems(<lightningcraft:item_magnet:3>)
    .inputLP(500)
    .outputItems(<lightningcraft:material:5> * 64,
                 <lightningcraft:material:7> * 64,
                 <lightningcraft:material:12> * 64)
    .buildAndRegister();

map.start()
    .name("special_unstackables")
    .duration(20)
    .inputItems(<contenttweaker:woodland_mansion_locator_token>)
    .inputLP(1000)
    .outputItems(<minecraft:emerald> * 64,
                 <minecraft:totem_of_undying>)
    .buildAndRegister();

map.start()
    .name("thaumcraft_wisps")
    .duration(20)
    .inputItems(<thaumicaugmentation:autocaster_placer>)
    .inputLP(500)
    .outputItems(<thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"aer"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"terra"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"ignis"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"aqua"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"ordo"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"perditio"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"vacuos"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"lux"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"motus"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"gelum"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"vitreus"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"metallum"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"victus"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"mortuus"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"potentia"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"permutatio"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"praecantatio"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"auram"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"alkimia"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"vitium"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"tenebrae"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"alienis"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"volatus"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"herba"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"instrumentum"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"fabrico"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"machina"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"vinculum"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"spiritus"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"cognitio"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"sensus"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"aversio"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"praemunio"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"desiderium"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"exanimis"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"bestia"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"humanus"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"sol"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"luna"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"stellae"}]}),
                 <thaumcraft:crystal_essence>.withTag({"Aspects":[{"amount":"1","key":"diabolus"}]}))
    .buildAndRegister();

map.start()
    .name("bewitchment")
    .duration(20)
    .inputItems(<bewitchment:triskelion>)
    .inputLP(500)
    .outputItems(<bewitchment:ectoplasm> * 4,
                 <bewitchment:heart> * 4,
                 <bewitchment:dimensional_sand> * 4,
                 <bewitchment:spectral_dust> * 4,
                 <bewitchment:hellhound_horn> * 64,
                 <bewitchment:tongue_of_dog> * 64,
                 <bewitchment:lizard_leg> * 64,
                 <bewitchment:owlets_wing> * 64,
                 <bewitchment:ravens_feather> * 64,
                 <bewitchment:adders_fork> * 64,
                 <bewitchment:hoof> * 64,
                 <bewitchment:toe_of_frog>)
    .buildAndRegister();


print("ENDING MobLootFabricator.zs");
