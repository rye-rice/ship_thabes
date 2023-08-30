/datum/map_generator/planet_generator/moon
	mountain_height = 0.8
	perlin_zoom = 65

	primary_area_type = /area/overmap_encounter/planetoid/moon

	biome_table = list(
		BIOME_COLDEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_LOW_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGH_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lunar_surface
		),
		BIOME_COLD = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_LOW_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGH_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lunar_surface
		),
		BIOME_WARM = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_LOW_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGH_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lunar_surface
		),
		BIOME_TEMPERATE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_LOW_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGH_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lunar_surface
		),
		BIOME_HOT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/rocky,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGH_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lunar_surface,
		),
		BIOME_HOTTEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/rocky,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rocky,
			BIOME_HIGH_HUMIDITY = /datum/biome/rocky,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lunar_surface
		)
	)
	cave_biome_table = list(
		BIOME_COLDEST_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/moon,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/moon,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/moon
		),
		BIOME_COLD_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/moon,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/moon,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/moon
		),
		BIOME_WARM_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/moon,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/moon,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/moon
		),
		BIOME_HOT_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/moon,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/moon,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/moon
		)
	)

/datum/biome/lunar_surface
	open_turf_types = list(/turf/open/floor/plating/asteroid/moon/lit)
	flora_spawn_chance = 3
	mob_spawn_chance = 0

/datum/biome/rocky
	open_turf_types = list(/turf/open/floor/plating/asteroid/moon_coarse/lit = 1)

/datum/biome/cave/moon
	open_turf_types = list(/turf/open/floor/plating/asteroid/moon = 1)
	closed_turf_types = list(/turf/closed/mineral/random/moon = 1)
//	flora_spawn_chance = 4
//	flora_spawn_list = list(/obj/structure/flora/rock/beach = 1, /obj/structure/flora/rock/asteroid = 6)

/*
/obj/effect/greeble_spawner
	name = "planet greeble spawner"
	var/template_id = "shelter_alpha"
	var/datum/map_template/shelter/template

/obj/effect/greeble_spawner/moon
	name = "moon greeble spawner"

/datum/map_template/greeble
	var/greeble_id
	var/description
	var/blacklisted_turfs
	var/whitelisted_turfs
	var/banned_areas
	var/banned_objects

/datum/map_template/shelter/New()
	. = ..()
	banned_areas = typecacheof(/area/shuttle)
	blacklisted_turfs = typecacheof(list(/turf/closed, /turf/open/indestructible))
	whitelisted_turfs = typecacheof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)

/datum/map_template/shelter/proc/check_deploy(turf/deploy_location)
	var/affected = get_affected_turfs(deploy_location, centered=TRUE)
	for(var/turf/T in affected)
		var/area/A = get_area(T)
		if(is_type_in_typecache(A, banned_areas))
			return SHELTER_DEPLOY_BAD_AREA

		var/banned = is_type_in_typecache(T, blacklisted_turfs)
		var/permitted = is_type_in_typecache(T, whitelisted_turfs)
		if(banned && !permitted)
			return SHELTER_DEPLOY_BAD_TURFS

		for(var/obj/O in T)
			if((O.density && O.anchored) || is_type_in_typecache(O, banned_objects))
				return SHELTER_DEPLOY_ANCHORED_OBJECTS
	return SHELTER_DEPLOY_ALLOWED

/datum/map_template/greeble/moon/crater1
	name = "Crater 1"
	greeble_id = "crater1"
	mappath = "_maps/templates/greebles/crater1.dmm"
*/

//TURFS

/turf/open/floor/plating/asteroid/moon
	gender = PLURAL
	name = "regolith"
	desc = "Supposedly poisonous to humanoids."
	baseturfs = /turf/open/floor/plating/asteroid/moon_coarse
	icon = 'icons/turf/planetary/moon.dmi'
	icon_state = "moonsand"
	base_icon_state = "moonsand"
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_ASTEROID
	clawfootstep = FOOTSTEP_HARD_CLAW
	planetary_atmos = TRUE
	initial_gas_mix = AIRLESS_ATMOS
	slowdown = 1.1 //hardsuits will slow enough

	floor_variance = 0
	max_icon_states = 0

	// footprint vars
	var/entered_dirs
	var/exited_dirs

/turf/open/floor/plating/asteroid/moon/Entered(atom/movable/AM)
	. = ..()
	if(!iscarbon(AM) || (AM.movement_type & (FLYING|VENTCRAWLING|FLOATING|PHASING)))
		return
	if(!(entered_dirs & AM.dir))
		entered_dirs |= AM.dir
		update_icon()

