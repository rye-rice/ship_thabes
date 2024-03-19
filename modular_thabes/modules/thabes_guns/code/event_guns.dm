/obj/item/gun/ballistic/automatic/assault/p16
	icon = 'modular_thabes/modules/thabes_guns/icons/48x32.dmi'

	mob_overlay_icon = 'modular_thabes/modules/thabes_guns/icons/inhands/onmob_guns.dmi'

	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
	righthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'

/obj/item/gun/ballistic/automatic/assault/p16/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.18 SECONDS)

/obj/item/gun/ballistic/automatic/gal
	name = "CM-F4"
	desc = "The standard issue DMR of CLIP. Dates back to the Xenofauna War for long range support against xenofauna. Chambered in .308."
	icon = 'modular_thabes/modules/thabes_guns/icons/48x32.dmi'

	mob_overlay_icon = 'modular_thabes/modules/thabes_guns/icons/inhands/onmob_guns.dmi'

	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
	righthand_file  = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'

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
	righthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'

/obj/item/gun/ballistic/shotgun/bulldog/minutemen
	icon = 'modular_thabes/modules/thabes_guns/icons/48x32.dmi'

	mob_overlay_icon = 'modular_thabes/modules/thabes_guns/icons/inhands/onmob_guns.dmi'

	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
	righthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'

/obj/item/gun/ballistic/automatic/pistol/cm23
	name = "\improper CM-23"
	desc = "The 10 round service pistol of CLIP. It has become less common in service as time has passed on, but still sees action in specialized units or the frontier patrols. Chambered in 10mm."

	icon = 'modular_thabes/modules/thabes_guns/icons/guns.dmi'

	mob_overlay_icon = 'modular_thabes/modules/thabes_guns/icons/inhands/onmob_guns.dmi'

	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
	righthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'

	icon_state = "cm23"
	item_state = "clip_generic"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/cm23
	can_suppress = FALSE
	fire_sound = 'modular_thabes/modules/thabes_guns/sound/cm23.ogg'
	rack_sound = 'sound/weapons/gun/pistol/candor_cocked.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'
	manufacturer = MANUFACTURER_HUNTERSPRIDE
	load_sound = 'sound/weapons/gun/pistol/candor_reload.ogg'
	load_empty_sound = 'sound/weapons/gun/pistol/candor_reload.ogg'
	eject_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'
	recoil_unwielded = 3

/obj/item/ammo_box/magazine/cm23
	name = "CM-23 pistol magazine (10mm)"
	desc = "An 10-round magazine magazine designed for the CM-70 pistol. These rounds do moderate damage, but struggle against armor."
	icon_state = "cm23_mag-1"
	base_icon_state = "cm23_mag"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 10

	icon = 'modular_thabes/modules/thabes_guns/icons/ammo.dmi'

/obj/item/ammo_box/magazine/cm23/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[!!ammo_count()]"

/obj/item/gun/ballistic/automatic/pistol/cm70
	name = "CM-70 machine pistol"
	desc = "A burst-fire machine pistol. Chambered in 9mm."
	icon_state = "cm70"
	item_state = "clip_generic"
	mag_type = /obj/item/ammo_box/magazine/m9mm_cm70
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 1.2
	actions_types = list(/datum/action/item_action/toggle_firemode)

	fire_sound = 'modular_thabes/modules/thabes_guns/sound/cm70.ogg'
	icon = 'modular_thabes/modules/thabes_guns/icons/guns.dmi'

	mob_overlay_icon = 'modular_thabes/modules/thabes_guns/icons/inhands/onmob_guns.dmi'

	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
	righthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'

	spread = 8
	spread_unwielded = 20

/obj/item/ammo_box/magazine/m9mm_cm70
	name = "CM-70 machine pistol magazine (9mm)"
	desc = "A 18-round magazine designed for the CM-70 machine pistol. These rounds do okay damage, but struggle against armor."
	icon_state = "cm70_mag_18"
	base_icon_state = "cm70_mag"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 18

	icon = 'modular_thabes/modules/thabes_guns/icons/ammo.dmi'

/obj/item/ammo_box/magazine/m9mm_cm70/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]_[ammo_count() == 1 ? 1 : round(ammo_count(),3)]"

