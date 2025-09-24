/*
	Map templates
*/

/datum/map_template/outpost
	// Necessary to stop planetary outposts from having space underneath all their turfs.
	// They were being "placed on top", so instead of their baseturf, there was just space underneath.
	// (Interestingly, this is much less of a problem for ruins: PlaceOnTop ignores the top closed turf in the baseturfs stack
	// of the new tile, meaning that placing plating on top of a wall doesn't result in a wall underneath the plating.)
	should_place_on_top = FALSE
	var/outpost_name

/datum/map_template/outpost/New()
	. = ..(path = "_maps/outpost/[name].dmm")

/datum/map_template/outpost/hangar
	var/dock_width
	var/dock_height

/datum/map_template/outpost/elevator_test
	name = "elevator_test"

/datum/map_template/outpost/elevator_indie
	name = "elevator_indie"

/datum/map_template/outpost/elevator_ice
	name = "elevator_ice"

/datum/map_template/outpost/elevator_rock
	name = "elevator_rock"

/datum/map_template/outpost/elevator_clip
	name = "elevator_clip"
/*
	Independent Space Outpost //creative name!
*/
/datum/map_template/outpost/indie_space
	name = "indie_space"
	outpost_name = "Installation Trifuge"

/datum/map_template/outpost/hangar/indie_space_20x20
	name = "hangar/indie_space_20x20"
	dock_width = 20
	dock_height = 20

/datum/map_template/outpost/hangar/indie_space_40x20
	name = "hangar/indie_space_40x20"
	dock_width = 40
	dock_height = 20

/datum/map_template/outpost/hangar/indie_space_40x40
	name = "hangar/indie_space_40x40"
	dock_width = 40
	dock_height = 40

/datum/map_template/outpost/hangar/indie_space_56x20
	name = "hangar/indie_space_56x20"
	dock_width = 56
	dock_height = 20

/datum/map_template/outpost/hangar/indie_space_56x40
	name = "hangar/indie_space_56x40"
	dock_width = 56
	dock_height = 40

/*
	Nanotrasen Ice Planet
*/
/datum/map_template/outpost/nanotrasen_ice
	name = "nanotrasen_ice"
	outpost_name = "Yebiri Sipili"

/datum/map_template/outpost/hangar/nt_ice_20x20
	name = "hangar/nt_ice_20x20"
	dock_width = 20
	dock_height = 20

/datum/map_template/outpost/hangar/nt_ice_40x20
	name = "hangar/nt_ice_40x20"
	dock_width = 40
	dock_height = 20

/datum/map_template/outpost/hangar/nt_ice_40x40
	name = "hangar/nt_ice_40x40"
	dock_width = 40
	dock_height = 40

/datum/map_template/outpost/hangar/nt_ice_56x20
	name = "hangar/nt_ice_56x20"
	dock_width = 56
	dock_height = 20

/datum/map_template/outpost/hangar/nt_ice_56x40
	name = "hangar/nt_ice_56x40"
	dock_width = 56
	dock_height = 40

/*
	Independent Rock Planet //ROCK AND STONE!
*/
/datum/map_template/outpost/ngr_rock
	name = "ngr_rock"
	outpost_name = "Agni Trading Post"

/datum/map_template/outpost/hangar/ngr_rock_20x20
	name = "hangar/ngr_rock_20x20"
	dock_width = 20
	dock_height = 20

/datum/map_template/outpost/hangar/ngr_rock_40x20
	name = "hangar/ngr_rock_40x20"
	dock_width = 40
	dock_height = 20

/datum/map_template/outpost/hangar/ngr_rock_40x40
	name = "hangar/ngr_rock_40x40"
	dock_width = 40
	dock_height = 40

/datum/map_template/outpost/hangar/ngr_rock_56x20
	name = "hangar/ngr_rock_56x20"
	dock_width = 56
	dock_height = 20

/datum/map_template/outpost/hangar/ngr_rock_56x40
	name = "hangar/ngr_rock_56x40"
	dock_width = 56
	dock_height = 40

/*
	CLIP Ocean outpost //I really hated ghost leviathans, man
*/
/datum/map_template/outpost/clip_ocean
	name = "clip_ocean"
	outpost_name = "Arrowsong Refueling Platform"

/datum/map_template/outpost/hangar/clip_ocean_20x20
	name = "hangar/clip_ocean_20x20"
	dock_width = 20
	dock_height = 20

/datum/map_template/outpost/hangar/clip_ocean_40x20
	name = "hangar/clip_ocean_40x20"
	dock_width = 40
	dock_height = 20

/datum/map_template/outpost/hangar/clip_ocean_40x40
	name = "hangar/clip_ocean_40x40"
	dock_width = 40
	dock_height = 40

/datum/map_template/outpost/hangar/clip_ocean_56x20
	name = "hangar/clip_ocean_56x20"
	dock_width = 56
	dock_height = 20

/datum/map_template/outpost/hangar/clip_ocean_56x40
	name = "hangar/clip_ocean_56x40"
	dock_width = 56
	dock_height = 40

/*
	/datum/overmap/outpost subtypes
*/

