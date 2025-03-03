/obj/item/binoculars/rangefinder

/obj/item/binoculars/rangefinder/afterattack(atom/target, mob/living/user, flag, params)
	var/turf/targloc = get_turf(target)
	//laser pointer image
	icon_state = "pointer_[pointer_icon_state]"
	var/image/I = image('icons/obj/projectiles.dmi',targloc,pointer_icon_state,10)
	var/list/modifiers = params2list(params)
	if(modifiers)
		if(LAZYACCESS(modifiers, ICON_X))
			I.pixel_x = (text2num(LAZYACCESS(modifiers, ICON_X)) - 16)
		if(LAZYACCESS(modifiers, ICON_Y))
			I.pixel_y = (text2num(LAZYACCESS(modifiers, ICON_Y)) - 16)
	else
		I.pixel_x = target.pixel_x + rand(-5,5)
		I.pixel_y = target.pixel_y + rand(-5,5)

	var/datum/virtual_level/our_vlevel = get_virtual_level()
	if(!our_vlevel)
		continue
	var/list/coords = our_vlevel.get_relative_coords(targloc)

	to_chat(user, span_notice("COORDINATES: LONGITUDE [targloc.coords[1]]. LATITUDE [targloc.targloc.coords[2]]."))
	playsound(src, 'sound/effects/binoctarget.ogg', 35)


/obj/machinery/artillery
	name = "\improper howitzer"
	desc = "A manual, crew-operated and towable howitzer, will rain down shells on any of your foes."
	fire_sound = 'sound/weapons/guns/fire/howitzer_fire.ogg'
	var/reload_sound = 'sound/weapons/guns/interact/tat36_reload.ogg'
	var/fall_sound = 'sound/weapons/guns/misc/howitzer_whistle.ogg'
	obj_integrity = 400
	max_integrity = 400
	///Minimum range to fire
	var/minimum_range = 15
	/// Max spread on target
	var/max_spread = 5
	/// Used for deconstruction and aiming sanity
	var/firing = 0
	///Time it takes for the mortar to cool off to fire
	var/cool_off_time = 10 SECONDS
	///Time to load a shell
	var/reload_time = 1 SECONDS
	var/target_x
	var/target_y

/obj/item/structure/artillery/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	var/old_x = target_x
	var/old_y = target_y
	var/inputed

	inputed = input(usr, "Set target X", "Coords", target_x) as num
	if(!inputed)
		return
	inputed = target_x
	inputed = input(usr, "Set target Y", "Coords", target_y) as num
	if(!inputed)
		return
	inputed = target_y

	var/datum/virtual_level/our_vlevel = get_virtual_level()
	if(!our_vlevel)
		continue
	var/list/our_coords = our_vlevel.get_relative_coords(targloc)

	var/real_x = our_vlevel.low_x + target_x - 1
	var/real_y = our_vlevel.low_y + target_y - 1

	var/turf/target_turf = locate(real_x, real_y)
	if(get_dist(loc, target_turf) < minimum_range)
		user.balloon_alert(user, "The target is too close to the gun.")
		return

	if(!isturf(target_turf))
		user.balloon_alert(user, "You cannot fire the gun to this target.")
		return


	to_chat(user, span_notice("TARGET SET: LONGITUDE [targloc.coords[1]]. LATITUDE [targloc.targloc.coords[2]]."))

/obj/item/structure/artillery/mortar
	name = "\improper mortar"
	desc = "A manual, crew-operated mortar system intended to rain down shells on anything it's aimed at. Less accurate than a howitzer, but still useful neverless. Needs to be set down first to fire. Ctrl+Click on a tile to deploy, drag the mortar's sprites to mob's sprite to undeploy."
	obj_integrity = 200
	max_integrity = 200
	fire_sound = 'sound/weapons/guns/fire/mortar_fire.ogg'
	reload_sound = 'sound/weapons/guns/interact/mortar_reload.ogg' // Our reload sound.
	fall_sound = 'sound/weapons/guns/misc/mortar_long_whistle.ogg' //The sound the shell makes when falling.
	/// Max spread on target
	max_spread = 5
	busy = 0
	/// Used for deconstruction and aiming sanity
	firing = 0
	///Time it takes for the mortar to cool off to fire
	cool_off_time = 1 SECONDS
	///Time to load a shell
	reload_time = 0.5 SECONDS


// Shells themselves //

