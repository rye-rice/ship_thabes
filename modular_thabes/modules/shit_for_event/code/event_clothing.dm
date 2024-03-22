

/obj/item/clothing/head/beret/sec/frontier
	icon = 'modular_thabes/modules/shit_for_event/icons/clothing/obj/head.dmi'
	mob_overlay_icon = 'modular_thabes/modules/shit_for_event/icons/clothing/mob/head.dmi'

/obj/item/clothing/suit/armor/vest/bulletproof/frontier
	icon = 'modular_thabes/modules/shit_for_event/icons/clothing/obj/suits.dmi'
	mob_overlay_icon = 'modular_thabes/modules/shit_for_event/icons/clothing/mob/suits.dmi'

/obj/item/clothing/under/rank/security/officer/frontier
	icon = 'modular_thabes/modules/shit_for_event/icons/clothing/obj/uniforms.dmi'
	mob_overlay_icon = 'modular_thabes/modules/shit_for_event/icons/clothing/mob/uniforms.dmi'


/obj/item/clothing/under/rank/security/officer/frontier/officer
	name = "\improper Frontiersmen uniform"
	desc = "Worn by members of the Frontiersmen pirate fleet. It's very uncomfortable to move around in."
	icon_state = "frontier"

/obj/item/clothing/under/rank/security/officer/frontier/fireproof
	name = "\improper fireproof Frontiersmen uniform"
	desc = "Worn by members of the Frontiersmen pirate fleet. It's fireproof unlike the other uniforms of the Frontiersmen."
	icon_state = "frontier_fireproof"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/under/rank/security/officer/frontier/deck
	name = "\improper Frontiersmen deckhand's uniform"
	desc = "A cheaply made jumpsuit for use by low ranking Frontiersmen. It's obviously a olive dyed jumpsuit."
	icon_state = "frontier"

/obj/item/clothing/head/helmet/bulletproof/x11/frontier
	icon = 'modular_thabes/modules/shit_for_event/icons/clothing/obj/head.dmi'
	mob_overlay_icon = 'modular_thabes/modules/shit_for_event/icons/clothing/mob/head.dmi'


/obj/item/clothing/head/helmet/bulletproof/x11/frontier/fireproof
	name = "\improper Fireproof Frontiersmen X11 Helmet"
	desc = "A subtly but helpful modifcation of the Frontiersmen X11 to make it fireproof."
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELM_MAX_TEMP_PROTECT
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
	resistance_flags = FIRE_PROOF
	armor = list("melee" = 15, "bullet" = 60, "laser" = 10, "energy" = 10, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)

/obj/item/clothing/head/caphat/frontier
	icon = 'modular_thabes/modules/shit_for_event/icons/clothing/obj/head.dmi'
	mob_overlay_icon = 'modular_thabes/modules/shit_for_event/icons/clothing/mob/head.dmi'

/obj/item/clothing/suit/armor/frontier
	icon = 'modular_thabes/modules/shit_for_event/icons/clothing/obj/suits.dmi'
	mob_overlay_icon = 'modular_thabes/modules/shit_for_event/icons/clothing/mob/suits.dmi'

/obj/item/clothing/suit/armor/vest/marine/frontier
	name = "Frontiersmen heavy armor"
	desc = "Extremely heavy Frontiersman armor made for sentries or units that don't require mobility."
	icon_state = "marine_frontier"
	icon = 'modular_thabes/modules/shit_for_event/icons/clothing/obj/suits.dmi'
	mob_overlay_icon = 'modular_thabes/modules/shit_for_event/icons/clothing/mob/suits.dmi'


/obj/item/clothing/head/helmet/marine/frontier
	name = "Frontiersmen reinforced helmet"
	desc = "A reinforced Frontiersmen X11. The front plate has a small window to let the user see."
	icon_state = "marine_frontier"
	icon = 'modular_thabes/modules/shit_for_event/icons/clothing/obj/head.dmi'
	mob_overlay_icon = 'modular_thabes/modules/shit_for_event/icons/clothing/mob/head.dmi'

