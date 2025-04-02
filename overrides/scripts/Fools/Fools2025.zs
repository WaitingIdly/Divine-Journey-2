#loader crafttweaker reloadable

// Author: WaitingIdly
import crafttweaker.entity.IEntity;
import crafttweaker.event.EntityTravelToDimensionEvent;
import crafttweaker.event.PlayerInteractEntityEvent;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.util.IRandom;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import mods.contenttweaker.Commands;

// todo: check if the command to complete quests works correctly.
// todo: add boss loot, perhaps figure out a way to spawn entities.



static nether_table as IItemStack[] = [<betternether:black_bush>,<betternether:agave>,<natura:nether_berrybush_skyberry>,<betternether:magma_flower>,<natura:nether_heat_sand>,<betternether:cincinnasite_slab_half>,<natura:nether_thorn_vines>,<quark:basalt>,<betternether:bone_stairs>,<betternether:red_mold>,<minecraft:gravel>,<betternether:bone_mushroom>,<betternether:block_eyeball_small>,<betternether:block_eyeball>,<betternether:nether_grass>,<betternether:nether_brick_wall>,<minecraft:soul_sand>,<divinerpg:bloodgem_ore>,<mysticalagriculture:soulstone>,<bno:ore_nethergold>,<betternether:wart_seed>,<betternether:cincinnasite_pedestal>,<betternether:pig_statue_01>,<natura:nether_leaves:1>,<bno:ore_netheriron>,<minecraft:nether_brick>,<betternether:cincinnasite_fire_bowl>,<bno:ore_nethercoal>,<bno:ore_netherdiamond>,<betternether:cincinnasite_bricks>,<draconicevolution:draconium_ore:1>,<betternether:egg_plant>,<divinerpg:netherite_ore>,<bno:ore_netheremerald>,<minecraft:netherrack>,<betternether:reeds_block>,<minecraft:red_mushroom>,<betternether:cincinnasite_bricks_pillar>,<minecraft:magma>,<tconstruct:ore>,<betternether:nether_brick_tile_stairs>,<minecraft:nether_wart>,<tconstruct:ore:1>,<mysticalagriculture:nether_prosperity_ore>,<natura:nether_logs2>,<bno:ore_netherlapis>,<betternether:cincinnasite_pillar>,<betternether:cincinnasite_stairs>,<thermalfoundation:ore_fluid:3>,<bno:ore_nethertin>,<betternether:nether_brick_tile_large>,<betternether:orange_mushroom>,<betternether:cincinnasite_ore>,<bno:ore_nethercopper>,<quark:smoker>,<betternether:nether_cactus>,<minecraft:bone_block>,<betternether:smoker>,<minecraft:nether_brick_stairs>,<betternether:cincinnasite_pot>,<bno:ore_netherredstone>,<betternether:nether_reed>,<betternether:gray_mold>,<betternether:cincinnasite_wall>,<betternether:cincinnasite_brick_plate>,<minecraft:obsidian>,<betternether:bone_tile>,<betternether:bone_block>,<betternether:netherrack_moss>,<minecraft:nether_wart_block>,<minecraft:quartz_ore>,<betternether:stalagnate_stem>,<natura:nether_logs2:15>,<natura:nether_tainted_soil>,<betternether:lucis_spore>,<minecraft:glowstone>,<betternether:nether_mycelium>,<natura:nether_glowshroom>,<betternether:barrel_cactus>,<thermalfoundation:fluid_glowstone>,<natura:nether_glowshroom:1>,<betternether:cincinnasite_forged>,<natura:nether_glowshroom:2>,<mysticalagriculture:nether_inferium_ore>,<minecraft:brown_mushroom>,] as IItemStack[];
// static nether_table_boss as IItemStack[] = [<divinerpg:king_of_scorchers_statue>,<divinerpg:fury_fire>,<>,<>,<>,<>,] as IItemStack[];

static end_table as IItemStack[] = [<minecraft:chorus_plant>,<minecraft:end_stone>,<minecraft:chorus_flower>,<mysticalagriculture:end_inferium_ore>,<thermalfoundation:ore_fluid:4>,<draconicevolution:draconium_ore:2>,<extrautils2:enderlilly>,<mysticalagriculture:end_prosperity_ore>,] as IItemStack[];
static end_table_boss as IItemStack[] = [<minecraft:elytra>,<minecraft:dragon_breath>,<botania:manaresource:15>,<draconicevolution:dragon_heart>,<minecraft:dragon_egg>,] as IItemStack[];