/obj/item/mortal_shell
	name = "\improper 80mm mortar shell"
	desc = "An unlabeled 80mm mortar shell, probably a casing."
	icon = 'icons/Marine/mortar.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/inhands/weapons/ammo_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/weapons/ammo_right.dmi',
	)
	icon_state = "mortar_ammo_cas"
	w_class = WEIGHT_CLASS_SMALL
	flags_atom = CONDUCT
	///Ammo projectile typepath that the shell uses
	var/obj/projectile/bullet/ammo_type

/obj/item/mortal_shell/he
	name = "\improper 80mm high explosive mortar shell"
	desc = "An 80mm mortar shell, loaded with a high explosive charge."
	icon_state = "mortar_ammo_he"
	ammo_type = /obj/projectile/bullet/mortar

/obj/item/mortal_shell/incendiary
	name = "\improper 80mm incendiary mortar shell"
	desc = "An 80mm mortar shell, loaded with a napalm charge."
	icon_state = "mortar_ammo_inc"
	ammo_type = /obj/projectile/bullet/mortar/incend

/obj/item/mortal_shell/smoke
	name = "\improper 80mm smoke mortar shell"
	desc = "An 80mm mortar shell, loaded with smoke dispersal agents. Can be fired at marines more-or-less safely. Way slimmer than your typical 80mm."
	icon_state = "mortar_ammo_smk"
	ammo_type = /datum/ammo/mortar/smoke

/obj/item/mortal_shell/plasmaloss
	name = "\improper 80mm tangle mortar shell"
	desc = "An 80mm mortar shell, loaded with plasma-draining Tanglefoot gas. Can be fired at marines more-or-less safely."
	icon_state = "mortar_ammo_fsh"
	ammo_type = /datum/ammo/mortar/smoke/plasmaloss

/obj/item/mortal_shell/flare
	name = "\improper 80mm flare mortar shell"
	desc = "An 80mm mortar shell, loaded with an illumination flare, far slimmer than your typical 80mm shell. Can be fired out of larger cannons."
	icon_state = "mortar_ammo_flr"
	ammo_type = /datum/ammo/mortar/flare


/obj/item/mortal_shell/howitzer
	name = "\improper 150mm artillery shell"
	desc = "An unlabeled 150mm shell, probably a casing."
	icon = 'icons/Marine/howitzer.dmi'
	icon_state = "howitzer_ammo"
	w_class = WEIGHT_CLASS_BULKY

/obj/item/mortal_shell/howitzer/he
	name = "\improper 150mm high explosive artillery shell"
	desc = "An 150mm artillery shell, loaded with a high explosive charge, whatever is hit by this will have, A really, REALLY bad day."
	ammo_type = /datum/ammo/mortar/howi

/obj/item/mortal_shell/howitzer/plasmaloss
	name = "\improper 150mm 'Tanglefoot' artillery shell"
	desc = "An 150mm artillery shell, loaded with a toxic intoxicating gas, whatever is hit by this will have their abilities sapped slowly. Acommpanied by a small moderate explosion."
	icon_state = "howitzer_ammo_purp"
	ammo_type = /datum/ammo/mortar/smoke/howi/plasmaloss

/obj/item/mortal_shell/howitzer/incendiary
	name = "\improper 150mm incendiary artillery shell"
	desc = "An 150mm artillery shell, loaded with explosives to punch through light structures then burn out whatever is on the other side. Will ruin their day and skin."
	icon_state = "howitzer_ammo_incend"
	ammo_type = /datum/ammo/mortar/howi/incend

/obj/item/mortal_shell/howitzer/white_phos
	name = "\improper 150mm white phosporous 'spotting' artillery shell"
	desc = "An 150mm artillery shell, loaded with a 'spotting' gas that sets anything it hits aflame, whatever is hit by this will have their day, skin and future ruined, with a demand for a warcrime tribunal."
	icon_state = "howitzer_ammo_wp"
	ammo_type = /datum/ammo/mortar/smoke/howi/wp

/obj/projectile/bullet/mortar
	name = "80mm shell"
	icon_state = "mortar"

	movement_type = PHASING
	pass_flags = PASSTABLE | PASSGRILLE | PASSGRILLE | PASSMOB | PASSCLOSEDTURF | LETPASSTHROW | PASSPLATFORM

	speed = 0.75
	damage = 0
	max_range = 1000
	bullet_color = COLOR_VERY_SOFT_YELLOW
	light_range = 1.5

/obj/projectile/bullet/mortar/proc/payload()
	explosion(get_turf(src), 1, 2, 5, 0, flame_range = 3)

/obj/projectile/bullet/mortar/on_range()
	payload()
	return ..()

