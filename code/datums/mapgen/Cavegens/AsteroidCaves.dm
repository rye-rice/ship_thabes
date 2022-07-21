/datum/map_generator/cave_generator/asteroid
	open_turf_types = list(/turf/open/floor/plating/asteroid/airless = 1)
	closed_turf_types =  list(/turf/closed/mineral/random = 1)

	feature_spawn_chance = 1
	feature_spawn_list = list(/obj/structure/geyser/random = 1)
	mob_spawn_list = list(/mob/living/simple_animal/hostile/asteroid/goliath = 25, /obj/structure/spawner/mining/goliath = 30, \
		/mob/living/simple_animal/hostile/asteroid/basilisk = 25, /obj/structure/spawner/mining = 30, \
		/mob/living/simple_animal/hostile/asteroid/hivelord = 25, /obj/structure/spawner/mining/hivelord = 30, \
		SPAWN_MEGAFAUNA = 4, /mob/living/simple_animal/hostile/asteroid/goldgrub = 10)
	flora_spawn_list = list(/obj/structure/flora/ash/space/voidmelon = 2)

	initial_closed_chance = 55
	smoothing_iterations = 50
	birth_limit = 4
	death_limit = 3
	mob_spawn_chance = 6

/datum/map_generator/cave_generator/asteroid/generate_terrain(list/turfs)
	var/maxx
	var/maxy
	var/minx
	var/miny
	for(var/turf/current_turf as anything in turfs)
		//Gets the min/max X value
		if(current_turf.x < minx || !minx)
			minx = current_turf.x
		else if(current_turf.x > maxx)
			maxx = current_turf.x

		//Gets the min/max Y value
		if(current_turf.y < miny || !miny)
			miny = current_turf.y
		else if(current_turf.y > maxy)
			maxy = current_turf.y

	var/midx = minx + (maxx - minx) / 2
	var/midy = miny + (maxy - miny) / 2
	var/radius = min(maxx - minx, maxy - miny) / 3

	var/list/turfs_to_gen = list()
	var/area/asteroid/asteroid_area = GLOB.areas_by_type[/area/asteroid] || new
	for(var/turf/current_turf as anything in turfs)
		var/randradius = rand(radius - 2, radius + 2) * rand(radius - 2, radius + 2)
		if((current_turf.y - midy) ** 2 + (current_turf.x - midx) ** 2 >= randradius)
			continue
		turfs_to_gen += current_turf
		var/area/old_area = get_area(current_turf)
		asteroid_area.contents += current_turf
		current_turf.change_area(old_area, asteroid_area)

	return ..(turfs_to_gen)

