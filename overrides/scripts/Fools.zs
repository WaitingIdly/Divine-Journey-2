# Author: WaitingIdly
import crafttweaker.event.PlayerLoggedInEvent;

var x = 0;

for definition in game.items {
    for item in definition.subItems {
        if (x % 10 == 0) item.displayName = "The Thing";
        else if (x % 10 == 1) item.displayName = "The Other Thing";
        else if (x % 10 == 2) item.displayName = "You Know, That Thing";
        else if (x % 10 == 3) item.displayName = "No no no the other thing";
        else if (x % 10 == 4) {
            val mod = loadedMods[item.definition.owner];
            item.displayName = "Ah yes, " ~ item.displayName ~ " from the mod " ~ mod.name ~ ", version " ~ mod.version ~ ". Yes, that one.";
        }
        else if (x % 10 == 5) {
            val mod = loadedMods[item.definition.owner];
            item.displayName = "Uhhh, its from " ~ mod.name;
        }
        else item.displayName = "The Thing";

        x = x + 1;
    }
}

events.onPlayerLoggedIn(function(e as crafttweaker.event.PlayerLoggedInEvent) {
    e.player.sendChat("A number of people have complained about \"§c§oinaccuracy§r\" or \"§c§ovagueness§r\" when I inform them of various items.");
    e.player.sendChat("Hopefully this update (which was unrelatedly released on §6April 1st§r) will clear everything up!");
});