static erebus_table as IItemStack[] = [<erebus:log_mahogany>,<erebus:log_mossbark>,<erebus:umbergravel>,<erebus:log_rotten>,<erebus:ore_temple>,<erebus:dark_fruit_vine>,<erebus:leaves_eucalyptus>,<minecraft:log2>,<erebus:petrified_bark_brown>,<erebus:quick_sand>,<erebus:thorns>,<erebus:petrified_wood_rock_4>,<erebus:small_plant:4>,<erebus:log_eucalyptus>,<erebus:small_plant:2>,<erebus:small_plant:5>,<erebus:small_plant:6>,<natura:overworld_logs:2>,<erebus:dust_layer>,<erebus:grandmas_shoes_mushroom>,<erebus:ore_coal>,<natura:overworld_berrybush_blackberry>,<erebus:ore_quartz>,<erebus:leaves_asper>,<erebus:petrified_wood_rock_5>,<erebus:petrified_bark_red>,<minecraft:leaves:3>,<natura:bluebells_flower>,<erebus:log_bamboo>,<erebus:leaves_mossbark>,<minecraft:leaves2>,<erebus:dark_capped_mushroom>,<minecraft:log:3>,<erebus:mandrake_root>,<erebus:leaves_mahogany>,<erebus:kaizers_fingers_mushroom>,<erebus:red_gem>,<minecraft:brown_mushroom>,<erebus:hollow_log>,<erebus:petrified_log_inner>,<erebus:formic_acid>,<natura:overworld_leaves:2>,<minecraft:reeds>,<minecraft:vine>,<minecraft:sand>,<erebus:hanging_web>,<minecraft:sand:1>,<erebus:ore_copper>,<erebus:double_plant>,<erebus:log_asper>,<erebus:double_plant:2>,<erebus:petrified_wood_rock>,<erebus:petrified_wood_rock_6>,<erebus:petrified_wood_rock_2>,<erebus:double_plant:7>,<erebus:double_plant:3>,<erebus:double_plant:6>,<erebus:double_plant:5>,<erebus:volcanic_rock>,<minecraft:double_plant:1>,<minecraft:double_plant:2>,<erebus:ore_silver>,<erebus:ore_iron>,<erebus:ore_gold>,<minecraft:red_mushroom>,<erebus:mud>,<minecraft:grass>,<erebus:sarcastic_czech_mushroom>,<minecraft:red_sandstone>,<minecraft:tallgrass:1>,<thermalfoundation:ore_fluid>,<erebus:dutch_cap_mushroom>,<erebus:ore_petrified_quartz>,<erebus:umberstone:1>,<erebus:umberstone>,<erebus:log_scorched>,<erebus:ore_petrified_wood>,<minecraft:waterlily>,<erebus:umberstone:3>,<erebus:umberstone:2>,<minecraft:dirt>,<erebus:wall_plants:7>,<erebus:glowshroom_stalk_main>,<minecraft:web>,<erebus:petrified_wood_rock_3>,<erebus:ore_lapis>,<erebus:wall_plants:1>,<erebus:dust>,<erebus:ore_fossil>,] as IItemStack[];
static erebus_table_boss as IItemStack[] = [<erebus:idols>,<erebus:idols:1>,<erebus:idols:2>,<erebus:idols:3>,<erebus:tarantula_egg>,<erebus:antlion_egg>,] as IItemStack[];

static aether_table as IItemStack[] = [<aether_legacy:berry_bush>,<aether_legacy:aether_log:1>,<minecraft:stone_slab>,<aether_legacy:aercloud>,<aether_legacy:aercloud:1>,<aether_legacy:quicksoil>,<aether_legacy:aercloud:2>,<aether_legacy:ambrosium_ore>,<aether_legacy:pillar_top>,<aether_legacy:aether_log>,<aether_legacy:aether_grass>,<aether_legacy:aether_dirt>,<aether_legacy:icestone>,<aether_legacy:zanite_ore>,<aether_legacy:purple_flower>,<aether_legacy:golden_oak_sapling>,<aether_legacy:white_flower>,<aether_legacy:mossy_holystone>,<minecraft:glowstone>,<aether_legacy:gravitite_ore>,<aether_legacy:pillar>,<aether_legacy:aether_leaves:9>,<aether_legacy:berry_bush>,<aether_legacy:aether_leaves:8>,<aether_legacy:crystal_leaves:5>,<aether_legacy:dungeon_block:3>,<aether_legacy:crystal_leaves:4>,<aether_legacy:holystone>,<aether_legacy:dungeon_block:2>,] as IItemStack[];
static aether_table_boss as IItemStack[] = [<aether_legacy:aerogel>,<contenttweaker:bronze_aether_coin>,<contenttweaker:silver_aether_coin>,<contenttweaker:golden_aether_coin>,<aether_legacy:victory_medal>,<aether_legacy:aechor_petal>,] as IItemStack[];

