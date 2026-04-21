package classes.content.totemic

import pokefenn.totemic.api.TotemicAPI
import pokefenn.totemic.api.totem.TotemEffectAPI
import pokefenn.totemic.api.totem.TotemBase
import pokefenn.totemic.api.totem.TotemEffect
import pokefenn.totemic.util.EntityUtil

// https://github.com/TeamTotemic/Totemic/blob/1.12.2/src/main/resources/assets/totemic/models/block/totem_pole_enderman.json

class TotemEffectSnake extends TotemEffect {

    static def INSTANCE;

    static {
        def id = getPackId() + ':snake'
        INSTANCE = new TotemEffectSnake(id, true, 20).setRegistryName(id)
    }

    TotemEffectSnake(String name, boolean portable, int interval) {
        super(name, portable, interval)
    }

    private static void incrementAntiVenom(EntityPlayer player) {
        // if (player.isPotionActive(potion('minecraft:poison'))) {
        //     // player.heal(player.getActivePotionEffect(potion('minecraft:poison')).getAmplifier() + 1)
        //     player.removePotionEffect(potion('minecraft:poison'))
        // }
        def data = player.getEntityData()
        def oldValue = data.getInteger('anti_venom_duration')
        data.setInteger('anti_venom_duration', Math.min(180, oldValue + 20))
    }

    @Override
    void effect(World world, BlockPos pos, TotemBase totem, int repetition) {
        if (world.isRemote) return
        int range = TotemicAPI.get().totemEffect().getDefaultRange(this, TotemEffectAPI.DEFAULT_BASE_RANGE, totem, repetition)
        EntityUtil.listEntitiesInRange(EntityPlayer.class, world, pos, range, range).each { player ->
            incrementAntiVenom(player)
        }
    }

    @Override
    void medicineBagEffect(World world, EntityPlayer player, ItemStack medicineBag, int charge) {
        if (world.isRemote) return
        incrementAntiVenom(player)
    }
}
