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

/atom/movable/screen/alert/status_effect/dazzled
	name = "Dazzled"
	desc = "You're dazzled from the bright searchlight! The blinding effects will wear off after a bit once you get used to it, making you immune to further dazzling until your eyes return to normal."
	icon = 'modular_thabes/modules/shit_for_event/icons/event_structs.dmi'
	icon_state = "searchlight_on"

/datum/status_effect/dazzled
	id = "dazzled"
	status_type = STATUS_EFFECT_REFRESH
	duration = 5 SECONDS
	alert_type = /atom/movable/screen/alert/status_effect/dazzled

/datum/status_effect/dazzled/on_creation(mob/living/new_owner, set_duration)
	if(isnum(set_duration))
		duration = set_duration
	. = ..()
/*
/datum/status_effect/pacify/on_apply()
	ADD_TRAIT(owner, TRAIT_PACIFISM, "status_effect")
	return ..()

/datum/status_effect/pacify/on_remove()
	REMOVE_TRAIT(owner, TRAIT_PACIFISM, "status_effect")
*/
/obj/machinery/deployable_turret/spotlight
	name = "spotlight"
	desc = "While the trigger is held down, this spotlight will dazzle those in range."
	icon = 'modular_thabes/modules/shit_for_event/icons/event_structs.dmi'
	icon_state = "searchlight_off"
	can_buckle = TRUE
	anchored = TRUE
	view_range = 3
	projectile_type = null
	rate_of_fire = 1
	number_of_shots = 1
	cooldown_duration = 0.3 SECONDS
	overheatsound = null
	/// Sound to play when firing
	firesound = null
	/// If using a wrench on the turret will start undeploying it
	can_be_undeployed = FALSE

	use_power = IDLE_POWER_USE
		//0 = dont run the auto
		//1 = run auto, use idle
		//2 = run auto, use active
	idle_power_usage = 0
	active_power_usage = 2000

	var/is_on = FALSE

	light_system = MOVABLE_LIGHT_DIRECTIONAL
	light_color = "#fcffd9"
	light_power = 0
	light_range = 5
	var/obj/effect/abstract/searchlight/linked_searchlight

/obj/machinery/deployable_turret/spotlight/Initialize(mapload, apply_default_parts)
	. = ..()
	linked_searchlight = new(get_turf(src),src)

/obj/machinery/deployable_turret/spotlight/attack_hand(mob/living/user)
	. = ..()
	if(toggle_power())
		to_chat(user, "<span class='info'>You turn the [src] [is_on ? "on" : "off"].</span>")
	else
		to_chat(user, "<span class='danger'>[src] isn't responsive.</span>")

/obj/machinery/deployable_turret/spotlight/power_change()
	. = ..()
	if(machine_stat & (NOPOWER|BROKEN))
		toggle_power(FALSE)

/obj/machinery/deployable_turret/spotlight/proc/toggle_power(status_to_set)
	var/force_off
	if(machine_stat & (NOPOWER|BROKEN))
		. = FALSE
		force_off = TRUE
	if(!status_to_set && !force_off)
		is_on = !is_on
	else
		is_on = status_to_set

	if(is_on)
		set_light_power(10)
		icon_state = "searchlight_on"
		linked_searchlight.forceMove(get_turf(src))
	else
		set_light_power(0)
		icon_state = "searchlight_off"
		linked_searchlight.forceMove(src)

	linked_searchlight.check_if_lit()
	if(!force_off)
		return TRUE

/obj/machinery/deployable_turret/spotlight/fire_helper(mob/user)
	if(user.incapacitated() || !(user in buckled_mobs))
		return
	update_positioning() //REFRESH MOUSE TRACKING!!
	if(QDELETED(target))
		target = target_turf
	if(isclosedturf(target_turf))
		return
	linked_searchlight.throw_at(target_turf, 10, 1,spin=FALSE,gentle=TRUE)

/obj/effect/abstract/searchlight
	light_system = MOVABLE_LIGHT
	light_color = "#feffed"
	light_power = 0
	light_range = 5
	pass_flags = PASSTABLE | PASSMOB | PASSGLASS | PASSGRILLE | PASSBLOB | PASSMOB | PASSCLOSEDTURF

	var/obj/machinery/deployable_turret/spotlight/linked_spotlighter

/obj/effect/abstract/searchlight/has_gravity(turf/T)
	return TRUE

/obj/effect/abstract/searchlight/Initialize(mapload, spotlight_to_link)
	. = ..()
	linked_spotlighter = spotlight_to_link

/obj/effect/abstract/searchlight/process()
	if(light_power)
		check_flashers_in_range()
	check_if_lit()

/obj/effect/abstract/searchlight/Moved(atom/OldLoc, Dir)
	. = ..()
	check_if_lit()

/obj/effect/abstract/searchlight/proc/check_if_lit()
	if(linked_spotlighter)
		if(isInSight(linked_spotlighter, src) && linked_spotlighter.is_on)
			set_light_power(40)
			START_PROCESSING(SSprocessing, src)
		else
			set_light_power(0)
			STOP_PROCESSING(SSprocessing, src)

	else
		set_light_power(0)

/obj/effect/abstract/searchlight/proc/check_flashers_in_range(range = 2, power = 5)
	var/list/mob/targets = get_flash_targets(get_turf(src), range, FALSE)
	for(var/mob/living/carbon/dazzler in targets)
		do_flash(dazzler, power)
	return TRUE

/obj/effect/abstract/searchlight/proc/get_flash_targets(atom/target_loc, range = 2)
	if(!target_loc)
		target_loc = loc
	if(isturf(target_loc) || (ismob(target_loc) && isturf(target_loc.loc)))
		return viewers(range, get_turf(target_loc))
	else
		return typecache_filter_list(target_loc.GetAllContents(), GLOB.typecache_living)

/obj/effect/abstract/searchlight/proc/do_flash(mob/living/carbon/dazzler, power = 2)
	if(!istype(dazzler))
		return

	if(dazzler.has_status_effect(/datum/status_effect/dazzled))
		dazzler.apply_status_effect(/datum/status_effect/dazzled, "searchlight")

	else if(dazzler.flash_act())
		var/diff = power * CONFUSION_STACK_MAX_MULTIPLIER - dazzler.confused
		dazzler.confused += min(power, diff)
		visible_message("<span class='danger'>The bright searchlight dazzles [dazzler]!</span>")
		to_chat(dazzler, "<span class='userdanger'>The bright searchlight dazzles you!</span>")
		dazzler.apply_status_effect(/datum/status_effect/dazzled, "searchlight")

	else if(dazzler)
		visible_message("<span class='warning'>The bright searchlight attempts to dazzle [dazzler], but [dazzler.p_they()] seems unaffected!</span>")
		to_chat(dazzler, "<span class='userdanger'>The bright searchlight attempts to dazzle you, but your protection prevents it!</span>")

/obj/structure/fluff/sealadder
	name = "ladder"
	desc = "A ladder for climbing out the water."
	icon = 'modular_thabes/modules/shit_for_event/icons/event_structs.dmi'
	icon_state = "ladder2"
	deconstructible = FALSE
	layer = BELOW_MOB_LAYER
	pixel_y = -8
