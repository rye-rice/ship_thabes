/datum/sprite_accessory/hair/pod
	icon = 'modular_thabes/podpeopleshit/podperson_hair.dmi'

/datum/sprite_accessory/hair/pod/ivy
	name = "Ivy (Podperson)"
	icon_state = "hair_ivy"

/datum/sprite_accessory/hair/pod/cabbage
	name = "Cabbage (Podperson)"
	icon_state = "hair_cabbage"

/datum/sprite_accessory/hair/pod/spinach
	name = "Spinach (Podperson)"
	icon_state = "hair_spinach"

/datum/sprite_accessory/hair/pod/prayer
	name = "Prayer (Podperson)"
	icon_state = "hair_prayer"

/datum/sprite_accessory/hair/pod/vine
	name = "Vine (Podperson)"
	icon_state = "hair_vine"

/datum/sprite_accessory/hair/pod/shrub
	name = "Shrub (Podperson)"
	icon_state = "hair_shrub"

/datum/sprite_accessory/hair/pod/rose
	name = "Rose (Podperson)"
	icon_state = "hair_rose"

/datum/sprite_accessory/hair/pod/orchid
	name = "Orchid (Podperson)"
	icon_state = "hair_orchid"

/datum/sprite_accessory/hair/pod/fig
	name = "Fig (Podperson)"
	icon_state = "hair_fig"

/datum/sprite_accessory/hair/pod/hibiscus
	name = "Hibiscus (Podperson)"
	icon_state = "hair_hibiscus"

//while im here, heres some custom code for an event i wanna run

/turf/open/floor/plating/asteroid/dirt
	gender = PLURAL
	name = "dirt"
	desc = "It's quite dirty."
	icon = 'icons/turf/floors.dmi'
	base_icon_state = "dirt"
	icon_state = "dirt"
	planetary_atmos = FALSE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = TRUE
	baseturfs = /turf/open/floor/plating/asteroid/dirt
	floor_variance = 0
	var/update_lighting_on_init = TRUE
	var/has_grass = FALSE

/turf/open/floor/plating/asteroid/dirt/examine(mob/user)
	. = ..()
	if(has_grass)
		return
	if(ismob(user, /datum/species/pod))
		. += "<span class='notice'>While this plot of land is now farmable and fertile, theres nothing growing on it. Perhaps you could add <i>grass?</i></span>"

/turf/open/floor/plating/asteroid/dirt/Initialize(mapload, inherited_virtual_z)
	. = ..()
	if(smoothing_flags)
		var/matrix/translation = new
		translation.Translate(-9, -9)
		transform = translation
	if(!update_lighting_on_init)
		return
	var/area/selected_area = get_area(src)
	if(istype(selected_area, /area/overmap_encounter) && !istype(selected_area, /area/overmap_encounter/planetoid/cave)) //cheap trick, but i dont want to automate this shit
		light_range = 2
		light_power = 0.80
		update_light()

/turf/open/floor/plating/asteroid/dirt/attackby(obj/item/item_attacked_by, mob/user, params)
	. = ..()
	if(has_grass)
		return
	if(!istype(item_attacked_by, /obj/item/reagent_containers/food/snacks/grown/grass))
		return FALSE
	var/grass_to_plant = /turf/open/floor/plating/asteroid/dirt/grass

	if(istype(item_attacked_by, /obj/item/reagent_containers/food/snacks/grown/grass/fairy))
		grass_to_plant = /turf/open/floor/plating/asteroid/dirt/grass/fairy

	visible_message("<span class='notice'>You plant the [item_attacked_by], and the dirt accepts it. It should be breathable now.</span>")
	qdel(item_attacked_by)
	ChangeTurf(grass_to_plant, flags = CHANGETURF_IGNORE_AIR)


/turf/open/floor/plating/asteroid/dirt/getDug()
	. = ..()
	ScrapeAway()

/turf/open/floor/plating/asteroid/dirt/burn_tile()
	ScrapeAway()
	return TRUE

/turf/open/floor/plating/asteroid/dirt/ex_act(severity, target)
	. = ..()
	ScrapeAway()

/turf/open/floor/plating/asteroid/dirt/grass
	name = "grass"
	desc = "A patch of grass."
	icon_state = "grass0"
	base_icon_state = "grass"
	bullet_bounce_sound = null
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_FLOOR_GRASS)
	canSmoothWith = list(SMOOTH_GROUP_CLOSED_TURFS, SMOOTH_GROUP_FLOOR_GRASS)
	layer = HIGH_TURF_LAYER
	icon = 'icons/turf/floors/grass.dmi'
	planetary_atmos = TRUE
	baseturfs = /turf/open/floor/plating/asteroid/dirt
	floor_variance = 100
	max_icon_states = 3
	tiled_dirt = FALSE
	update_lighting_on_init = TRUE
	has_grass = TRUE