/obj/item/clothing/suit/fire/frontier
	name = "Frontiersmen fire-resistant trenchcoat"
	desc = "A trenchcoat that is very fire resistant and comes with some bullet protection."
	icon_state = "frontier_fireproof_suit"
	slowdown = 0.5
	armor = list("melee" = 25, "bullet" = 25, "laser" = 30, "energy" = 30, "bomb" = 30, "bio" = 10, "rad" = 20, "fire" = 100, "acid" = 50)
	flags_inv = null

	icon = 'modular_thabes/modules/shit_for_event/icons/clothing/obj/suits.dmi'
	mob_overlay_icon = 'modular_thabes/modules/shit_for_event/icons/clothing/mob/suits.dmi'
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/mask/gas/frontier
	name = "sack gas mask"
	desc = "A gas mask that can be connected to an air supply. It's made out of cheap sack, but still works just as good for protecting you."
	icon_state = "gasmask_frontier"
	icon = 'modular_thabes/modules/shit_for_event/icons/clothing/obj/mask.dmi'
	mob_overlay_icon = 'modular_thabes/modules/shit_for_event/icons/clothing/mob/mask.dmi'

/obj/item/storage/belt/military/frontier
	name = "frontiersman tacitcal bandolier"
	desc = "A bandolier modified by the Frontiersmen to hold magazines."
	icon_state = "frontierwebbing"

	unique_reskin = null

	icon = 'modular_thabes/modules/shit_for_event/icons/clothing/obj/belt.dmi'
	mob_overlay_icon = 'modular_thabes/modules/shit_for_event/icons/clothing/mob/belt.dmi'

/obj/item/reagent_containers/glass/beaker/large/napalm
	name = "large beaker"
	desc = "A large beaker. Can hold up to 100 units."
	list_reagents = list(/datum/reagent/napalm = 100)
	cap_on = FALSE

/obj/item/storage/belt/military/frontier/flamer/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/glass/beaker/large/napalm(src)
	new /obj/item/grenade/frag(src)

/obj/item/storage/belt/military/frontier/skm/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/ammo_box/magazine/skm_762_40(src)

/obj/item/storage/belt/military/frontier/sniper/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/ammo_box/magazine/illestren_a850r(src)


/obj/item/storage/box/survival/clip/balaclava/frontier
	internal_type = /obj/item/tank/internals/emergency_oxygen //frontiersmen dont

/datum/outfit/job/frontiersmen/ert/custom
	name = "!EVENT - Frontiersman No weapon Armored"

	head = /obj/item/clothing/head/helmet/bulletproof/x11/frontier
	mask = null
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/frontier
	suit_store = null
	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = null
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	id = null // lol

	box = /obj/item/storage/box/survival/clip/balaclava/frontier

	backpack_contents = list(/obj/item/radio=1)

/datum/outfit/job/frontiersmen/ert/custom/noarmor
	name = "!EVENT - Frontiersman No weapon Unarmored"

	head = null
	mask = null
	suit = null
	suit_store = null
	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = null
	ears = null
	back = /obj/item/storage/backpack
	l_pocket = null
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	id = null // lol

	backpack_contents = list(/obj/item/radio=1)

/datum/outfit/job/frontiersmen/ert/custom/noarmor/conscript
	name = "!EVENT - Frontiersman Conscript"

	head = null
	mask = null
	suit = null
	suit_store = null
	belt = /obj/item/gun/ballistic/revolver/shadow
	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = null
	ears = null
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/ammo_box/c45
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	id = null // lol

	backpack_contents = list(/obj/item/radio=1)

/datum/outfit/job/frontiersmen/ert/custom/flamer
	name = "!EVENT - Frontiersman Special - Flame Trooper"

	head = /obj/item/clothing/head/helmet/bulletproof/x11/frontier/fireproof
	mask = /obj/item/clothing/mask/gas/frontier
	suit = /obj/item/clothing/suit/fire/frontier
	suit_store = /obj/item/tank/internals/oxygen/red
	uniform = /obj/item/clothing/under/rank/security/officer/frontier/fireproof
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = null
	back = /obj/item/storage/backpack
	belt = /obj/item/storage/belt/military/frontier/flamer
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	l_hand = /obj/item/flamethrower/full/tank

	id = null // lol

	backpack_contents = list(/obj/item/gun/ballistic/shotgun/doublebarrel/sawn=1,/obj/item/ammo_box/a12g=1,/obj/item/extinguisher=2,/obj/item/radio=1)