/obj/item/gun/ballistic/automatic/hmg/cm40
	name = "\improper CM-40"
	desc = "CLIP's standard issue LMG, for heavy duty cover fire. Its weight, bulk, and robust fire rate make it difficult to handle without using the bipod in a prone position or against appropriate cover such as a table. Chambered in 7.62x40mm CLIP."

	icon = 'modular_thabes/modules/thabes_guns/icons/48x32.dmi'

	mob_overlay_icon = 'modular_thabes/modules/thabes_guns/icons/inhands/onmob_guns.dmi'

	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
	righthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'
	icon_state = "cm40"
	item_state = "cm40"

	fire_delay = 0

	fire_sound = 'modular_thabes/modules/thabes_guns/sound/cm40.ogg'
	rack_sound = 'modular_thabes/modules/thabes_guns/sound/cm40_cocked.ogg'

	rack_sound_vary = FALSE

	load_sound_vary = FALSE
	eject_sound_vary = FALSE

	load_sound = 'modular_thabes/modules/thabes_guns/sound/cm40_reload.ogg'
	load_empty_sound = 'modular_thabes/modules/thabes_guns/sound/cm40_reload.ogg'
	eject_sound = 'modular_thabes/modules/thabes_guns/sound/cm40_unload.ogg'
	eject_empty_sound = 'modular_thabes/modules/thabes_guns/sound/cm40_unload.ogg'


	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	manufacturer = MANUFACTURER_MINUTEMAN
	mag_type = /obj/item/ammo_box/magazine/cm40_762_40_box

	spread = 10
	spread_unwielded = 35

	recoil = 2 //identical to other LMGS
	recoil_unwielded = 7 //same as skm

	wield_slowdown = 1 //not as severe as other lmgs, but worse than the normal skm
	wield_delay = 0.9 SECONDS //faster than normal lmgs, slower than stock skm

	has_bipod = TRUE

	deploy_recoil_bonus = -2
	deploy_spread_bonus = -6

/obj/item/gun/ballistic/automatic/hmg/cm40/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.1 SECONDS)
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/ammo_box/magazine/cm40_762_40_box
	name = "CM-40 box magazine (7.62x40mm CLIP)"
	desc = "An 80 round box magazine for CM-40 light machine gun. These rounds do good damage with good armor penetration."
	base_icon_state = "cm40_mag"
	icon_state = "cm40_mag-1"
	ammo_type = /obj/item/ammo_casing/a762_40
	max_ammo = 80
	w_class = WEIGHT_CLASS_NORMAL

	icon = 'modular_thabes/modules/thabes_guns/icons/ammo.dmi'

/obj/item/ammo_box/magazine/cm40_762_40_box/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[!!ammo_count()]"

//FFV

/obj/item/gun/ballistic/automatic/pistol/conflagration
	name = "\improper HP Conflagration"
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
	manufacturer = MANUFACTURER_HUNTERSPRIDE
	load_sound = 'sound/weapons/gun/general/magazine_insert_full.ogg'
	load_empty_sound = 'sound/weapons/gun/general/magazine_insert_full.ogg'
	eject_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'
	spread = 6
	spread_unwielded = 14

	icon = 'modular_thabes/modules/thabes_guns/icons/guns.dmi'

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

	icon = 'modular_thabes/modules/thabes_guns/icons/ammo.dmi'

/obj/item/gun/ballistic/automatic/pistol/mauler
	name = "Mauler machine pistol"
	desc = "A full auto machine pistol. It has insane stopping power, although it is mostly useless with outside of CQC and anything with armor. Chambered in 9mm."
	icon_state = "mauler"
	item_state = "hp_generic"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/m9mm_mauler
	can_suppress = FALSE
	fire_delay = 0

	spread = 20
	spread_unwielded = 35
	recoil = 1
	recoil_unwielded = 4

	icon = 'modular_thabes/modules/thabes_guns/icons/48x32.dmi'
//	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
//	righthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'
	rack_sound = 'sound/weapons/gun/pistol/candor_cocked.ogg'

	load_sound = 'sound/weapons/gun/pistol/candor_reload.ogg'
	load_empty_sound = 'sound/weapons/gun/pistol/candor_reload.ogg'
	eject_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/pistol/candor_unload.ogg'

/obj/item/gun/ballistic/automatic/pistol/mauler/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.06 SECONDS)

/obj/item/gun/ballistic/automatic/pistol/mauler/factory
	desc = "A full auto machine pistol. It has insane stopping power, although it is mostly useless with outside of CQC and anything with armor. This example has been kept in especially good shape, and may as well be fresh out of the workshop. Chambered in 9mm."
	item_state = "hp_generic_fresh"

