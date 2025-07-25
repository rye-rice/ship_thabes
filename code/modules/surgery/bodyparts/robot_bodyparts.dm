#define ROBOTIC_LIGHT_BRUTE_MSG "marred"
#define ROBOTIC_MEDIUM_BRUTE_MSG "dented"
#define ROBOTIC_HEAVY_BRUTE_MSG "falling apart"

#define ROBOTIC_LIGHT_BURN_MSG "scorched"
#define ROBOTIC_MEDIUM_BURN_MSG "charred"
#define ROBOTIC_HEAVY_BURN_MSG "smoldering"

//For ye whom may venture here, split up arm / hand sprites are formatted as "l_hand" & "l_arm".
//The complete sprite (displayed when the limb is on the ground) should be named "borg_l_arm".
//Failure to follow this pattern will cause the hand's icons to be missing due to the way get_limb_icon() works to generate the mob's icons using the aux_zone var.

/obj/item/bodypart/l_arm/robot
	name = "cyborg left arm"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	limb_id = "robotic"
	attack_verb = list("slapped", "punched")
	item_state = "buildpipe"
	static_icon =  'icons/mob/augmentation/augments.dmi'
	icon = null
	flags_1 = CONDUCT_1
	icon_state = "borg_l_arm"
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

	brute_reduction = 5
	burn_reduction = 4

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

/obj/item/bodypart/r_arm/robot
	name = "cyborg right arm"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	attack_verb = list("slapped", "punched")
	item_state = "buildpipe"
	static_icon =  'icons/mob/augmentation/augments.dmi'
	icon = null
	limb_id = "robotic"
	flags_1 = CONDUCT_1
	icon_state = "borg_r_arm"
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

	brute_reduction = 5
	burn_reduction = 4

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

/obj/item/bodypart/leg/left/robot
	name = "cyborg left leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	attack_verb = list("kicked", "stomped")
	item_state = "buildpipe"
	static_icon =  'icons/mob/augmentation/augments.dmi'
	icon = null
	limb_id = "robotic"
	flags_1 = CONDUCT_1
	icon_state = "borg_l_leg"
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

	brute_reduction = 5
	burn_reduction = 4

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

/obj/item/bodypart/leg/right/robot
	name = "cyborg right leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	attack_verb = list("kicked", "stomped")
	item_state = "buildpipe"
	static_icon =  'icons/mob/augmentation/augments.dmi'
	icon = null
	limb_id = "robotic"
	flags_1 = CONDUCT_1
	icon_state = "borg_r_leg"
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

	brute_reduction = 5
	burn_reduction = 4

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

/obj/item/bodypart/chest/robot
	name = "cyborg torso"
	desc = "A heavily reinforced case containing cyborg logic boards, with space for a standard power cell."
	item_state = "buildpipe"
	static_icon = 'icons/mob/augmentation/augments.dmi'
	icon = null
	limb_id = "robotic"
	flags_1 = CONDUCT_1
	icon_state = "borg_chest"
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

	brute_reduction = 5
	burn_reduction = 4

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

	var/wired = FALSE
	var/obj/item/stock_parts/cell/cell = null

/obj/item/bodypart/chest/robot/handle_atom_del(atom/A)
	if(A == cell)
		cell = null
	return ..()

/obj/item/bodypart/chest/robot/Destroy()
	QDEL_NULL(cell)
	return ..()

/obj/item/bodypart/chest/robot/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stock_parts/cell))
		if(cell)
			to_chat(user, span_warning("You have already inserted a cell!"))
			return
		else
			if(!user.transferItemToLoc(W, src))
				return
			cell = W
			to_chat(user, span_notice("You insert the cell."))
	else if(istype(W, /obj/item/stack/cable_coil))
		if(wired)
			to_chat(user, span_warning("You have already inserted wire!"))
			return
		var/obj/item/stack/cable_coil/coil = W
		if (coil.use(1))
			wired = TRUE
			to_chat(user, span_notice("You insert the wire."))
		else
			to_chat(user, span_warning("You need one length of coil to wire it!"))
	else
		return ..()