static twilight_forest_table as IItemStack[] = [<mysticalagriculture:prosperity_ore>,<divinerpg:realmite_ore>,<minecraft:stone_brick_stairs>,<thermalfoundation:fluid_redstone>,<minecraft:stone_slab>,<appliedenergistics2:quartz_ore>,<minecraft:stone_slab:3>,<bewitchment:elder_wood>,<minecraft:stone_slab:5>,<twilightforest:etched_nagastone>,<minecraft:lapis_ore>,<minecraft:snow_layer>,<divinerpg:rupee_ore>,<minecraft:gravel>,<minecraft:ice>,<bewitchment:elder_leaves>,<twilightforest:nagastone_stairs:8>,<appliedenergistics2:charged_quartz_ore>,<natura:overworld_logs:3>,<twilightforest:nagastone_stairs_mossy:8>,<twilightforest:cicada>,<twilightforest:naga_stone>,<thaumcraft:ore_cinnabar>,<twilightforest:naga_stone:1>,<mekanism:oreblock>,<minecraft:clay>,<actuallyadditions:item_rice_seed>,<minecraft:yellow_flower>,<twilightforest:nagastone_pillar_mossy>,<chisel:basalt2:7>,<mysticalworld:amethyst_ore>,<actuallyadditions:item_canola_seed>,<twilightforest:twilight_leaves:1>,<natura:overworld_logs:1>,<twilightforest:twilight_leaves>,<chisel:limestone2:7>,<natura:overworld_logs>,<twilightforest:nagastone_pillar_weathered>,<minecraft:gold_ore>,<minecraft:stonebrick>,<minecraft:stonebrick:2>,<minecraft:mossy_cobblestone>,<minecraft:leaves:2>,<minecraft:stonebrick:1>,<minecraft:leaves:1>,<actuallyadditions:item_coffee_seed>,<minecraft:stonebrick:3>,<minecraft:log>,<minecraft:log:1>,<twilightforest:etched_nagastone_weathered>,<minecraft:log:2>,<bewitchment:cypress_leaves>,<actuallyadditions:block_black_lotus>,<twilightforest:nagastone_pillar>,<natura:bluebells_flower>,<actuallyadditions:block_misc:3>,<thermalfoundation:ore:4>,<thaumcraft:ore_amber>,<thermalfoundation:ore:5>,<thermalfoundation:ore:2>,<thermalfoundation:ore:3>,<thermalfoundation:ore>,<thermalfoundation:ore:1>,<minecraft:brown_mushroom>,<twilightforest:firefly>,<natura:overworld_berrybush_raspberry>,<actuallyadditions:item_flax_seed>,<divinerpg:arlemite_ore>,<natura:overworld_berrybush_blueberry>,<minecraft:cobblestone_wall>,<minecraft:cobblestone_wall:1>,<natura:overworld_leaves:3>,<natura:overworld_leaves>,<natura:overworld_leaves:1>,<minecraft:iron_ore>,<minecraft:vine>,<natura:overworld_logs2:3>,<minecraft:sand>,<astralsorcery:blockcustomsandore>,<natura:overworld_logs2:1>,<minecraft:leaves>,<chisel:marble2:7>,<minecraft:red_flower>,<evilcraft:dark_ore>,<minecraft:emerald_ore>,<natura:overworld_seeds>,<minecraft:diamond_ore>,<draconicevolution:draconium_ore>,<twilightforest:etched_nagastone_mossy>,<minecraft:planks>,<minecraft:stone_stairs>,<minecraft:double_plant:1>,<minecraft:double_plant:3>,<twilightforest:spiral_bricks>,<minecraft:red_mushroom>,<minecraft:grass>,<minecraft:coal_ore>,<minecraft:tallgrass:2>,<minecraft:stone:5>,<minecraft:cobblestone>,<minecraft:tallgrass:1>,<minecraft:stone:3>,<thermalfoundation:ore_fluid>,<twilightforest:root>,<thermalfoundation:ore_fluid:2>,<minecraft:wooden_slab>,<minecraft:stone>,<natura:overworld_leaves2:3>,<minecraft:stone:1>,<minecraft:waterlily>,<natura:overworld_leaves2:1>,<twilightforest:twilight_plant:1>,<twilightforest:twilight_plant:8>,<twilightforest:twilight_plant:7>,<minecraft:redstone_ore>,<twilightforest:twilight_log:1>,<twilightforest:twilight_log>,<minecraft:dirt>,<bewitchment:cypress_wood>,<bigreactors:oreyellorite>,<mysticalagriculture:inferium_ore>,<bewitchment:garnet_ore>,<twilightforest:nagastone_stairs_weathered:8>,<bewitchment:opal_ore>,] as IItemStack[];

static underworld_table as IItemStack[] = [<minecraft:grass>,<minecraft:dirt>,<lightningcraft:ore_block:2>,<lightningcraft:ore_block:3>,<lightningcraft:light_block>,<lightningcraft:ore_block>,<minecraft:vine>,<lightningcraft:ore_block:1>,<lightningcraft:wood_log>,<lightningcraft:under_sand>,<minecraft:leaves>,<lightningcraft:stone_block:6>,<minecraft:packed_ice>,] as IItemStack[];
// static underworld_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static atum_table as IItemStack[] = [<atum:cloth_scrap>,<atum:emmer_seeds>,<atum:flax_seeds>,<atum:large_wall>,<atum:alabaster>,<atum:relic_ore>,<atum:porphyry>,<atum:limestone_gravel>,<atum:sand>,<atum:dirty_bone_slab>,<atum:marl>,<atum:large_stairs>,<atum:deadwood_crate>,<atum:limestone_brick_small>,<atum:dirty_bone_block>,<atum:bone_ore>,<atum:limestone_cracked>,<appliedenergistics2:sky_stone_block>,<atum:limestone>,<atum:limestone_brick_large>,<atum:sand_layer>,<atum:khnumite_raw>,<atum:deadwood_branch>,<atum:limestone_brick_cracked_brick>,<atum:weed>,] as IItemStack[];
// static atum_table_boss as IItemStack[] = [<atum:heart_of_ra>,<atum:efreet_heart>,<>,<>,<>,<>,<contenttweaker:inscriber_operation_press>,<contenttweaker:inscriber_estimation_press>,<contenttweaker:inscriber_methodology_press>,<contenttweaker:inscriber_clearance_press>,<contenttweaker:inscriber_scheduling_press>,<appliedenergistics2:material:19>,<appliedenergistics2:material:15>,<appliedenergistics2:material:14>,<appliedenergistics2:material:13>,<atum:golden_date_enchanted>,<atum:atums_will>,<atum:ptahs_decadence>,<atum:ptahs_undoing>,<atum:gebs_toil>,<atum:gebs_might>,<atum:tefnuts_call>,<atum:tefnuts_blessing>,<atum:shus_exile>,<atum:horuss_ascension>,<atum:seths_sting>,<atum:montus_strike>,<atum:anubiss_wrath>,<atum:nuits_ire>,<atum:nuits_quarter>,<atum:anputs_hunger>,<atum:ras_fury>,<atum:gebs_grounding>,<atum:seths_venom>,<atum:tefnuts_rain>,<atum:shus_breath>,<atum:horuss_soaring>,<atum:montus_blast>,<atum:nuits_duality>,<atum:atums_bounty>,<atum:eyes_of_atum>,<atum:body_of_atum>,<atum:legs_of_atum>,<atum:feet_of_atum>,<atum:halo_of_ra>,<atum:body_of_ra>,<atum:legs_of_ra>,<atum:feet_of_ra>,<atum:atums_protection>,<atum:atums_homecoming>,<atum:shus_swiftness>,<atum:isis_healing>,<atum:anubiss_mercy>,<atum:nuits_vanishing>,] as IItemStack[];