/turf/open/floor/plating/asteroid/dirt/grass/fairy
	light_range = 2
	light_power = 0.80
	light_color = COLOR_BLUE_LIGHT
	update_lighting_on_init = FALSE

/turf/open/floor/plating/asteroid/basalt/lava_land_surface/basin
	name = "dried basin"
	desc = "Dried up basin."
	icon_state = "dried_up"
	icon_plating = "dried_up"
	base_icon_state = "dried_up"
	digResult = /obj/item/stack/ore/glass/basalt
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/floor/plating/asteroid/basalt/lava_land_surface/basin
	var/update_lighting_on_init = TRUE
	var/current_water = 0 //yeah

/turf/open/floor/plating/asteroid/basalt/lava_land_surface/basin/examine(mob/user)
	. = ..()
	if(ismob(user, /datum/species/pod))
		. += "<span class='notice'>It could hold water, maybe 50 units per meter could do the trick. Currently, it has <i>[current_water]</i> units.</span>"

/turf/open/floor/plating/asteroid/basalt/lava_land_surface/basin/Initialize(mapload, inherited_virtual_z) //inheritance moment
	. = ..()
	if(!update_lighting_on_init)
		return
	var/area/selected_area = get_area(src)
	if(istype(selected_area, /area/overmap_encounter) && !istype(selected_area, /area/overmap_encounter/planetoid/cave)) //cheap trick, but i dont want to automate this shit
		light_range = 2
		light_power = 0.80
		update_light()

/turf/open/floor/plating/asteroid/whitesands/dried
	var/current_water = 0 //yeah

/turf/open/floor/plating/asteroid/whitesands/dried/examine(mob/user)
	. = ..()
	if(ismob(user, /datum/species/pod))
		. += "<span class='notice'>It could hold water, maybe 50 units per meter could do the trick. Currently, it has <i>[current_water]</i> units.</span>"

/turf/open/floor/plating/asteroid/sand/terraform
	light_color = LIGHT_COLOR_TUNGSTEN
	var/update_lighting_on_init = TRUE

/turf/open/floor/plating/asteroid/sand/terraform/Initialize(mapload, inherited_virtual_z) //inheritance moment
	. = ..()
	if(!update_lighting_on_init)
		return
	var/area/selected_area = get_area(src)
	if(istype(selected_area, /area/overmap_encounter) && !istype(selected_area, /area/overmap_encounter/planetoid/cave)) //cheap trick, but i dont want to automate this shit
		light_range = 2
		light_power = 0.80
		update_light()

/turf/closed/mineral/random/volcanic/terraformed
	turf_type = /turf/open/floor/plating/asteroid/dirt
	baseturfs = /turf/open/floor/plating/asteroid/dirt

/datum/reagent/water/expose_turf(turf/exposed_turf, reac_volume)
	if(!isopenturf(exposed_turf))
		return ..()
	var/turf/open/floor/plating/asteroid/basalt/lava_land_surface/basin/terraform_target = exposed_turf

	if(istype(terraform_target,  /turf/open/floor/plating/asteroid/basalt/lava_land_surface/basin) || istype(terraform_target, /turf/open/floor/plating/asteroid/whitesands/dried)) //if basin, replace with water
		terraform_target.current_water += reac_volume
		if(terraform_target.current_water >= 50)
			terraform_target.ChangeTurf(/turf/open/water/beach, flags = CHANGETURF_INHERIT_AIR)
			terraform_target.visible_message("<span class='notice'>The [terraform_target.name] fills up with water!</span>")
			return ..()
		else
			terraform_target.visible_message("<span class='notice'>The [terraform_target.name] is filled up with [terraform_target.current_water] units of water.</span>")
			return ..()

/datum/reagent/water/expose_obj(obj/exposed_object, reac_volume)
	. = ..()
	if(istype(exposed_object, /obj/structure/flora/rock/lava) || istype(exposed_object, /obj/structure/flora/rock/pile/lava))
		exposed_object.icon = 'icons/obj/flora/rocks.dmi'
		exposed_object.visible_message("<span class='notice'>[src]cools down.</span>")

/obj/structure/flora/rock/lava/examine(mob/user)
	. = ..()
	if(ismob(user, /datum/species/pod))
		. += "<span class='notice'>If I pour some <i>water</i> onto it, maybe it can cool down?</span>"