/datum/overmap/outpost/indie_space
	token_icon_state = "station_cylinder"
	main_template = /datum/map_template/outpost/indie_space
	elevator_template = /datum/map_template/outpost/elevator_indie
	faction = FACTION_INDEPENDENT
	// Uses "default" hangars (indie_space).

/datum/overmap/outpost/nanotrasen_ice
	token_icon_state = "station_asteroid"
	main_template = /datum/map_template/outpost/nanotrasen_ice
	elevator_template = /datum/map_template/outpost/elevator_ice
	faction = FACTION_NT
	weather_controller_type = /datum/weather_controller/chill
	hangar_templates = list(
		/datum/map_template/outpost/hangar/nt_ice_20x20,
		/datum/map_template/outpost/hangar/nt_ice_40x20,
		/datum/map_template/outpost/hangar/nt_ice_40x40,
		/datum/map_template/outpost/hangar/nt_ice_56x20,
		/datum/map_template/outpost/hangar/nt_ice_56x40
	)
	faction = /datum/faction/nt

/datum/overmap/outpost/ngr_rock
	token_icon_state = "station_asteroid"
	main_template = /datum/map_template/outpost/ngr_rock
	elevator_template = /datum/map_template/outpost/elevator_rock
	weather_controller_type = /datum/weather_controller/rockplanet_safe
	hangar_templates = list(
		/datum/map_template/outpost/hangar/ngr_rock_20x20,
		/datum/map_template/outpost/hangar/ngr_rock_40x20,
		/datum/map_template/outpost/hangar/ngr_rock_40x40,
		/datum/map_template/outpost/hangar/ngr_rock_56x20,
		/datum/map_template/outpost/hangar/ngr_rock_56x40
	)

/datum/overmap/outpost/clip_ocean
	token_icon_state = "station_planet"
	main_template = /datum/map_template/outpost/clip_ocean
	elevator_template = /datum/map_template/outpost/elevator_clip
	weather_controller_type = /datum/weather_controller/lush
	hangar_templates = list(
		/datum/map_template/outpost/hangar/clip_ocean_20x20,
		/datum/map_template/outpost/hangar/clip_ocean_40x20,
		/datum/map_template/outpost/hangar/clip_ocean_40x40,
		/datum/map_template/outpost/hangar/clip_ocean_56x20,
		/datum/map_template/outpost/hangar/clip_ocean_56x40
	)

/datum/overmap/outpost/tadpole_city
	name = "Tadpole City"
	token_icon_state = "station_planet"
	main_template = /datum/map_template/outpost/tadpole_city
	var/datum/map_template/outpost/z2_template = /datum/map_template/outpost/tadpole_city_z2
	var/datum/map_template/outpost/z3_template = /datum/map_template/outpost/tadpole_city_z3
	elevator_template = /datum/map_template/outpost/elevator_clip
	weather_controller_type = /datum/weather_controller/toxic

	main_level_ztraits = list(
		ZTRAIT_STATION = TRUE,
		ZTRAIT_SUN_TYPE = AZIMUTH,
		ZTRAIT_GRAVITY = STANDARD_GRAVITY,
		ZTRAIT_BASETURF = /turf/open/floor/plating/asteroid/battlefield_wasteland
	)
	var/list/other_level_ztraits = list(
		ZTRAIT_STATION = TRUE,
		ZTRAIT_SUN_TYPE = AZIMUTH,
		ZTRAIT_GRAVITY = STANDARD_GRAVITY,
		ZTRAIT_BASETURF = /turf/open/openspace
	)

	hangar_templates = list(
		/datum/map_template/outpost/hangar/clip_ocean_20x20,
		/datum/map_template/outpost/hangar/clip_ocean_40x20,
		/datum/map_template/outpost/hangar/clip_ocean_40x40,
		/datum/map_template/outpost/hangar/clip_ocean_56x20,
		/datum/map_template/outpost/hangar/clip_ocean_56x40
	)

/datum/overmap/outpost/tadpole_city/Initialize(position, datum/overmap_star_system/system_spawned_in, ...)
	z2_template = SSmapping.outpost_templates[z2_template]
	z3_template = SSmapping.outpost_templates[z3_template]
	return ..()