static emptiness_table as IItemStack[] = [<thaumicaugmentation:obelisk_placer:1>,<thaumcraft:stone_eldritch_tile>,<thaumcraft:stone_ancient>,<thaumicaugmentation:capstone:1>,<thaumicaugmentation:stone:1>,<thaumcraft:slab_eldritch>,<thaumicaugmentation:stone>,<thaumcraft:stone_ancient_tile>,<thaumicaugmentation:stone:3>,<thaumicaugmentation:stone:2>,<thaumicaugmentation:stone:10>,<thaumicaugmentation:bars>,<thaumicaugmentation:stone:9>,<thaumicaugmentation:stone:8>,<thaumcraft:pedestal_eldritch>,<thaumcraft:stairs_ancient>,<thaumicaugmentation:stairs_ancient>,<thaumicaugmentation:stone:5>,<thaumicaugmentation:stone:4>,<thaumcraft:stone_ancient_glyphed>,<thaumicaugmentation:stone:7>,<thaumcraft:pedestal_ancient>,<thaumicaugmentation:stone:6>,<thaumicaugmentation:taint_flower>,<thaumicaugmentation:slab>,<thaumicaugmentation:stairs_eldritch_tile>,<thaumcraft:slab_ancient>,] as IItemStack[];
// static emptiness_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static moon_table as IItemStack[] = [<mysticalagriculture:prosperity_ore>,<minecraft:coal_ore>,<minecraft:stone:5>,<minecraft:stone:3>,<thermalfoundation:fluid_redstone>,<appliedenergistics2:quartz_ore>,<minecraft:iron_ore>,<thermalfoundation:ore_fluid:2>,<minecraft:lapis_ore>,<chisel:limestone2:7>,<minecraft:gold_ore>,<minecraft:stone:1>,<minecraft:gravel>,<minecraft:redstone_ore>,<chisel:marble2:7>,<minecraft:dirt>,<evilcraft:dark_ore>,<appliedenergistics2:charged_quartz_ore>,<mysticalagriculture:inferium_ore>,<minecraft:emerald_ore>,<minecraft:diamond_ore>,<galacticraftcore:basic_block_moon:3>,<actuallyadditions:block_misc:3>,<galacticraftcore:basic_block_moon:2>,<draconicevolution:draconium_ore>,<thermalfoundation:ore:4>,<galacticraftcore:basic_block_moon:5>,<galacticraftcore:basic_block_moon:4>,<thermalfoundation:ore:5>,<thaumcraft:ore_amber>,<thermalfoundation:ore:2>,<thermalfoundation:ore:3>,<galacticraftcore:basic_block_moon:6>,<thaumcraft:ore_cinnabar>,<mekanism:oreblock>,<thermalfoundation:ore>,<thermalfoundation:ore:1>,<minecraft:clay>,] as IItemStack[];
// static moon_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static mars_table as IItemStack[] = [<mysticalagriculture:prosperity_ore>,<galacticraftcore:wall_gc:4>,<thermalfoundation:fluid_redstone>,<appliedenergistics2:quartz_ore>,<minecraft:iron_ore>,<minecraft:lapis_ore>,<thermalfoundation:fluid_crude_oil>,<minecraft:gravel>,<minecraft:ice>,<chisel:marble2:7>,<appliedenergistics2:charged_quartz_ore>,<evilcraft:dark_ore>,<minecraft:emerald_ore>,<minecraft:diamond_ore>,<draconicevolution:draconium_ore>,<thaumcraft:ore_cinnabar>,<mekanism:oreblock>,<minecraft:clay>,<galacticraftplanets:cavern_vines>,<galacticraftplanets:mars_stairs_cobblestone>,<minecraft:coal_ore>,<minecraft:stone:5>,<minecraft:stone:3>,<thermalfoundation:ore_fluid:2>,<thermalfoundation:ore_fluid:1>,<chisel:limestone2:7>,<minecraft:gold_ore>,<minecraft:stone>,<minecraft:stone:1>,<minecraft:redstone_ore>,<minecraft:dirt>,<mysticalagriculture:inferium_ore>,<galacticraftplanets:mars:6>,<actuallyadditions:block_misc:3>,<galacticraftplanets:mars:5>,<thermalfoundation:ore:4>,<galacticraftplanets:mars:4>,<thermalfoundation:ore:5>,<thaumcraft:ore_amber>,<thermalfoundation:ore:2>,<galacticraftplanets:mars:2>,<thermalfoundation:ore:3>,<thermalfoundation:ore>,<thermalfoundation:ore:1>,<galacticraftplanets:sludge>,<galacticraftplanets:mars:9>,] as IItemStack[];
// static mars_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static asteroids_table as IItemStack[] = [<galacticraftplanets:asteroids_block>,<galacticraftplanets:asteroids_block:1>,<galacticraftplanets:asteroids_block:4>,<galacticraftplanets:asteroids_block:2>,<galacticraftplanets:dense_ice>,<minecraft:diamond_ore>,] as IItemStack[];
// static asteroids_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static venus_table as IItemStack[] = [<mysticalagriculture:prosperity_ore>,<minecraft:coal_ore>,<minecraft:stone:5>,<thermalfoundation:fluid_redstone>,<minecraft:stone:3>,<thermalfoundation:ore_fluid>,<appliedenergistics2:quartz_ore>,<minecraft:iron_ore>,<galacticraftplanets:sulphuric_acid>,<thermalfoundation:ore_fluid:2>,<minecraft:lapis_ore>,<galacticraftplanets:venus:13>,<chisel:limestone2:7>,<minecraft:gold_ore>,<minecraft:stone:1>,<minecraft:gravel>,<galacticraftplanets:venus>,<galacticraftplanets:venus:1>,<galacticraftplanets:venus:2>,<galacticraftplanets:venus:3>,<chisel:marble2:7>,<minecraft:redstone_ore>,<minecraft:dirt>,<evilcraft:dark_ore>,<appliedenergistics2:charged_quartz_ore>,<mysticalagriculture:inferium_ore>,<minecraft:emerald_ore>,<minecraft:diamond_ore>,<draconicevolution:draconium_ore>,<actuallyadditions:block_misc:3>,<thermalfoundation:ore:4>,<thermalfoundation:ore:5>,<thaumcraft:ore_amber>,<thermalfoundation:ore:2>,<thaumcraft:ore_cinnabar>,<thermalfoundation:ore:3>,<mekanism:oreblock>,<thermalfoundation:ore>,<thermalfoundation:ore:1>,<minecraft:clay>,] as IItemStack[];
// static venus_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static eden_table as IItemStack[] = [<divinerpg:eden_leaves>,<divinerpg:twilight_stone>,<divinerpg:sunbloom>,<divinerpg:eden_ore>,<divinerpg:eden_brush>,<divinerpg:eden_grass>,<divinerpg:eden_dirt>,<divinerpg:sun_blossom>,<divinerpg:eden_log>,<divinerpg:divine_moss_stone>,] as IItemStack[];
// static eden_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static wildwood_table as IItemStack[] = [<divinerpg:wildwood_ore>,<minecraft:sign>,<divinerpg:wildwood_grass>,<minecraft:gold_block>,<divinerpg:wildwood_log>,<divinerpg:moon_bud>,<divinerpg:wildwood_vine>,<divinerpg:wildwood_stairs>,<minecraft:wool:14>,<divinerpg:twilight_stone>,<divinerpg:wildwood_tallgrass>,<divinerpg:moonlight_fern>,<minecraft:diamond_block>,<divinerpg:wildwood_leaves>,<divinerpg:wildwood_dirt>,<divinerpg:aqua_lamp>,] as IItemStack[];
// static wildwood_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static apalachia_table as IItemStack[] = [<chisel:cobblestonemossy1>,<erebus:formic_acid>,<divinerpg:apalachia_dirt>,<atum:deadwood_slab>,<divinerpg:dusk_flower>,<chisel:factory:1>,<divinerpg:apalachia_planks>,<minecraft:vine>,<minecraft:lapis_ore>,<minecraft:sand>,<divinerpg:apalachia_grass>,<divinerpg:apalachia_stairs>,<divinerpg:apalachia_leaves>,<divinerpg:cell_lamp>,<bibliocraft:table:5>,<divinerpg:apalachia_tallgrass>,<minecraft:double_plant:1>,<divinerpg:apalachia_ore>,<divinerpg:apalachia_log>,<bibliocraft:lampgold:12>,<twilightforest:huge_waterlily>,<quark:variant_leaves:1>,<divinerpg:apalachia_slab>,<bibliocraft:seat:5>,<divinerpg:dusk_bloom>,<atum:deadwood_planks>,<minecraft:redstone_block>,<tconstruct:faucet>,<minecraft:dirt>,<divinerpg:twilight_stone>,<minecraft:web>,<minecraft:leaves:3>,<divinerpg:apalachia_bricks>,] as IItemStack[];
// static apalachia_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static skythern_table as IItemStack[] = [<divinerpg:twilight_stone>,<divinerpg:skythern_log>,<divinerpg:skythern_grass>,<divinerpg:dust_brambles>,<divinerpg:dust_lily>,<divinerpg:skythern_dirt>,<divinerpg:skythern_brush>,<divinerpg:skythern_ore>,] as IItemStack[];
// static skythern_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static mortum_table as IItemStack[] = [<divinerpg:mortum_dirt>,<divinerpg:skythern_block>,<divinerpg:mortum_bricks>,<minecraft:skull>,<divinerpg:smoldering_tar>,<divinerpg:mortum_brush>,<divinerpg:mortum_ore>,<divinerpg:mortum_leaves>,<divinerpg:mortum_planks>,<divinerpg:twilight_stone>,<divinerpg:mortum_log>,<divinerpg:mortum_grass>,<divinerpg:demon_brambles>,<divinerpg:eye_plant>,] as IItemStack[];
// static mortum_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static iceika_table as IItemStack[] = [<minecraft:ice>,<divinerpg:frozen_stone>,<divinerpg:frozen_grass>,<divinerpg:coalstone>,<divinerpg:workshop_lamp>,<minecraft:snow_layer>,<divinerpg:icy_stone>,<divinerpg:icy_bricks>,<divinerpg:frozen_dirt>,<divinerpg:frozen_log>,<divinerpg:brittle_leaves>,] as IItemStack[];
static iceika_table_boss as IItemStack[] = [<divinerpg:snowflake>,<divinerpg:snowflake_shuriken>,<divinerpg:santa_helmet>,<divinerpg:santa_chestplate>,<divinerpg:santa_leggings>,<divinerpg:santa_boots>,<divinerpg:workshop_lamp>,<divinerpg:ice_shards>,] as IItemStack[];

