package classes.fixes

import net.minecraftforge.common.util.Constants

class NbtHelper {

    // copy the used tags so we don't have to import constants everywhere
    public static final int BYTE = Constants.NBT.TAG_BYTE
    public static final int SHORT = Constants.NBT.TAG_SHORT
    public static final int INT = Constants.NBT.TAG_INT
    public static final int LONG = Constants.NBT.TAG_LONG
    public static final int FLOAT = Constants.NBT.TAG_FLOAT
    public static final int DOUBLE = Constants.NBT.TAG_DOUBLE
    public static final int BYTE_ARRAY = Constants.NBT.TAG_BYTE_ARRAY
    public static final int STRING = Constants.NBT.TAG_STRING
    public static final int LIST = Constants.NBT.TAG_LIST
    public static final int COMPOUND = Constants.NBT.TAG_COMPOUND
    public static final int INT_ARRAY = Constants.NBT.TAG_INT_ARRAY
    public static final int LONG_ARRAY = Constants.NBT.TAG_LONG_ARRAY
    public static final int ANY_NUMBER = Constants.NBT.TAG_ANY_NUMERIC

    /// remove any number of tags from a single nbt compound
    static void removeTags(NBTTagCompound compound, String... removal) {
        removal.each { it -> compound.removeTag(it) }
    }

    /// generate a default itemstack representation
    static NBTTagCompound itemStackRep(String id, int amount = 1, int damage = 0, NBTTagCompound tag = null) {
        def stack = new NBTTagCompound()
        stack.setString('id', id)
        stack.setByte('Count', amount as byte)
        stack.setShort('Damage', damage as short)
        if (tag != null) stack.setTag('tag', tag)
        return stack
    }

    /// store any number of itemstacks into a matter cluster,
    /// which can be right-clicked to extract all contained stacks.
    /// useful for when a single itemstack being removed is effectively 2 itemstacks
    static NBTTagCompound clusterStacks(List<NBTTagCompound> stacks) {
        def tag = new NBTTagCompound()
        def cluster = new NBTTagCompound()
        def items = new NBTTagList()
        stacks.each { e ->
            def entry = nbt()
            entry.setInteger('count', 1)
            entry.setTag('item', e)
            items.appendTag(entry)
        }
        cluster.setInteger('total', stacks.size())
        cluster.setTag('items', items)
        tag.setTag('clusteritems', cluster)
        return itemStackRep('avaritia:matter_cluster', 1, 0, tag)
    }
}