/datum/outfit/job/frontiersmen/ert/custom/sentry_lmg
	name = "!EVENT - Frontiersman Special - Sentry SKM-24v"

	head = /obj/item/clothing/head/helmet/marine/frontier
	mask = /obj/item/clothing/mask/gas/sechailer/balaclava
	suit = /obj/item/clothing/suit/armor/vest/marine/frontier
	suit_store = /obj/item/gun/ballistic/automatic/hmg/skm_lmg/drum_mag
	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = null
	back = /obj/item/storage/backpack
	belt = /obj/item/gun/ballistic/revolver/mateba
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	id = null // lol

	backpack_contents = list(/obj/item/ammo_box/magazine/skm_762_40/drum=2,/obj/item/ammo_box/a357=2,/obj/item/grenade/frag=1,/obj/item/radio=1)

/datum/outfit/job/frontiersmen/ert/custom/sentry_shredder
	name = "!EVENT - Frontiersman Special - Sentry Shredder 12g"

	head = /obj/item/clothing/head/helmet/marine/frontier
	mask = /obj/item/clothing/mask/gas/sechailer/balaclava
	suit = /obj/item/clothing/suit/armor/vest/marine/frontier
	suit_store = null
	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = null
	back = /obj/item/storage/backpack
	belt = /obj/item/gun/ballistic/revolver/mateba
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	l_hand = /obj/item/gun/ballistic/automatic/hmg/shredder

	id = null // lol

	backpack_contents = list(/obj/item/ammo_box/magazine/m12_shredder=2,/obj/item/ammo_box/a357=2,/obj/item/grenade/frag=1,/obj/item/radio=1)

/datum/outfit/job/frontiersmen/ert/custom/sniper
	name = "!EVENT - Frontiersman Special - Sniper Bolt Rifle"

	head = /obj/item/clothing/head/beret/sec/frontier/officer
	mask = null
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/frontier
	belt = /obj/item/storage/belt/military/frontier/sniper
	suit_store = /obj/item/gun/ballistic/rifle/illestren/scoped
	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = null
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	id = null // lol

	backpack_contents = list(/obj/item/binoculars=1,/obj/item/grenade/smokebomb=2,/obj/item/gun/ballistic/automatic/pistol/candor=1,/obj/item/ammo_box/magazine/m45=2,/obj/item/radio=1)

/datum/outfit/job/frontiersmen/ert/custom/assault_mp
	name = "!EVENT - Frontiersman - Assault MP"

	head = /obj/item/clothing/head/beret/sec/frontier
	mask = null
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/frontier
	suit_store = /obj/item/gun/ballistic/automatic/smg/mini_uzi
	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = null
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	id = null // lol

	backpack_contents = list(/obj/item/ammo_box/magazine/uzim9mm=3,/obj/item/radio=1)

/datum/outfit/job/frontiersmen/ert/custom/assault_rifle
	name = "!EVENT - Frontiersman - Assault Bolt Rifle"

	head = /obj/item/clothing/head/beret/sec/frontier
	mask = null
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/frontier
	suit_store = /obj/item/gun/ballistic/rifle/illestren
	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = null
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	id = null // lol

	backpack_contents = list(/obj/item/ammo_box/magazine/illestren_a850r=5,/obj/item/radio=1)

/datum/outfit/job/frontiersmen/ert/custom/skimrish_smg
	name = "!EVENT - Frontiersman - CQC Skimrisher SMG"

	head = /obj/item/clothing/head/helmet/bulletproof/x11/frontier
	mask = null
	glasses = /obj/item/clothing/glasses/meson
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/frontier
	suit_store = /obj/item/gun/ballistic/automatic/smg/pounder
	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = null
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	id = null // lol

	backpack_contents = list(/obj/item/ammo_box/magazine/c22lr_pounder_pan=2,/obj/item/radio=1,/obj/item/grenade/frag=1,/obj/item/clothing/mask/gas/frontier=1)