static arcana_table as IItemStack[] = [<divinerpg:soul_stone>,<divinerpg:degraded_brick_stairs>,<divinerpg:degraded_brick_slab>,<divinerpg:ancient_tile>,<minecraft:redstone_lamp>,<minecraft:vine>,<divinerpg:ancient_brick_stairs>,<divinerpg:arcanium_extractor>,<divinerpg:dungeon_lamp>,<minecraft:lever>,<divinerpg:soul_sludge>,<minecraft:iron_bars>,<divinerpg:arcanium_power>,<divinerpg:degraded_brick_wall>,<divinerpg:ancient_brick_wall>,<divinerpg:arcanite_tubes>,<minecraft:bed:14>,<minecraft:wooden_slab>,<divinerpg:ancient_bricks>,<divinerpg:molten_furnace>,<divinerpg:ancient_stone>,<divinerpg:arcanium_metal>,<divinerpg:raw_arcanium>,<divinerpg:heat_trap>,<minecraft:log>,<minecraft:oak_stairs>,<divinerpg:ancient_brick_slab>,<divinerpg:degraded_bricks>,<divinerpg:dungeon_bookshelf>,] as IItemStack[];
// static arcana_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static vethea_table as IItemStack[] = [<divinerpg:light_dream_bricks>,<divinerpg:firelight>,<divinerpg:luna_stone>,<divinerpg:dream_dirt>,<divinerpg:hyrewood_log>,<divinerpg:dream_grass>,<divinerpg:mintwood_leaves>,<divinerpg:green_hungerstone>,<divinerpg:crypt_floor>,<divinerpg:fire_crystal>,<divinerpg:everstone>,<divinerpg:crypt_wall>,<divinerpg:infusion_table>,<divinerpg:mintwood_log>,<divinerpg:dreamwood_leaves>,<divinerpg:firewood_log>,<divinerpg:dark_dream_bricks>,<divinerpg:dream_stone>,<divinerpg:dreamwood_log>,<divinerpg:dark_everstone>,<divinerpg:hyrewood_leaves>,<divinerpg:white_everstone>,<divinerpg:black_hungerstone>,<divinerpg:firewood_leaves>,<divinerpg:dream_lamp>,<divinerpg:metal_caging>,<divinerpg:smooth_glass>,] as IItemStack[];
// static vethea_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static abyssal_wasteland_table as IItemStack[] = [<abyssalcraft:cwater>,<abyssalcraft:abycopore>,<abyssalcraft:luminousthistle>,<abyssalcraft:fusedabyssalsand>,<abyssalcraft:abyiroore>,<abyssalcraft:abyssalsand>,<abyssalcraft:darkstone_brick>,<abyssalcraft:darkstone_brick:1>,<abyssalcraft:abybrick>,<abyssalcraft:stone:1>,<abyssalcraft:abypcorore>,<abyssalcraft:cobblestone>,<abyssalcraft:abygolore>,<abyssalcraft:abytinore>,<abyssalcraft:abydiaore>,<abyssalcraft:abycorore>,] as IItemStack[];
// static abyssal_wasteland_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static dreadlands_table as IItemStack[] = [<abyssalcraft:darkstone_brick>,<abyssalcraft:darkstone_brick:1>,<abyssalcraft:abydreadore>,<abyssalcraft:dreadleaves>,<abyssalcraft:dreadplanks>,<natura:bluebells_flower>,<abyssalcraft:dreadlandsdirt>,<abyssalcraft:dreadore>,<abyssalcraft:stone:2>,<abyssalcraft:stone:3>,<abyssalcraft:cobblestone>,<abyssalcraft:dreadlog>,<abyssalcraft:dreadgrass>,<minecraft:brown_mushroom>,] as IItemStack[];
// static dreadlands_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static omothol_table as IItemStack[] = [<abyssalcraft:ethaxiumpillar>,<abyssalcraft:monolithpillar>,<abyssalcraft:ethaxiumbrickstairs>,<abyssalcraft:darkethaxiumbrickstairs>,<minecraft:bed:15>,<abyssalcraft:stone:5>,<abyssalcraft:stone:6>,<abyssalcraft:stone:7>,<abyssalcraft:ethaxiumbrick:1>,<abyssalcraft:ethaxiumbrick>,<abyssalcraft:crate>,<abyssalcraft:darkethaxiumbrickslab1>,<abyssalcraft:engraver>,<abyssalcraft:ethaxiumbrickslab1>,<abyssalcraft:antiwater>,<abyssalcraft:darkethaxiumbrick>,<minecraft:brown_mushroom>,] as IItemStack[];
// static omothol_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static dark_realm_table as IItemStack[] = [<minecraft:dirt>,<abyssalcraft:stone>,<minecraft:brown_mushroom>,<minecraft:red_mushroom>,] as IItemStack[];
// static dark_realm_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static deep_dark_table as IItemStack[] = [<mysticalagriculture:prosperity_ore>,<divinerpg:realmite_ore>,<divinerpg:arlemite_ore>,<thermalfoundation:fluid_redstone>,<appliedenergistics2:quartz_ore>,<minecraft:iron_ore>,<minecraft:lapis_ore>,<minecraft:sand>,<astralsorcery:blockcustomsandore>,<divinerpg:rupee_ore>,<minecraft:gravel>,<chisel:marble2:7>,<minecraft:red_flower>,<evilcraft:dark_ore>,<appliedenergistics2:charged_quartz_ore>,<minecraft:emerald_ore>,<minecraft:diamond_ore>,<thaumcraft:ore_cinnabar>,<mekanism:oreblock>,<minecraft:clay>,<minecraft:coal_ore>,<minecraft:stone:5>,<chisel:basalt2:7>,<minecraft:cobblestone>,<mysticalworld:amethyst_ore>,<minecraft:stone:3>,<thermalfoundation:ore_fluid>,<thermalfoundation:ore_fluid:2>,<thermalfoundation:ore_fluid:1>,<chisel:limestone2:7>,<minecraft:stone>,<minecraft:gold_ore>,<minecraft:stone:1>,<minecraft:redstone_ore>,<minecraft:dirt>,<bigreactors:oreyellorite>,<mysticalagriculture:inferium_ore>,<bewitchment:garnet_ore>,<actuallyadditions:block_misc:3>,<thermalfoundation:ore:4>,<thermalfoundation:ore:5>,<thaumcraft:ore_amber>,<thermalfoundation:ore:2>,<thermalfoundation:ore:3>,<thermalfoundation:ore>,<thermalfoundation:ore:1>,<bewitchment:opal_ore>,<minecraft:brown_mushroom>,] as IItemStack[];
// static deep_dark_table_boss as IItemStack[] = [<>,<>,<>,<>,<>,<>,] as IItemStack[];

