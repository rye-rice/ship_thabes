GLOBAL_LIST_EMPTY(cargo_landing_zones)

/datum/cargo_market
	var/name = "huh?"

	var/limited_stock = FALSE
	var/stock_refresh = FALSE

	var/cost_varies = FALSE

	var/supply_blocked = FALSE
	/// Order number given to next cargo order
	var/ordernum = 1

	var/supply_pack_types = /datum/supply_pack

	/// List of singleton supply pack instances
	var/list/datum/supply_pack/supply_packs = list()

/datum/cargo_market/New()
	SScargo.markets += src

	ordernum = rand(1, 9000)
	generate_supply_packs()

// Hopefully this can be used for custom markets for events and stuff.
/datum/cargo_market/proc/generate_supply_packs()
	for(var/datum/supply_pack/current_pack as anything in subtypesof(supply_pack_types))
		current_pack = new current_pack()

		var/match_found = FALSE
		for(var/market_type in current_pack.markets)
			if(istype(src, market_type))
				match_found = TRUE
		if(!match_found)
			continue

		if(current_pack.faction)
			current_pack.faction = SSfactions.factions[current_pack.faction]
		if(!current_pack.contains)
			continue
		supply_packs += current_pack
	supply_packs = sortNames(supply_packs)

/datum/cargo_market/proc/cycle_stock()
	return

/datum/cargo_market/proc/make_order(mob/user, list/unprocessed_packs, atom/landing_zone)
	while(unprocessed_packs.len > 0)
		var/datum/supply_pack/initial_pack = unprocessed_packs[1]
		if(initial_pack.no_bundle)
			send_order(user, list(initial_pack), landing_zone)
			unprocessed_packs -= initial_pack
			continue

		var/list/combo_packs = list()
		var/combo_category = initial_pack.category
		for(var/datum/supply_pack/current_pack in unprocessed_packs)
			if(current_pack.category != combo_category || current_pack.no_bundle)
				continue
			combo_packs += current_pack
			unprocessed_packs -= current_pack

		if(combo_packs.len == 1) // No items could be bundled with the initial pack, make a single order
			send_order(user, list(initial_pack), landing_zone)
			unprocessed_packs -= initial_pack
			continue

		send_order(user, combo_packs, landing_zone)
		unprocessed_packs -= combo_packs

/datum/cargo_market/proc/send_order(mob/user, list/packs, atom/landing_zone)
	var/name = "*None Provided*"
	var/rank = "*None Provided*"
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		name = H.get_authentification_name()
		rank = H.get_assignment(hand_first = TRUE)
	else if(issilicon(user))
		name = user.real_name
		rank = "Silicon"
	//Including the ship bank account means you cant open the crate lol
	//var/datum/supply_order/SO = new(packs, name, rank, user.ckey, charge_account, market = current_market)
	var/datum/supply_order/order = new(packs, name, rank, user.ckey, market = src, landing_zone = landing_zone)
	SScargo.queue_item(order)
	return TRUE

/datum/cargo_market/proc/deliver_purchase(datum/supply_order/purchase)
	switch(purchase.method)
		if(SHIPPING_METHOD_HANGER)
			if(istype(purchase.landing_zone, /obj/hangar_crate_spawner))
				var/obj/hangar_crate_spawner/crate_spawner = purchase.landing_zone
				crate_spawner.handle_order(purchase)
			else
				purchase.generate(get_turf(purchase.landing_zone))
			SScargo.queued_purchases -= purchase
			qdel(purchase)

/datum/cargo_market/outpost
	name = "outpost market"

/datum/supply_pack/gun/e11
	name = "E-11 Energy Gun"
	desc = "Look. I'll be straight with you. These guns are awful. But, they are cheap if you're that desperate."
	contains = list(/obj/item/gun/energy/e_gun/e11)

	cost = 200
	markets = list(/datum/cargo_market/general_store)

/datum/supply_pack/gun/e10
	name = "E-10 Laser Pistol"
	desc = "Sharplite letting you down? Try these classic Eoehoma Firearms E-10 Laser Pistols."
	contains = list(/obj/item/gun/energy/laser/e10)
	cost = 1250

	markets = list(/datum/cargo_market/tadpole_city)

/datum/supply_pack/gun/e50
	name = "E-50 Energy Emitter"
	desc = "An Eoehoma Firearms E-50 Emitter cannon. For when you want a send a message. A really big message."
	contains = list(/obj/item/gun/energy/laser/e50)
	faction = /datum/faction/frontiersmen
	faction_discount = 0

	cost = 5000

	markets = list(/datum/cargo_market/tadpole_city)

/datum/supply_pack/gun/syndi_derringer
	name = ".357 Derringer"
	desc = "A concealable hangun with a tasteful red and black paintjob, which makes it slightly more noticable. Chambered in .357, so you actually have a chance at killing something."
	contains = list(/obj/item/gun/ballistic/derringer/traitor)

	cost = 800
	markets = list(/datum/cargo_market/tadpole_city)

/datum/supply_pack/gun/e60
	name = "E-60 Disabler"
	desc = "Looking for a live capture? This Eoehoma Firearms E-60 disabler will get your man."
	contains = list(/obj/item/gun/energy/disabler/e60)
	faction = /datum/faction/frontiersmen
	faction_discount = 0
	cost = 750