/datum/outfit/job/frontiersmen/ert/custom/skimrish_ar
	name = "!EVENT - Frontiersman - CQC Skimrisher AR"

	head = /obj/item/clothing/head/helmet/bulletproof/x11/frontier
	mask = null
	glasses = /obj/item/clothing/glasses/meson
	belt = /obj/item/storage/belt/military/frontier/skm
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/frontier
	suit_store = /obj/item/gun/ballistic/automatic/assault/skm
	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = null
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	id = null // lol

	backpack_contents = list(/obj/item/radio=1,/obj/item/grenade/frag=1,/obj/item/clothing/mask/gas/frontier=1)

/datum/outfit/job/frontiersmen/ert/custom/skimrish_shotgun
	name = "!EVENT - Frontiersman - CQC Skimrisher Shotgun"

	head = /obj/item/clothing/head/helmet/bulletproof/x11/frontier
	mask = null
	glasses = /obj/item/clothing/glasses/meson
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/frontier
	suit_store = /obj/item/gun/ballistic/shotgun/brimstone
	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = null
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	id = null // lol

	backpack_contents = list(/obj/item/ammo_box/a12g=1,/obj/item/ammo_box/a12g/slug,/obj/item/radio=1,/obj/item/grenade/frag=1,/obj/item/clothing/mask/gas/frontier=1)

/obj/item/storage/belt/medical/webbing/prefilled/PopulateContents()
	new /obj/item/reagent_containers/medigel/styptic(src)
	new /obj/item/reagent_containers/medigel/styptic(src)
	new /obj/item/reagent_containers/medigel/silver_sulf(src)
	new /obj/item/reagent_containers/medigel/silver_sulf(src)
	new /obj/item/reagent_containers/medigel/synthflesh(src)
	new /obj/item/reagent_containers/medigel/synthflesh(src)
	new /obj/item/stack/medical/splint(src)

/datum/outfit/job/frontiersmen/ert/custom/medic
	name = "!EVENT - Frontiersman - Medic"

	head = /obj/item/clothing/head/beret/sec/frontier/officer
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/frontier
	belt = /obj/item/storage/belt/medical/webbing/prefilled
	suit_store = /obj/item/gun/ballistic/automatic/pistol/mauler
	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	accessory = /obj/item/clothing/accessory/armband/medblue
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	ears = null
	back = /obj/item/storage/backpack/medic
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	id = null // lol

	backpack_contents = list(/obj/item/ammo_box/magazine/m9mm_mauler=2,/obj/item/radio=1,/obj/item/clothing/mask/gas/frontier=1,/obj/item/storage/firstaid/medical=1)

/datum/outfit/job/frontiersmen/ert/custom/officer
	name = "!EVENT - Frontiersman - Officer"

	head = /obj/item/clothing/head/caphat/frontier
	mask = null
	suit = /obj/item/clothing/suit/armor/frontier
	suit_store = /obj/item/gun/ballistic/automatic/pistol/mauler
	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = null
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	id = null // lol

	backpack_contents = list(/obj/item/ammo_box/magazine/m9mm_mauler=3,/obj/item/radio=1,/obj/item/binoculars=1)


/datum/outfit/job/frontiersmen/ert/custom/admiral
	name = "!EVENT - Frontiersman - Base Commander"

	head = /obj/item/clothing/head/caphat/frontier/admiral
	mask = null
	suit = null
	suit_store = null
	uniform = /obj/item/clothing/under/rank/security/officer/frontier/admiral
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = null
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/spacecash/bundle/c10000
	r_pocket = /obj/item/spacecash/bundle/c10000

	id = null // lol

	backpack_contents = list(/obj/item/radio=1,/obj/item/binoculars=1)

/obj/item/gun/ballistic/shotgun/doublebarrel/sawn
	name = "sawn-off double-barreled shotgun"
	desc = "A break action shotgun cut down to the size of a sidearm. While the recoil is even harsher, it offers a lot of power in a very small package. Chambered in 12g."
	sawn_off = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL

	wield_slowdown = 0.25
	wield_delay = 0.3 SECONDS //OP? maybe

	spread = 8
	spread_unwielded = 15
	recoil = 3 //or not
	recoil_unwielded = 5
	item_state = "dshotgun_sawn"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/dual/lethal

/obj/item/ammo_box/magazine/internal/shot/dual/lethal
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