static tableNameToTable as IItemStack[][string] = {
    "nether_table": nether_table,
    "end_table": end_table,
    "erebus_table": erebus_table,
    "aether_table": aether_table,
    "twilight_forest_table": twilight_forest_table,
    "underworld_table": underworld_table,
    "atum_table": atum_table,
    "emptiness_table": emptiness_table,
    "moon_table": moon_table,
    "mars_table": mars_table,
    "asteroids_table": asteroids_table,
    "venus_table": venus_table,
    "eden_table": eden_table,
    "wildwood_table": wildwood_table,
    "apalachia_table": apalachia_table,
    "skythern_table": skythern_table,
    "mortum_table": mortum_table,
    "iceika_table": iceika_table,
    "arcana_table": arcana_table,
    "vethea_table": vethea_table,
    "abyssal_wasteland_table": abyssal_wasteland_table,
    "dreadlands_table": dreadlands_table,
    "omothol_table": omothol_table,
    "dark_realm_table": dark_realm_table,
    "deep_dark_table": deep_dark_table,
} as IItemStack[][string];

// id to table name
static dimensionTable as string[int] = {
    -11325: "deep_dark_table",
    -31:    "venus_table",
    -30:    "asteroids_table",
    -29:    "mars_table",
    -28:    "moon_table",
    -9:     "underworld_table",
    -1:     "nether_table",
    // 0:      "overworld_table",
    1:      "end_table",
    4:      "aether_table",
    7:      "twilight_forest_table",
    17:     "atum_table",
    50:     "abyssal_wasteland_table",
    51:     "dreadlands_table",
    52:     "omothol_table",
    53:     "dark_realm_table",
    66:     "erebus_table",
    420:    "eden_table",
    421:    "wildwood_table",
    422:    "apalachia_table",
    423:    "skythern_table",
    424:    "mortum_table",
    425:    "iceika_table",
    426:    "arcana_table",
    427:    "vethea_table",
    14676:  "emptiness_table",
} as string[int];

