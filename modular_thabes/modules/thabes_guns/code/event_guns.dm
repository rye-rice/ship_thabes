/obj/item/gun/ballistic/automatic/assault/p16
	icon = 'modular_thabes/modules/thabes_guns/icons/48x32.dmi'

	mob_overlay_icon = 'modular_thabes/modules/thabes_guns/icons/inhands/onmob_guns.dmi'

	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
	righthand_file =  = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'

/obj/item/gun/ballistic/automatic/gal
	name = "CM-F4"
	desc = "The standard issue DMR of CLIP. Dates back to the Xenofauna War for long range support against xenofauna. Chambered in .308."
	icon = 'modular_thabes/modules/thabes_guns/icons/48x32.dmi'

	mob_overlay_icon = 'modular_thabes/modules/thabes_guns/icons/inhands/onmob_guns.dmi'

	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
	righthand_file =  = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'

/obj/item/gun/ballistic/automatic/gal/sniper
	name = "CM-F40"
	desc = "The standard issue DMR of CLIP. Dates back to the Xenofauna War for long range support against xenofauna. Chambered in .308."
	icon_state = "cmf40"

	zoomable = TRUE
	zoom_amt = 10 //Long range, enough to see in front of you, but no tiles behind you.
	zoom_out_amt = 5

	manufacturer = MANUFACTURER_SOLARARMORIES
	spread = -5
	spread_unwielded = 20
	recoil = 0
	recoil_unwielded = 4
	wield_slowdown = 1
	wield_delay = 1.3 SECONDS

/obj/item/gun/ballistic/automatic/smg/cm5
	icon = 'modular_thabes/modules/thabes_guns/icons/48x32.dmi'

	mob_overlay_icon = 'modular_thabes/modules/thabes_guns/icons/inhands/onmob_guns.dmi'

	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
	righthand_file =  = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'

/obj/item/gun/ballistic/shotgun/bulldog/minutemen
	icon = 'modular_thabes/modules/thabes_guns/icons/48x32.dmi'

	mob_overlay_icon = 'modular_thabes/modules/thabes_guns/icons/inhands/onmob_guns.dmi'

	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
	righthand_file =  = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'

/obj/item/gun/ballistic/automatic/pistol/cm23
	name = "\improper CM-23"
	desc = "The 10 round service pistol of CLIP. It has become more rare in Minutemen as time has passed on, but still sees action in specialized units or the frontier. Chambered in 10mm."

	icon = 'modular_thabes/modules/thabes_guns/icons/guns.dmi'
	icon_state = "cm23"
	item_state = "clip_generic"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = FALSE
	fire_sound = 'sound/weapons/gun/pistol/candor.ogg'
	rack_sound = 'sound/weapons/gun/pistol/candor_cocked.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'
	manufacturer = MANUFACTURER_HUNTERSPRIDE
	load_sound = 'sound/weapons/gun/pistol/candor_reload.ogg'
	load_empty_sound = 'sound/weapons/gun/pistol/candor_reload.ogg'
	eject_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'
	recoil = -2

/obj/item/gun/ballistic/automatic/pistol/cm70
	name = "CM-70 machine pistol"
	desc = "A burst-fire machine pistol. Chambered in 9mm."
	icon_state = "cm70"
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 1
	actions_types = list(/datum/action/item_action/toggle_firemode)

	spread = 6
	spread_unwielded = 12

/obj/item/ammo_box/magazine/m9mm_cm70
	name = "CM-70 machine pistol magazine (9mm)"
	desc = "A long, 18-round double-stack magazine designed for the CM-70 pistol. These rounds do okay damage, but struggle against armor."
	icon_state = "9x19p-8"
	base_icon_state = "9x19p"	
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 18

//FFV

/obj/item/gun/ballistic/automatic/pistol/conflagration
	name = "\improper HP Ashfire"
	desc = "A strangely ancient and complex pistol. It uses stripper clips to reload, or simply load it one by one. Chambered in 9mm."
	icon_state = "conflagration"
	item_state = "hp_generic_fresh"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/conflagration
	internal_magazine = TRUE
	can_suppress = FALSE
	fire_sound = 'sound/weapons/gun/revolver/shot_light.ogg'
	rack_sound = 'sound/weapons/gun/pistol/candor_cocked.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/candor_cocked.ogg'
	manufacturer = MANUFACTURER_NONE
	load_sound = 'sound/weapons/gun/general/magazine_insert_full.ogg'
	load_empty_sound = 'sound/weapons/gun/general/magazine_insert_full.ogg'
	eject_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'
	spread = 6
	spread_unwielded = 14

/obj/item/ammo_box/magazine/internal/conflagration
	name = "conflagration internal magazine"
	desc = "Oh god, this shouldn't be here"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 10
	instant_load = TRUE

// 9mm Stripper Clip (Conflagration)

/obj/item/ammo_box/stripper_9mm
	name = "stripper clip (9mm)"
	desc = "A 10-round stripper clip for the Conflagration pistol."
	icon_state = "stripper_9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 10
	multiple_sprites = AMMO_BOX_PER_BULLET
	instant_load = TRUE

/obj/item/gun/ballistic/automatic/pistol/mauler
	name = "Mauler 'Stop' pistol"
	desc = "A full auto machine pistol. The 'Stop' in it's name refers to it's insane stopping power, although it is mostly useless with outside of CQC and anything with armor. Chambered in 9mm."
	icon_state = "mauler"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 2
	actions_types = list(/datum/action/item_action/toggle_firemode)

	spread = 10
	spread_unwielded = 20
	recoil = 1
	recoil_unwielded = 4

/obj/item/gun/ballistic/automatic/pistol/mauler
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.8 SECONDS)


/obj/item/ammo_box/magazine/m9mm_mauler
	name = "mauler pistol magazine (9mm)"
	desc = "A long, 11-round magazine designed for the Mauler 'Stop' pistol. These rounds do okay damage, but struggle against armor."
	icon_state = "9x19p-8"
	base_icon_state = "9x19p"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 15

/obj/item/ammo_box/magazine/m9mm_mauler/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[ammo_count() ? "8" : "0"]"