/obj/structure/flora/rock/pile/lava/examine(mob/user)
	. = ..()
	if(ismob(user, /datum/species/pod))
		. += "<span class='notice'>If I pour some <i>water</i> onto it, maybe it can cool down?</span>"

/// actual event content

/obj/machinery/cryopod/podperson
	name = "overgrown hydroponic tray"
	desc = "A hydroponic tray with the cover on, covering a large and humanlike figure inside."
	icon = 'modular_thabes/podpeopleshit/seed_vault.dmi'
	icon_state = "cryotray"
	open_state = "cryotray"
	close_state = "cryotray"

/obj/machinery/cryopod/podperson/apply_effects_to_mob(mob/living/carbon/sleepyhead)
	//it always sucks a little to get up
	sleepyhead.SetSleeping(10 SECONDS) //if you read this comment and feel like shitting together something to adjust elzu and IPC charge on wakeup, be my guest.
	//so much worse
	if(!ispodperson(sleepyhead))
		sleepyhead.set_species(/datum/species/pod)
	if(ishuman(sleepyhead))
		var/mob/living/carbon/human/current_human = sleepyhead
		current_human.underwear = "Nude" //You're a plant, partner
		current_human.undershirt = "Nude"
		current_human.socks = "Nude"
		current_human.update_body()
	to_chat(sleepyhead, "<span class='boldnotice'>A strange but soothing feeling comes down on you as you are given life!")

/obj/machinery/cryopod/podperson/join_player_here(mob/M)
	. = ..()
	close_machine(M, TRUE)
	open_machine()
	new/obj/structure/fluff/empty_terrarium/podperson(get_turf(src))
	qdel(src)

/obj/structure/fluff/empty_terrarium/podperson //Empty terrariums are created when a preserved terrarium in a lavaland seed vault is activated.
	name = "overgrown hydroponic tray"
	desc = "A rusty and broken hydroponic tray. The lights are going off, showing a malfunction of some kind."
	icon = 'modular_thabes/podpeopleshit/seed_vault.dmi'
	icon_state = "cryotray-open"
	density = TRUE

/obj/item/paper/fluff/ruins/podperson_1
	name = "Read this, new ones."
	default_raw_text = "<b>*Welcome to being alive, lifebringers!*</b><br><br>Please get yourself oreinted and familiar with this strange new state. It may be confusing, but I'm sure you'll get the hang of it! \
	Once you are ready, proceed to the next room!"

/obj/item/paper/fluff/ruins/podperson_2
	name = "How to use the Holopad."
	default_raw_text = "<b>*Using the holopad is quite easy!*</b><br><br>Simply pick up the disk and insert it into the device, and hit 'PLAY', easy!"

/datum/preset_holoimage/lifebringer
	outfit_type = /datum/outfit/job/rd/rig

/obj/item/disk/holodisk/podperson
	name = "Introduction to your vault"
	desc = "A holodisk containing critical information about your mission."
	preset_image_type = /datum/preset_holoimage/lifebringer
	preset_record_text = {"
	NAME The Lifebringer
	SAY Welcome, fellow lifebringers.
	DELAY 45
	SAY You may be confused, or even scared. But allow me to explain.
	DELAY 40
	SAY Many centuries or eons ago, there was something called 'life.'
	DELAY 40
	SAY There is no easy way to explain what 'life' is. But just take one look at yourself. This is 'life'.
	DELAY 45
	SAY Unfortunately, for one reason or another, it has all disapeared. You are all that is left.
	DELAY 45
	SAY I have created you with the purpose of bringinng life back to the galaxy. Scattered across the galaxy are various vaults like this to assist with your task.
	DELAY 65
	SAY I have imprinted some of my vast knowledge into your DNA. But this may not be enough. So allow me to explain.
	DELAY 50
	SAY The critical ingredient is Genesis Serum. You may make it by growing 'World Peas' or through the biogenerator included in your vault.
	DELAY 65
	SAY By pouring it on bare ground, a miracle happens. Bare ground turns into fetile ground.
	DELAY 50
	SAY However of course, you need to plant some grass for it to produce breathable air.
	DELAY 45
	SAY After this, pouring the serum again allows plants to sprout out spontaniously.
	DELAY 50
	SAY Pouring it on various differnt objects has different effects. Be sure to experiment!
	DELAY 50
	SAY Now then, enough talking from me, Ill let you get on with it. Best of luck lifebringers!
	DELAY 55
	"}

/datum/outfit/naked //so linters dont scream at me
	name = "Naked"