/obj/item/bodypart/chest/robot/wirecutter_act(mob/living/user, obj/item/I)
	. = ..()
	if(!wired)
		return
	. = TRUE
	I.play_tool_sound(src)
	to_chat(user, span_notice("You cut the wires out of [src]."))
	new /obj/item/stack/cable_coil(drop_location(), 1)
	wired = FALSE

/obj/item/bodypart/chest/robot/screwdriver_act(mob/living/user, obj/item/I)
	..()
	. = TRUE
	if(!cell)
		to_chat(user, span_warning("There's no power cell installed in [src]!"))
		return
	I.play_tool_sound(src)
	to_chat(user, span_notice("Remove [cell] from [src]."))
	cell.forceMove(drop_location())
	cell = null

/obj/item/bodypart/chest/robot/examine(mob/user)
	. = ..()
	if(cell)
		. += {"It has a [cell] inserted.\n
		[span_info("You can use a <b>screwdriver</b> to remove [cell].")]"}
	else
		. += span_info("It has an empty port for a <b>power cell</b>.")
	if(wired)
		. += "Its all wired up[cell ? " and ready for usage" : ""].\n"+\
		span_info("You can use <b>wirecutters</b> to remove the wiring.")
	else
		. += span_info("It has a couple spots that still need to be <b>wired</b>.")

/obj/item/bodypart/chest/robot/drop_organs(mob/user, violent_removal)
	if(wired)
		new /obj/item/stack/cable_coil(drop_location(), 1)
		wired = FALSE
	if(cell)
		cell.forceMove(drop_location())
		cell = null
	..()

/obj/item/bodypart/head/robot
	name = "cyborg head"
	desc = "A standard reinforced braincase, with spine-plugged neural socket and sensor gimbals."
	item_state = "buildpipe"
	static_icon = 'icons/mob/augmentation/augments.dmi'
	limb_id = "robotic"
	icon = null
	flags_1 = CONDUCT_1
	icon_state = "borg_head"
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

	brute_reduction = 5
	burn_reduction = 4

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

	var/obj/item/assembly/flash/handheld/flash1 = null
	var/obj/item/assembly/flash/handheld/flash2 = null


/obj/item/bodypart/head/robot/handle_atom_del(atom/A)
	if(A == flash1)
		flash1 = null
	if(A == flash2)
		flash2 = null
	return ..()

/obj/item/bodypart/head/robot/Destroy()
	QDEL_NULL(flash1)
	QDEL_NULL(flash2)
	return ..()

/obj/item/bodypart/head/robot/examine(mob/user)
	. = ..()
	if(!flash1 && !flash2)
		. += span_info("It has two empty eye sockets for <b>flashes</b>.")
	else
		var/single_flash = FALSE
		if(!flash1 || !flash2)
			single_flash = TRUE
			. += {"One of its eye sockets is currently occupied by a flash.\n
			[span_info("It has an empty eye socket for another <b>flash</b>.")]"}
		else
			. += "It has two eye sockets occupied by flashes."
		. += span_notice("You can remove the seated flash[single_flash ? "":"es"] with a <b>crowbar</b>.")

/obj/item/bodypart/head/robot/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/assembly/flash/handheld))
		var/obj/item/assembly/flash/handheld/F = W
		if(flash1 && flash2)
			to_chat(user, span_warning("You have already inserted the eyes!"))
			return
		else if(F.burnt_out)
			to_chat(user, span_warning("You can't use a broken flash!"))
			return
		else
			if(!user.transferItemToLoc(F, src))
				return
			if(flash1)
				flash2 = F
			else
				flash1 = F
			to_chat(user, span_notice("You insert the flash into the eye socket."))
			return
	return ..()

