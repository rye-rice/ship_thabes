/datum/biome/desert
	open_turf_types = list(/turf/open/floor/plating/asteroid/desert/lit = 1)
	/*
	flora_spawn_list = list(
		/obj/structure/flora/planetary/palebush,
		/obj/structure/flora/rock/pile,
		/obj/structure/flora/rock,
		/obj/structure/flora/ash/cacti,
	)
	*/
	flora_spawn_chance = 3
	mob_spawn_chance = 1

	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/asteroid/antlion = 100,
	//	/mob/living/simple_animal/tindalos = 60,
	//	/mob/living/simple_animal/thinbug = 60,
		/mob/living/simple_animal/hostile/lizard = 20,
		/mob/living/simple_animal/hostile/asteroid/antlion/mega = 10,
	)

/datum/biome/dry_seafloor
	open_turf_types = list(/turf/open/floor/plating/asteroid/dry_seafloor/lit = 1)

/datum/biome/cave/desert
	open_turf_types = list(/turf/open/floor/plating/asteroid/desert = 1)
	closed_turf_types = list(/turf/closed/mineral/random/desert = 1)
	flora_spawn_chance = 4
	flora_spawn_list = list(/obj/structure/flora/rock/beach = 1, /obj/structure/flora/rock/asteroid = 6)
	mob_spawn_chance = 1
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/asteroid/antlion = 100,
		/mob/living/simple_animal/hostile/lizard = 20,
		/mob/living/simple_animal/hostile/asteroid/antlion/mega = 10,
	)