/obj/item/gun/ballistic/automatic/pistol/mauler/factory/update_overlays()
	. = ..()
	. += "[initial(icon_state)]_factory"

/obj/item/ammo_box/magazine/m9mm_mauler
	name = "mauler machine pistol magazine (9mm)"
	desc = "A long, 12-round magazine designed for the Mauler 'Stop' pistol. These rounds do okay damage, but struggle against armor."
	icon_state = "mauler_mag-1"
	base_icon_state = "mauler_mag"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 12

	icon = 'modular_thabes/modules/thabes_guns/icons/ammo.dmi'
/obj/item/ammo_box/magazine/m9mm_mauler/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[!!ammo_count()]"

/obj/item/gun/ballistic/automatic/smg/mini_uzi
	name = "\improper Spitter"
	desc = "A Old Frontiersmen machine pistol. While never officialy released, it's widely copied in the frontier as it is quite a good weapon despite the origin. While closely accociated with crime, the gun is used by pretty much anyone. Chambered in 9mm."
	icon_state = "spitter"
	item_state = "spitter"
	mag_type = /obj/item/ammo_box/magazine/uzim9mm
	bolt_type = BOLT_TYPE_STANDARD
	weapon_weight = WEAPON_LIGHT
	mag_display = TRUE
	manufacturer = MANUFACTURER_IMPORT

//	fire_sound = 'sound/weapons/gun/smg/uzi.ogg'
//	rack_sound = 'sound/weapons/gun/smg/uzi_cocked.ogg'

//	load_sound = 'sound/weapons/gun/smg/uzi_reload.ogg'
//	load_empty_sound = 'sound/weapons/gun/smg/uzi_reload.ogg'
//	eject_sound = 'sound/weapons/gun/smg/uzi_unload.ogg'
//	eject_empty_sound = 'sound/weapons/gun/smg/uzi_unload.ogg'

	spread = 15
	spread_unwielded = 35
	dual_wield_spread = 35
	wield_slowdown = 0.25
	wield_delay = 0.2 SECONDS


	icon = 'modular_thabes/modules/thabes_guns/icons/guns.dmi'

	mob_overlay_icon = 'modular_thabes/modules/thabes_guns/icons/inhands/onmob_guns.dmi'

	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
	righthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'

	fire_sound = 'modular_thabes/modules/thabes_guns/sound/spitter.ogg'
	rack_sound = 'modular_thabes/modules/thabes_guns/sound/spitter_cocked.ogg'
	rack_sound_vary = FALSE

	load_sound_vary = FALSE
	eject_sound_vary = FALSE
	load_sound = 'modular_thabes/modules/thabes_guns/sound/spitter_reload.ogg'
	load_empty_sound = 'modular_thabes/modules/thabes_guns/sound/spitter_reload.ogg'
	eject_sound = 'modular_thabes/modules/thabes_guns/sound/spitter_unload.ogg'
	eject_empty_sound = 'modular_thabes/modules/thabes_guns/sound/spitter_unload.ogg'


/obj/item/gun/ballistic/automatic/smg/mini_uzi/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.1 SECONDS)
/obj/item/ammo_box/magazine/uzim9mm
	name = "spitter pistol magazine (9mm)"
	desc = "A thin, 30-round magazine for the spitter machine pistol. These rounds do okay damage, but struggle against armor."
	icon_state = "spitter_mag-1"
	base_icon_state = "spitter_mag"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 30

	icon = 'modular_thabes/modules/thabes_guns/icons/ammo.dmi'

/obj/item/ammo_box/magazine/uzim9mm/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[!!ammo_count()]"


