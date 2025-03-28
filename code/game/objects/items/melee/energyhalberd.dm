/*
 * Energy Halberds - TetraZeta, Imaginos and Zevo
 * Copied mostly from dualsaber.dm to avoid inhertance issues
 */
/obj/item/energyhalberd
	icon = 'icons/obj/weapon/energy.dmi'
	icon_state = "halberd"
	icon = 'icons/obj/weapon/energy.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/polearms_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/polearms_righthand.dmi'
	name = "energy halberd"
	desc = "For when a normal halberd just isnt enough."
	force = 3
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	hitsound = "swing_hit"
	armour_penetration = 35
	light_system = MOVABLE_LIGHT
	light_range = 4
	light_color = LIGHT_COLOR_ELECTRIC_GREEN
	light_on = FALSE
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "tore", "lacerated", "ripped", "diced", "cut")
	max_integrity = 200
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 70)
	resistance_flags = FIRE_PROOF
	var/active_w_class = WEIGHT_CLASS_BULKY
	var/halberd_color = "green"
	var/two_hand_force = 34
	var/hacked = FALSE
	var/list/possible_colors = list("red", "blue", "green", "purple", "yellow")

/obj/item/energyhalberd/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=force, force_wielded=two_hand_force, wieldsound='sound/weapons/saberon.ogg', unwieldsound='sound/weapons/saberoff.ogg')


/// Specific hulk checks due to reflection chance for balance issues and switches hitsounds.
/obj/item/energyhalberd/proc/on_halberdwield(obj/item/source, mob/living/carbon/user)
	SIGNAL_HANDLER

	if(user && user.has_dna())
		if(user.dna.check_mutation(HULK))
			to_chat(user, "<span class='warning'>You lack the grace to wield this!</span>")
			return COMPONENT_TWOHANDED_BLOCK_WIELD
	sharpness = IS_SHARP
	w_class = active_w_class
	hitsound = 'sound/weapons/blade1.ogg'
	START_PROCESSING(SSobj, src)
	set_light_on(TRUE)


/// switch hitsounds
/obj/item/energyhalberd/proc/on_halberdunwield(obj/item/source, mob/living/carbon/user)
	SIGNAL_HANDLER
	sharpness = initial(sharpness)
	w_class = initial(w_class)
	hitsound = "swing_hit"
	STOP_PROCESSING(SSobj, src)
	set_light_on(FALSE)


/obj/item/energyhalberd/update_icon_state()
	if(HAS_TRAIT(src, TRAIT_WIELDED))
		icon_state = "halberd[halberd_color]"
		return ..()
	else
		icon_state = "halberd"
		return ..()

/obj/item/energyhalberd/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, PROC_REF(on_halberdwield))
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, PROC_REF(on_halberdunwield))
	if(LAZYLEN(possible_colors))
		halberd_color = pick(possible_colors)
		switch(halberd_color)
			if("red")
				set_light_color(COLOR_SOFT_RED)
			if("green")
				set_light_color(LIGHT_COLOR_GREEN)
			if("blue")
				set_light_color(LIGHT_COLOR_LIGHT_CYAN)
			if("purple")
				set_light_color(LIGHT_COLOR_LAVENDER)
			if("yellow")
				set_light_color(COLOR_YELLOW)

/obj/item/energyhalberd/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/energyhalberd/attack(mob/target, mob/living/carbon/human/user)
	if(user.has_dna())
		if(user.dna.check_mutation(HULK))
			to_chat(user, "<span class='warning'>You grip the blade too hard and accidentally drop it!</span>")
			if(HAS_TRAIT(src, TRAIT_WIELDED))
				user.dropItemToGround(src, force=TRUE)
				return
	..()
	if(HAS_TRAIT(src, TRAIT_WIELDED) && HAS_TRAIT(user, TRAIT_CLUMSY) && prob(40))
		impale(user)
		return

/obj/item/energyhalberd/proc/impale(mob/living/user)
	to_chat(user, "<span class='warning'>You swing around a bit before losing your balance and impaling yourself on [src].</span>")
	if(HAS_TRAIT(src, TRAIT_WIELDED))
		user.take_bodypart_damage(20,25,check_armor = TRUE)
	else
		user.adjustStaminaLoss(25)

/obj/item/energyhalberd/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(HAS_TRAIT(src, TRAIT_WIELDED))
		return ..()
	return 0

/obj/item/energyhalberd/process(seconds_per_tick)
	if(HAS_TRAIT(src, TRAIT_WIELDED))
		if(hacked)
			set_light_color(pick(COLOR_SOFT_RED, LIGHT_COLOR_GREEN, LIGHT_COLOR_LIGHT_CYAN, LIGHT_COLOR_LAVENDER))
		open_flame()
	else
		STOP_PROCESSING(SSobj, src)

/obj/item/energyhalberd/IsReflect()
	if(HAS_TRAIT(src, TRAIT_WIELDED))
		return 1

/obj/item/energyhalberd/ignition_effect(atom/A, mob/user)
	// same as /obj/item/melee/energy, mostly
	if(!HAS_TRAIT(src, TRAIT_WIELDED))
		return ""
	var/in_mouth = ""
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(C.wear_mask)
			in_mouth = ", barely missing [user.p_their()] nose"
	. = "<span class='warning'>[user] swings [user.p_their()] [name][in_mouth]. [user.p_they(TRUE)] light[user.p_s()] [user.p_their()] [A.name] in the process.</span>"
	playsound(loc, hitsound, get_clamped_volume(), TRUE, -1)
	add_fingerprint(user)


/obj/item/energyhalberd/green
	possible_colors = list("green")

/obj/item/energyhalberd/red
	possible_colors = list("red")

/obj/item/energyhalberd/blue
	possible_colors = list("blue")

/obj/item/energyhalberd/purple
	possible_colors = list("purple")

/obj/item/energyhalberd/yellow
	possible_colors = list("yellow")

/obj/item/energyhalberd/attackby(obj/item/W, mob/user, params)
	if(W.tool_behaviour == TOOL_MULTITOOL)
		if(!hacked)
			hacked = TRUE
			to_chat(user, "<span class='warning'>HLBRDRNBW_ENGAGE</span>")
			halberd_color = "rainbow"
			update_appearance()
		else
			to_chat(user, "<span class='warning'>It's starting to look like a triple rainbow - no, nevermind.</span>")
	else
		return ..()