/turf/open/floor/plating/asteroid/moon/Exited(atom/movable/AM)
	. = ..()
	if(!iscarbon(AM) || (AM.movement_type & (FLYING|VENTCRAWLING|FLOATING|PHASING)))
		return
	if(!(exited_dirs & AM.dir))
		exited_dirs |= AM.dir
		update_icon()

// adapted version of footprints' update_icon code
/turf/open/floor/plating/asteroid/moon/update_overlays()
	. = ..()
	for(var/Ddir in GLOB.cardinals)
		if(entered_dirs & Ddir)
			var/image/print = GLOB.bloody_footprints_cache["entered-conc-[Ddir]"]
			if(!print)
				print = image('icons/effects/footprints.dmi', "moon1", layer = TURF_DECAL_LAYER, dir = Ddir)
				GLOB.bloody_footprints_cache["entered-conc-[Ddir]"] = print
			. += print
		if(exited_dirs & Ddir)
			var/image/print = GLOB.bloody_footprints_cache["exited-conc-[Ddir]"]
			if(!print)
				print = image('icons/effects/footprints.dmi', "moon2", layer = TURF_DECAL_LAYER, dir = Ddir)
				GLOB.bloody_footprints_cache["exited-conc-[Ddir]"] = print
			. += print

// pretty much ripped wholesale from footprints' version of this proc
/turf/open/floor/plating/asteroid/moon/setDir(newdir)
	if(dir == newdir)
		return ..()

	var/ang_change = dir2angle(newdir) - dir2angle(dir)
	var/old_entered_dirs = entered_dirs
	var/old_exited_dirs = exited_dirs
	entered_dirs = 0
	exited_dirs = 0

	for(var/Ddir in GLOB.cardinals)
		var/NDir = angle2dir_cardinal(dir2angle(Ddir) + ang_change)
		if(old_entered_dirs & Ddir)
			entered_dirs |= NDir
		if(old_exited_dirs & Ddir)
			exited_dirs |= NDir

/turf/open/floor/plating/asteroid/moon/getDug()
	. = ..()
	cut_overlays()

/turf/open/floor/plating/asteroid/moon/lit
	light_range = 2
	light_power = 1
	light_color = "#FFFFFF" // should look liminal, due to moons lighting
	baseturfs = /turf/open/floor/plating/asteroid/moon_coarse/lit
	floor_variance = 15
	max_icon_states = 0

/turf/open/floor/plating/asteroid/moon/lit/Initialize(mapload, inherited_virtual_z)
	. = ..()
	if(icon_state == "[base_icon_state]0")
		getDug(TRUE)


/turf/open/floor/plating/asteroid/moon_coarse
	name = "coarse regolith"
	desc = "Harder moonrock, less dusty."
	baseturfs = /turf/open/floor/plating/asteroid/moon_coarse
	icon = 'icons/turf/planetary/moon.dmi'
	icon_state = "moonsand_coarse"
	base_icon_state = "moonsand_coarse"
	gender = PLURAL
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_ASTEROID
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	floor_variance = 0
	max_icon_states = 0
	planetary_atmos = TRUE
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plating/asteroid/moon_coarse/lit
	light_range = 1
	light_power = 1
	light_color = "#FFFFFF" // should look liminal, due to moons lighting
	baseturfs = /turf/open/floor/plating/asteroid/moon_coarse/lit
	floor_variance = 15
	max_icon_states = 0

/turf/open/floor/plating/asteroid/moon_coarse/lit/Initialize(mapload, inherited_virtual_z)
	. = ..()
	if(icon_state == "[base_icon_state]0")
		getDug(TRUE)

/turf/closed/mineral/random/moon
	name = "moonrock"
	desc = "A great portal conductor, supposedly."
	icon = 'icons/turf/walls/moon.dmi'
	smooth_icon = 'icons/turf/walls/moon.dmi'
	icon_state = "moon-0"
	base_icon_state = "moon"
	initial_gas_mix = AIRLESS_ATMOS
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_BORDER
	canSmoothWith = list(SMOOTH_GROUP_CLOSED_TURFS)
	turf_type = /turf/open/floor/plating/asteroid/moon_coarse
	baseturfs = /turf/open/floor/plating/asteroid/moon_coarse
	mineralSpawnChanceList = list(/obj/item/stack/ore/uranium = 6, /obj/item/stack/ore/diamond = 1, /obj/item/stack/ore/gold = 20,
		/obj/item/stack/ore/silver = 12, /obj/item/stack/ore/plasma = 5, /obj/item/stack/ore/iron = 40, /obj/item/stack/ore/titanium = 6,
		/obj/item/stack/ore/bluespace_crystal = 1)