/obj/item/bodypart/head/robot/crowbar_act(mob/living/user, obj/item/I)
	..()
	if(flash1 || flash2)
		I.play_tool_sound(src)
		to_chat(user, span_notice("You remove the flash from [src]."))
		if(flash1)
			flash1.forceMove(drop_location())
			flash1 = null
		if(flash2)
			flash2.forceMove(drop_location())
			flash2 = null
	else
		to_chat(user, span_warning("There is no flash to remove from [src]."))
	return TRUE

/obj/item/bodypart/head/robot/drop_organs(mob/user, violent_removal)
	if(flash1)
		flash1.forceMove(user.loc)
		flash1 = null
	if(flash2)
		flash2.forceMove(user.loc)
		flash2 = null
	..()

/obj/item/bodypart/l_arm/robot/surplus
	name = "surplus prosthetic left arm"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing."
	static_icon = 'icons/mob/augmentation/surplus_augments.dmi'
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 20

/obj/item/bodypart/r_arm/robot/surplus
	name = "surplus prosthetic right arm"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing."
	static_icon = 'icons/mob/augmentation/surplus_augments.dmi'
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 20

/obj/item/bodypart/leg/left/robot/surplus
	name = "surplus prosthetic left leg"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing."
	static_icon = 'icons/mob/augmentation/surplus_augments.dmi'
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 20

/obj/item/bodypart/leg/right/robot/surplus
	name = "surplus prosthetic right leg"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing."
	static_icon = 'icons/mob/augmentation/surplus_augments.dmi'
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 20

// Lizard Robotic (Synths)
/obj/item/bodypart/chest/robot/lizard
	name = "prosthetic lizard chest"
	is_dimorphic = TRUE
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC
	acceptable_bodytype = BODYTYPE_HUMANOID

/obj/item/bodypart/head/robot/lizard
	name = "prosthetic lizard head"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC | BODYTYPE_SNOUT

/obj/item/bodypart/l_arm/robot/lizard
	name = "prosthetic lizard left arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/lizard
	name = "prosthetic lizard right arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/lizard
	name = "prosthetic lizard left leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/lizard
	name = "prosthetic lizard right leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

// Surplus Lizard Robotic
/obj/item/bodypart/l_arm/robot/surplus/lizard
	name = "surplus prosthetic lizard left arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/surplus/lizard
	name = "surplus prosthetic lizard right arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/surplus/lizard
	name = "surplus prosthetic lizard left leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/right/robot/surplus/lizard
	name = "surplus prosthetic lizard right leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/surplus/lizard/digitigrade
	name = "surplus prosthetic digitigrade lizard left leg"
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/leg/right/robot/surplus/lizard/digitigrade
	name = "surplus prosthetic digitigrade lizard right leg"
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC | BODYTYPE_DIGITIGRADE

//Kepori Robotic
/obj/item/bodypart/chest/robot/kepori
	name = "prosthetic kepori chest"
	static_icon = 'icons/mob/augmentation/augments_kepori.dmi'
	bodytype = BODYTYPE_KEPORI | BODYTYPE_ROBOTIC
	acceptable_bodytype = BODYTYPE_KEPORI

/obj/item/bodypart/head/robot/kepori
	name = "prosthetic kepori head"
	static_icon = 'icons/mob/augmentation/augments_kepori.dmi'
	bodytype = BODYTYPE_KEPORI | BODYTYPE_ROBOTIC

/obj/item/bodypart/l_arm/robot/kepori
	name = "prosthetic kepori left arm"
	static_icon = 'icons/mob/augmentation/augments_kepori.dmi'
	bodytype = BODYTYPE_KEPORI | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/kepori
	name = "prosthetic kepori right arm"
	static_icon = 'icons/mob/augmentation/augments_kepori.dmi'
	bodytype = BODYTYPE_KEPORI | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/kepori
	name = "prosthetic kepori left leg"
	static_icon = 'icons/mob/augmentation/augments_kepori.dmi'
	bodytype = BODYTYPE_KEPORI | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/right/robot/kepori
	name = "prosthetic kepori right leg"
	static_icon = 'icons/mob/augmentation/augments_kepori.dmi'
	bodytype = BODYTYPE_KEPORI | BODYTYPE_ROBOTIC