/obj/item/gun/ballistic/automatic/smg/pounder
	name = "Pounder"
	desc = "A strange frontiersmen weapon. With a high ammo count and a low caliber, this gun makes up for its lack of power with it's extremely high rate of fire, hence the name. Chambered in .22 LR."
	icon = 'modular_thabes/modules/thabes_guns/icons/48x32.dmi'

	mob_overlay_icon = 'modular_thabes/modules/thabes_guns/icons/inhands/onmob_guns.dmi'

	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
	righthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'
	icon_state = "pounder"
	item_state = "pounder"
	mag_type = /obj/item/ammo_box/magazine/c22lr_pounder_pan
	can_suppress = FALSE
	burst_size = 1
	actions_types = list()
	fire_delay = 0
	spread = 40
	spread_unwielded = 80

	fire_sound = 'modular_thabes/modules/thabes_guns/sound/pounder.ogg'
	rack_sound = 'modular_thabes/modules/thabes_guns/sound/pounder_cocked.ogg'
	rack_sound_vary = FALSE

	load_sound_vary = FALSE
	eject_sound_vary = FALSE
	load_sound = 'modular_thabes/modules/thabes_guns/sound/pounder_reload.ogg'
	load_empty_sound = 'modular_thabes/modules/thabes_guns/sound/pounder_reload.ogg'
	eject_sound = 'modular_thabes/modules/thabes_guns/sound/pounder_unload.ogg'
	eject_empty_sound = 'modular_thabes/modules/thabes_guns/sound/pounder_unload.ogg'

	manufacturer = MANUFACTURER_IMPORT
	wield_slowdown = 0.5

/obj/item/gun/ballistic/automatic/smg/pounder/Initialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.05 SECONDS)

/obj/item/ammo_box/magazine/c22lr_pounder_pan
	name = "pan magazine (.22 LR)"
	desc = "A 50-round pan magazine for the Pounder machine gun. It's rather tiny, all things considered; it looks like it wouldn't pierce a single piece of armor."
	icon_state = "firestorm_mag"
	base_icon_state = "firestorm_mag"
	ammo_type = /obj/item/ammo_casing/c22lr
	caliber = "22lr"
	max_ammo = 50
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ammo_box/magazine/c22lr_pounder_pan/update_icon_state()
	. = ..()
	icon_state = "firestorm_pan"

/obj/item/gun/ballistic/automatic/hmg/shredder
	name = "\improper Shredder"
	desc = "A strange Frontiersman heavy machine gun, it's a standard heavy machine gun but with the tripod removed, a handle placed at the front to be hipfired, and also rechambered for shotgun shells. Chambered in 12g."
	icon = 'modular_thabes/modules/thabes_guns/icons/48x32.dmi'

	mob_overlay_icon = 'modular_thabes/modules/thabes_guns/icons/inhands/onmob_guns.dmi'

	lefthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/lefthand_guns.dmi'
	righthand_file = 'modular_thabes/modules/thabes_guns/icons/inhands/righthand_guns.dmi'
	icon_state = "shredder"
	item_state = "shredder"
	mag_type = /obj/item/ammo_box/magazine/m12_shredder
	can_suppress = FALSE
	spread = 15
	recoil = 2
	recoil_unwielded = 7

	bolt_type = BOLT_TYPE_STANDARD
	mag_display = TRUE
	mag_display_ammo = TRUE
	tac_reloads = FALSE
	fire_sound = 'modular_thabes/modules/thabes_guns/sound/shredder.ogg'
	rack_sound = 'modular_thabes/modules/thabes_guns/sound/shredder_cocked_alt.ogg'

	load_sound_vary = FALSE
	eject_sound_vary = FALSE
	load_sound = 'modular_thabes/modules/thabes_guns/sound/shredder_reload.ogg'
	load_empty_sound = 'modular_thabes/modules/thabes_guns/sound/shredder_reload.ogg'
	eject_sound = 'modular_thabes/modules/thabes_guns/sound/shredder_unload.ogg'
	eject_empty_sound = 'modular_thabes/modules/thabes_guns/sound/shredder_unload.ogg'

	manufacturer = MANUFACTURER_IMPORT

/obj/item/gun/ballistic/automatic/hmg/shredder/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.16 SECONDS)

/obj/item/ammo_box/magazine/m12_shredder
	name = "box magazine (12g)"
	desc = "A 40-round box magazine for the Shredder heavy machine gun."
	icon_state = "shredder_mag-1"
	base_icon_state = "shredder_mag"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = "12ga"
	max_ammo = 40
	w_class = WEIGHT_CLASS_NORMAL

	icon = 'modular_thabes/modules/thabes_guns/icons/ammo.dmi'

/obj/item/ammo_box/magazine/m12_shredder/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[!!ammo_count()]"

/obj/item/ammo_box/magazine/m12_shredder/slug
	name = "box magazine (12g slug)"
	desc = "A 40-round box magazine for the Shredder heavy machine gun."
	icon_state = "shredder_mag_slug-1"
	base_icon_state = "shredder_mag_slug"
	ammo_type = /obj/item/ammo_casing/shotgun
	caliber = "12ga"
	max_ammo = 40
	w_class = WEIGHT_CLASS_NORMAL