/datum/supply_pack/gun/larker
	name = "Model 13 \"Larker\""
	desc = "Not offically approved or sold by Serene Sporting."
	contains = list(/obj/item/storage/guncase/m13)
	faction = /datum/faction/frontiersmen
	faction_discount = 0

	cost = 1000

	markets = list(/datum/cargo_market/tadpole_city)

/datum/supply_pack/gun/mauler
	name = "Mauler Machine Pistol"
	desc = "This gun's got teeth! Twelve 9mm teeth to be exact. Hardly a full smile, and you'll be losing the rest pretty quick with this thing's rate of fire."
	contains = list(/obj/item/gun/ballistic/automatic/pistol/mauler, /obj/item/ammo_box/magazine/m9mm_mauler/empty, /obj/item/ammo_box/magazine/m9mm_mauler/empty)
	faction = /datum/faction/frontiersmen

	markets = list(/datum/cargo_market/tadpole_city)

	cost = 2000
	faction_discount = 0

/datum/supply_pack/gun/spitter
	name = "Spitter Submachine Gun"
	desc = "The aptly named Spitter won't be hitting anything outside of spitting distance. Anything in that range on the otherhand? Let's just say the bereaved will be wanting a closed casket funeral. Chambered in 9mm."
	contains = list(/obj/item/gun/ballistic/automatic/pistol/spitter, /obj/item/ammo_box/magazine/spitter_9mm/empty, /obj/item/ammo_box/magazine/spitter_9mm/empty)
	faction = /datum/faction/frontiersmen

	cost = 2500
	faction_discount = 0


	markets = list(/datum/cargo_market/tadpole_city)

/datum/supply_pack/gun/pounder
	name = "Pounder Submachine Gun"
	desc = "There's a certain quality to quantity. With a massive 50 round capacity, this .22lr submachine is capable of laying down an jawdropping amount of fire."
	contains = list(/obj/item/gun/ballistic/automatic/smg/pounder, /obj/item/ammo_box/magazine/c22lr_pounder_pan/empty, /obj/item/ammo_box/magazine/c22lr_pounder_pan/empty)
	faction = /datum/faction/frontiersmen
	cost = 2000
	faction_discount = 0

	markets = list(/datum/cargo_market/tadpole_city)

/datum/supply_pack/gun/polymer
	name = "Polymer Survivor Rifle"
	desc = "A slapdash rifle held together by spite, dreams and a good helping of duct tape. Chambered in 7.62x40mm CLIP."
	contains = list(/obj/item/gun/ballistic/rifle/polymer)

	cost = 800

	markets = list(/datum/cargo_market/tadpole_city)

/datum/supply_pack/gun/skm_carbine
	name = "SKM-24v Carbine"
	desc = "Technically this is just a sawn down SKM-24 assault rifle, but what's CLIP going to do? Sue us? Chambered in 4.6x30mm."
	contains = list(/obj/item/gun/ballistic/automatic/smg/skm_carbine)

	cost = 3000

	markets = list(/datum/cargo_market/tadpole_city)


/datum/supply_pack/magazine/mauler_mag
	name = "Mauler Magazine"
	desc = "A 12 round 9mm magazine for the Mauler Machine Pistol."
	contains = list(/obj/item/ammo_box/magazine/m9mm_mauler)
	faction = /datum/faction/frontiersmen
	cost = 400

	markets = list(/datum/cargo_market/tadpole_city)


/datum/supply_pack/magazine/spitter_mag
	name = "Spitter Magazine"
	desc = "A 30 round 9mm magazine for the Spitter submachine gun."
	contains = list(/obj/item/ammo_box/magazine/spitter_9mm)
	faction = /datum/faction/frontiersmen

	cost = 650

	markets = list(/datum/cargo_market/tadpole_city)

/datum/supply_pack/magazine/pounder_mag
	name = "Pounder Pan Magazine"
	desc = "A 50 round pan magazine for the Pounder submachine gun. Heavy enough to double as an emergency melee weapon to beat off your enemies in a pinch."
	contains = list(/obj/item/ammo_box/magazine/c22lr_pounder_pan)
	faction = /datum/faction/frontiersmen

	cost = 700

	markets = list(/datum/cargo_market/tadpole_city)

/datum/supply_pack/magazine/carbine_mag
	name = "SKM-24v Magazine"
	desc = "A 30 round magazine of 4.6x30mm for the SKM-24v. A hermit classic."
	contains = list(/obj/item/ammo_box/magazine/skm_46_30)

	cost = 500

	markets = list(/datum/cargo_market/tadpole_city)

/datum/supply_pack/general_store_smoothie
	category = "!Outpost Exclusive"
	name = "Smoothie"
	desc = "Placeholder"
	cost = 20
	contains = list(/obj/item/storage/box/donkpockets/donkpocketspicy,
					)
	crate_name = "smoothie crate"
	crate_type = /obj/structure/closet/crate/freezer
	markets = list(/datum/cargo_market/general_store)


/datum/cargo_market/general_store
	name = "general store"
	var/list/packs_to_add_indvidually
	var/list/packs_to_enable

/datum/cargo_market/tadpole_city
	name = "tadpole city"

/datum/cargo_market/tadpole_city/generate_supply_packs()
	. = ..()
	for(var/datum/supply_pack/current_pack as anything in supply_packs)
		if(istype(current_pack, /datum/supply_pack/medical))
			current_pack.cost *= 1.2
		if(istype(current_pack, /datum/supply_pack/food))
			current_pack.cost *= 1.7
		if(istype(current_pack, /datum/supply_pack/ammo))
			current_pack.cost *= 1.3