// block id to table name
static portalTable as string[string] = {
    (<blockstate:extrautils2:teleporter:type=deep_dark>.block.definition.id): "deep_dark_table",
    // (<blockstate:galacticraftcore:landing_pad_full>.block.definition.id):     "venus_table",
    // (<blockstate:galacticraftcore:landing_pad_full>.block.definition.id):     "asteroids_table",
    // (<blockstate:galacticraftcore:landing_pad_full>.block.definition.id):     "mars_table",
    (<blockstate:galacticraftcore:landing_pad_full>.block.definition.id):     "moon_table",
    (<blockstate:lightningcraft:under_portal>.block.definition.id):           "underworld_table",
    (<blockstate:minecraft:portal>.block.definition.id):                      "nether_table",
    // 0:      "overworld_table",
    (<blockstate:minecraft:end_portal>.block.definition.id):                  "end_table",
    (<blockstate:aether_legacy:aether_portal>.block.definition.id):           "aether_table",
    (<blockstate:twilightforest:twilight_portal>.block.definition.id):        "twilight_forest_table",
    (<blockstate:atum:portal>.block.definition.id):                           "atum_table",
    (<blockstate:abyssalcraft:abyportal>.block.definition.id):                "abyssal_wasteland_table",
    // (<blockstate:abyssalcraft:abyportal>.block.definition.id):                "dreadlands_table",
    // (<blockstate:abyssalcraft:abyportal>.block.definition.id):                "omothol_table",
    // (<blockstate:abyssalcraft:abyportal>.block.definition.id):                "dark_realm_table",
    (<blockstate:erebus:portal>.block.definition.id):                         "erebus_table",
    (<blockstate:divinerpg:eden_portal>.block.definition.id):                 "eden_table",
    (<blockstate:divinerpg:wildwood_portal>.block.definition.id):             "wildwood_table",
    (<blockstate:divinerpg:apalachia_portal>.block.definition.id):            "apalachia_table",
    (<blockstate:divinerpg:skythern_portal>.block.definition.id):             "skythern_table",
    (<blockstate:divinerpg:mortum_portal>.block.definition.id):               "mortum_table",
    (<blockstate:divinerpg:iceika_portal>.block.definition.id):               "iceika_table",
    (<blockstate:divinerpg:arcana_portal>.block.definition.id):               "arcana_table",
    (<blockstate:divinerpg:nightmare_bed_block>.block.definition.id):         "vethea_table",
    // 14676:  "emptiness_table", // uses the <thaumicaugmentation:fracture_locator> item exclusively
} as string[string];


