//Shipping containers taken from https://github.com/tgstation/tgstation/pull/78444 and https://github.com/tgstation/tgstation/pull/68235 but heavily modified, shoutouts to EOBgames and coiledlamb!

/obj/structure/shipping_container
	name = "shipping container"
	desc = "A standard-measure shipping container for bulk transport of goods. It is unlabled, offering no clue as to its contents."
	icon = 'modular_thabes/modules/shit_for_event/icons/containers.dmi'
	icon_state = "random_container"
	max_integrity = 3000
	bound_width = 96
	bound_height = 32
	density = TRUE
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/shipping_container/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/largetransparency, _x_size=2,_y_size=0)

/obj/structure/shipping_container/blue
	icon_state = "blue"

/obj/structure/shipping_container/cyan
	icon_state = "cyan"

/obj/structure/shipping_container/red
	icon_state = "red"

/obj/structure/shipping_container/med
	icon_state = "med"

/obj/structure/shipping_container/green
	icon_state = "green"

/obj/structure/shipping_container/dark_red
	icon_state = "dark_red"

/obj/structure/shipping_container/white
	icon_state = "white"

/obj/structure/shipping_container/white
	icon_state = "yellow"

/obj/structure/shipping_container/nt
	icon_state = "nt"

/obj/structure/shipping_container/black
	icon_state = "black"

/obj/structure/shipping_container/lime
	icon_state = "lime"

/obj/effect/spawner/lootdrop/shipping_container
	name = "shipping container spawner"
	icon = 'modular_thabes/modules/shit_for_event/icons/containers.dmi'
	icon_state = "random_container"
	loot = list(
		/obj/structure/shipping_container/blue=1,
		/obj/structure/shipping_container/cyan=1,
		/obj/structure/shipping_container/red=1,
		/obj/structure/shipping_container/med=1,
		/obj/structure/shipping_container/green=1,
		/obj/structure/shipping_container/dark_red=1,
		/obj/structure/shipping_container/white=1,
		/obj/structure/shipping_container/white=1,
		/obj/structure/shipping_container/nt=1,
		/obj/structure/shipping_container/black=1,
		/obj/structure/shipping_container/lime=1,
	)

/* not today
/obj/item/clothing/mask
	var/breathing_sound = null //Set this if you want to have a gasmask like breathing sound when used.
	var/datum/looping_sound/gasmask/soundloop

/obj/item/clothing/mask/breath
	breathing_sound = null

/obj/item/clothing/mask/Initialize(mapload)
	. = ..()
	if(breathing_sound)
		soundloop = new(list(src), FALSE)

/obj/item/clothing/mask/gas
	breathing_sound = TRUE

/obj/item/clothing/mask/gas/tiki_mask
	breathing_sound = null

/obj/item/clothing/mask/gas/sexymime
	breathing_sound = null

/obj/item/clothing/mask/gas/monkeymask
	breathing_sound = null

/obj/item/clothing/mask/gas/mime
	breathing_sound = null

/obj/item/clothing/mask/gas/sexyclown
	breathing_sound = null

/obj/item/clothing/mask/gas/clown_hat
	breathing_sound = null

/obj/item/clothing/mask/gas/sechailer
	breathing_sound = null

/obj/item/clothing/mask/equipped(mob/living/mobster, slot)
	. = ..()
	if(mobster.stat == DEAD)
		soundloop?.stop()
		RegisterSignal(mobster,COMSIG_GLOB_MOB_DEATH,PROC_REF(stopsound))
		RegisterSignal(mobster,COMSIG_LIVING_REVIVE,PROC_REF(startsound))
		return
	if(slot == ITEM_SLOT_MASK)
		soundloop?.start()
		RegisterSignal(mobster,COMSIG_GLOB_MOB_DEATH,PROC_REF(stopsound))
		RegisterSignal(mobster,COMSIG_LIVING_REVIVE,PROC_REF(startsound))

	else
		soundloop?.stop()
		UnregisterSignal(mobster,COMSIG_GLOB_MOB_DEATH)
		UnregisterSignal(mobster,COMSIG_LIVING_REVIVE)

/obj/item/clothing/mask/proc/startsound()
	soundloop.start()

/obj/item/clothing/mask/proc/stopsound()
	soundloop.stop()

/obj/item/clothing/mask/adjustmask(mob/living/mobster)
	. = ..()
	if(mobster.stat == DEAD)
		soundloop?.stop()
		RegisterSignal(mobster,COMSIG_MOB_DEATH,PROC_REF(stopsound))
		RegisterSignal(mobster,COMSIG_LIVING_REVIVE,PROC_REF(startsound))
		return
	if(!mask_adjusted)
		soundloop?.start()
		RegisterSignal(mobster,COMSIG_MOB_DEATH,PROC_REF(stopsound))
		RegisterSignal(mobster,COMSIG_LIVING_REVIVE,PROC_REF(startsound))
	else
		soundloop?.stop()
		UnregisterSignal(mobster,COMSIG_MOB_DEATH)
		UnregisterSignal(mobster,COMSIG_LIVING_REVIVE)

/obj/item/clothing/mask/dropped(mob/mobster)
	. = ..()
	soundloop?.stop()
	UnregisterSignal(mobster,COMSIG_MOB_DEATH)
	UnregisterSignal(mobster,COMSIG_LIVING_REVIVE)

/datum/looping_sound/gasmask
	mid_sounds = list('modular_thabes/modules/shit_for_event/sound/gasmask.ogg'=1)
	mid_length = 3 SECONDS
	volume = 30
*/