//Surplus Kepori Robotic
/obj/item/bodypart/l_arm/robot/surplus/kepori
	name = "surplus prosthetic kepori left arm"
	static_icon = 'icons/mob/augmentation/augments_kepori.dmi'
	bodytype = BODYTYPE_KEPORI | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/surplus/kepori
	name = "surplus prosthetic kepori right arm"
	static_icon = 'icons/mob/augmentation/augments_kepori.dmi'
	bodytype = BODYTYPE_KEPORI | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/surplus/kepori
	name = "surplus prosthetic kepori left leg"
	static_icon = 'icons/mob/augmentation/augments_kepori.dmi'
	bodytype = BODYTYPE_KEPORI | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/right/robot/surplus/kepori
	name = "surplus prosthetic kepori right leg"
	static_icon = 'icons/mob/augmentation/augments_kepori.dmi'
	bodytype = BODYTYPE_KEPORI | BODYTYPE_ROBOTIC


// Vox Robotic
/obj/item/bodypart/chest/robot/vox
	name = "prosthetic vox chest"
	is_dimorphic = TRUE
	static_icon = 'icons/mob/augmentation/augments_vox.dmi'
	bodytype = BODYTYPE_VOX | BODYTYPE_ROBOTIC
	acceptable_bodytype = BODYTYPE_VOX

/obj/item/bodypart/head/robot/vox
	name = "prosthetic vox head"
	is_dimorphic = TRUE
	static_icon = 'icons/mob/augmentation/augments_vox.dmi'
	bodytype = BODYTYPE_VOX | BODYTYPE_ROBOTIC

/obj/item/bodypart/l_arm/robot/vox
	name = "prosthetic vox left arm"
	static_icon = 'icons/mob/augmentation/augments_vox.dmi'
	bodytype = BODYTYPE_VOX | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/vox
	name = "prosthetic vox right arm"
	static_icon = 'icons/mob/augmentation/augments_vox.dmi'
	bodytype = BODYTYPE_VOX | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/vox
	name = "prosthetic vox left leg"
	static_icon = 'icons/mob/augmentation/augments_vox.dmi'
	bodytype = BODYTYPE_VOX | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/right/robot/vox
	name = "prosthetic vox right leg"
	static_icon = 'icons/mob/augmentation/augments_vox.dmi'
	bodytype = BODYTYPE_VOX | BODYTYPE_ROBOTIC

// Surplus Vox Robotic
/obj/item/bodypart/l_arm/robot/surplus/vox
	name = "surplus prosthetic vox left arm"
	static_icon = 'icons/mob/augmentation/augments_vox.dmi'
	bodytype = BODYTYPE_VOX | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/surplus/vox
	name = "surplus prosthetic vox right arm"
	static_icon = 'icons/mob/augmentation/augments_vox.dmi'
	bodytype = BODYTYPE_VOX | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/surplus/vox
	name = "surplus prosthetic vox left leg"
	static_icon = 'icons/mob/augmentation/augments_vox.dmi'
	bodytype = BODYTYPE_VOX | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/right/robot/surplus/vox
	name = "surplus prosthetic vox right leg"
	static_icon = 'icons/mob/augmentation/augments_vox.dmi'
	bodytype = BODYTYPE_VOX | BODYTYPE_ROBOTIC

#undef ROBOTIC_LIGHT_BRUTE_MSG
#undef ROBOTIC_MEDIUM_BRUTE_MSG
#undef ROBOTIC_HEAVY_BRUTE_MSG

#undef ROBOTIC_LIGHT_BURN_MSG
#undef ROBOTIC_MEDIUM_BURN_MSG
#undef ROBOTIC_HEAVY_BURN_MSG