/datum/overmap/outpost/tadpole_city/load_main_level()
	if(!main_template)
		CRASH("[src] ([src.type]) tried to load without a template!")

	log_game("[src] [REF(src)] OUTPOST MAP LEVEL INIT")
	log_shuttle("[src] [REF(src)] OUTPOST MAP LEVEL INIT")

	var/datum/virtual_level/vlevel = SSmapping.create_virtual_level(
		name,
		main_level_ztraits,
		mapzone,
		QUADRANT_MAP_SIZE,
		QUADRANT_MAP_SIZE,
		ALLOCATION_QUADRANT,
		QUADRANT_MAP_SIZE
	)
	vlevel.reserve_margin(QUADRANT_SIZE_BORDER)

	main_template.load(vlevel.get_unreserved_bottom_left_turf())


	//var/datum/virtual_level/vlevel1 = mapzone.virtual_levels[1]
	var/datum/virtual_level/vlevel2 = SSmapping.create_virtual_level(
		name + " - Skylines",
		other_level_ztraits,
		mapzone,
		QUADRANT_MAP_SIZE,
		QUADRANT_MAP_SIZE,
		ALLOCATION_QUADRANT,
		QUADRANT_MAP_SIZE
	)
	vlevel2.reserve_margin(QUADRANT_SIZE_BORDER)
	//we link the 2 levels
	vlevel.up_linkage = vlevel2
	vlevel2.down_linkage = vlevel

	z2_template.load(vlevel2.get_unreserved_bottom_left_turf())

	var/datum/virtual_level/vlevel3 = SSmapping.create_virtual_level(
		name + " - Skylines",
		other_level_ztraits,
		mapzone,
		QUADRANT_MAP_SIZE,
		QUADRANT_MAP_SIZE,
		ALLOCATION_QUADRANT,
		QUADRANT_MAP_SIZE
	)
	vlevel3.reserve_margin(QUADRANT_SIZE_BORDER)
	//we link the 2 levels
	vlevel2.up_linkage = vlevel3
	vlevel3.down_linkage = vlevel2

	z3_template.load(vlevel3.get_unreserved_bottom_left_turf())

	if(weather_controller_type)
		new weather_controller_type(mapzone)

	// assoc list of lists of landmarks in a shaft, starting with the main landmark
	var/list/list/shaft_lists = list()
	for(var/obj/effect/landmark/outpost/elevator/ele_mark in GLOB.outpost_landmarks)
		if(!vlevel.is_in_bounds(ele_mark) || !vlevel2.is_in_bounds(ele_mark) || !vlevel3.is_in_bounds(ele_mark))
			continue
		if(!istext(ele_mark.shaft))
			stack_trace("Invalid shaft var [ele_mark.shaft] on [ele_mark] found when loading [main_template]!")
			qdel(ele_mark)
		else
			shaft_lists[ele_mark.shaft] = list(ele_mark)

	SEND_SIGNAL(src, COMSIG_OVERMAP_LOADED)

	// now we get the machine landmarks (button, doors) and add them to the shaft list
	for(var/obj/effect/landmark/outpost/elevator_machine/mach_mark in GLOB.outpost_landmarks)
		if(!vlevel.is_in_bounds(mach_mark) || !vlevel2.is_in_bounds(mach_mark) || !vlevel3.is_in_bounds(mach_mark))
			continue
		if(!(mach_mark.shaft in shaft_lists))
			stack_trace("Invalid shaft var [mach_mark.shaft] on [mach_mark] found when loading [main_template]!")
			qdel(mach_mark)
		else
			shaft_lists[mach_mark.shaft] += mach_mark

	for(var/obj/effect/landmark/outpost/subshuttle_dock/sub_dock in GLOB.outpost_landmarks)
		sub_dock.set_up_dock(src)

	for(var/obj/docking_port/stationary/docks in main_floor_docks)
		docks.name = "[name] subshuttle dock"
		docks.load_roundstart()

	for(var/shaft_name in shaft_lists)
		var/list/obj/shaft_li = shaft_lists[shaft_name]
		var/obj/effect/landmark/outpost/elevator/anchor_landmark = shaft_li[1]
		var/obj/structure/elevator_platform/plat

		// load the template
		elevator_template.load(anchor_landmark.loc)
		plat = locate() in anchor_landmark.loc
		// create the shaft datum
		shaft_datums += new /datum/hangar_shaft(shaft_name, plat.master_datum)
		// give the elevator a first floor
		plat.master_datum.add_floor_landmarks(anchor_landmark, shaft_li - anchor_landmark)


/*
	CLIP Ocean outpost //I really hated ghost leviathans, man
*/
/datum/map_template/outpost/tadpole_city
	name = "tadpole_city"
	outpost_name = "Tadpole City"

/datum/map_template/outpost/tadpole_city_z2
	name = "tadpole_city_z2"
	outpost_name = "Tadpole City"

/datum/map_template/outpost/tadpole_city_z3
	name = "tadpole_city_z3"
	outpost_name = "Tadpole City"

/datum/map_template/outpost/hangar/clip_ocean_20x20
	name = "hangar/clip_ocean_20x20"
	dock_width = 20
	dock_height = 20

/datum/map_template/outpost/hangar/clip_ocean_40x20
	name = "hangar/clip_ocean_40x20"
	dock_width = 40
	dock_height = 20

/datum/map_template/outpost/hangar/clip_ocean_40x40
	name = "hangar/clip_ocean_40x40"
	dock_width = 40
	dock_height = 40

/datum/map_template/outpost/hangar/clip_ocean_56x20
	name = "hangar/clip_ocean_56x20"
	dock_width = 56
	dock_height = 20

/datum/map_template/outpost/hangar/clip_ocean_56x40
	name = "hangar/clip_ocean_56x40"
	dock_width = 56
	dock_height = 40


/datum/overmap/outpost/no_main_level // For example and adminspawn.
	main_template = null
	elevator_template = /datum/map_template/outpost/elevator_test
	// Uses "test" hangars.
