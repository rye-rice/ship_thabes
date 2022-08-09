/datum/biome/ocean/deep/waterplanet
	open_turf_types = list(/turf/open/water/beach/deep = 1)
	mob_spawn_chance = 1.4
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/carp = 6,
	)
	feature_spawn_chance = 0.1

/datum/biome/cave/waterplanet
	open_turf_types = list(/turf/open/floor/plating/ashplanet/wateryrock = 1)
	closed_turf_types = list(/turf/closed/mineral/ash_rock = 1)
	flora_spawn_chance = 4
	flora_spawn_list = list(/obj/structure/flora/rock/beach = 1, /obj/structure/flora/rock/asteroid = 6)
	mob_spawn_chance = 1
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/bear/cave = 5,
		/mob/living/simple_animal/hostile/asteroid/lobstrosity/beach = 1,
	)

/datum/biome/cave/waterplanet/flooded
	open_turf_types = list(/turf/open/water/beach/underground = 1)

/datum/biome/cave/waterplanet/flooded/partially
	open_turf_types = list(/turf/open/water/beach/underground = 1, /turf/open/floor/plating/ashplanet/wateryrock = 5)

/datum/biome/cave/waterplanet/flooded/carpden
	open_turf_types = list(/turf/closed/mineral/ash_rock = 1, /turf/open/floor/plating/ashplanet/wateryrock = 4)
	flora_spawn_list = list(/obj/structure/flora/rock/beach = 1, /obj/structure/flora/rock/asteroid = 6)
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/carp = 99,
		/mob/living/simple_animal/hostile/space_dragon = 1,
	)


/datum/biome/cave/waterplanet/spider
	open_turf_types = list(/turf/closed/mineral/ash_rock = 1, /turf/open/floor/plating/ashplanet/wateryrock = 5)
	flora_spawn_list = list(/obj/structure/flora/rock/beach = 1, /obj/structure/spider/stickyweb = 6)
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/poison/giant_spider/tarantula = 20,
		/mob/living/simple_animal/hostile/poison/giant_spider/hunter = 8,
		/mob/living/simple_animal/hostile/poison/giant_spider/hunter/viper = 1
	)

/datum/biome/cave/waterplanet/fault
	open_turf_types = list(/turf/open/lava = 5, /turf/open/water/beach = 1)
	mob_spawn_chance = 0