// quests that require "be in dimension [x]"
static questByDimension as int[] = [213,261,272,364,390,392,422,928,1040,1102,1114,1514,];


function completeQuests(player as IPlayer) as void {
    for id in questByDimension {
        Commands.call("bq_admin complete " + id, player, player.world, false, true);
    }
}


function dropOnInteract(world as IWorld, position as IBlockPos) as void {
    val output as IItemStack = getOutputOfDim(world.dimension, world.random);
    if (isNull(output)) return;
    drop(world, position, output);
}

function dropOnTravel(entity as IEntity, dimension as int) as void {
    val output as IItemStack = getOutputOfDim(dimension, entity.world.random);
    if (isNull(output)) return;
    drop(entity.world, entity.position, output);
}

function getOutputOfDim(dimension as int, random as IRandom) as IItemStack {
    var table as string = toTableId(dimension);
    if (isNull(table)) return null;
    return getOutputOfTable(table, random);
}

function getTable(isBoss as bool, table as string) as IItemStack[] {
    if (isBoss) {
        val list = toTable(table+"_boss");
        if (!isNull(list)) return list;
    }
    return toTable(table);
}

function getOutputOfTable(table as string, random as IRandom) as IItemStack {
    val isBoss = random.nextInt(100) == 0;
    var list as IItemStack[] = getTable(isBoss, table);
    var output as IItemStack = select(random, list);
    if (isNull(output)) return null;
    return output;
}

function toTableId(dimension as int) as string {
    return dimensionTable[dimension];
}

function toTable(table as string) as IItemStack[] {
    return tableNameToTable[table];
}

function select(random as IRandom, list as IItemStack[]) as IItemStack {
    var point as int = random.nextInt(list.length - 1);
    return list[point];
}

function drop(world as IWorld, position as IBlockPos, item as IItemStack) as void {
    world.spawnEntity(item.createEntityItem(world, position));
}

function interactTableLogic(blockID as string, item as IItemStack, random as IRandom) as string {
    if (<thaumicaugmentation:fracture_locator>.matches(item)) {
        return "emptiness_table";
    }

    var table = portalTable[blockID];
    if (isNull(table)) return null;

    if (table == "abyssal_wasteland_table") {
        val next = random.nextInt(4);
        if (next == 0) return "dreadlands_table";
        if (next == 1) return "omothol_table";
        if (next == 2) return "dark_realm_table";
        return "abyssal_wasteland_table";
    }
    if (table == "moon_table") {
        if (<ore:rocket_t1>.matches(item)) {
            return "moon_table";
        }
        if (<ore:rocket_t2>.matches(item)) {
            return "mars_table";
        }
        if (<ore:rocket_t3>.matches(item)) {
            return random.nextBoolean() ? "venus_table" : "asteroids_table";
        }
        return null; // no rocket in hand :(
    }
    return table;
}


// provide ways to automatically get the dimension output, typically via interacting with the portal block(s)
events.onPlayerInteractBlock(function(e as PlayerInteractBlockEvent) {
    if (e.player.world.remote) return;
    var table = interactTableLogic(e.block.definition.id, e.item, e.world.random);
    if (isNull(table)) return;
    drop(e.world, e.position, getOutputOfTable(table, e.world.random));
});

// block travelling to other dimensions
events.onEntityTravelToDimension(function(e as EntityTravelToDimensionEvent) {
    if (e.dimension != 0) e.cancel();
    if (e.entity instanceof IPlayer) dropOnTravel(e.entity, e.dimension);
});

// send player back to overworld if they somehow get out (Deep Dark + Simple Void World both do, perhaps other ways also exist)
events.onPlayerTick(function(e as PlayerTickEvent) {
    if (e.phase == "END" || e.side == "CLIENT" || isNull(e.player) || e.player.dimension == 0) return;
    dropOnTravel(e.player, e.player.dimension);
    e.player.dimension = 0;
    if (!isNull(e.player.bedLocation)) e.player.teleport(e.player.bedLocation);
});

// introduce the player to the setting, and complete impossible quests.
events.onPlayerLoggedIn(function(e as PlayerLoggedInEvent) {
    e.player.sendChat("Many people have complained \"§c§oThere are too many dimensions§r\" about the pack Divine Journey 2.");
    e.player.sendChat("This is a very common error I hear everyday.");
    e.player.sendChat("As such, in this update you will never be able to go to other dimensions!");
    e.player.sendChat("Hopefully this update (which was unrelatedly released on §6April 1st§r) will stop this complaint!");
    completeQuests(e.player);
});










