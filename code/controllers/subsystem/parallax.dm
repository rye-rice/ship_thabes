SUBSYSTEM_DEF(parallax)
	name = "Parallax"
	wait = 2
	flags = SS_POST_FIRE_TIMING | SS_BACKGROUND
	priority = FIRE_PRIORITY_PARALLAX
	runlevels = RUNLEVEL_LOBBY | RUNLEVELS_DEFAULT
	var/list/currentrun
	var/planet_x_offset = 128
	var/planet_y_offset = 128
	var/random_layer
	var/random_parallax_color

//These are cached per client so needs to be done asap so people joining at roundstart do not miss these.
/datum/controller/subsystem/parallax/PreInit()
	. = ..()
	if(prob(70))	//70% chance to pick a special extra layer
		random_layer = pick(/atom/movable/screen/parallax_layer/random/space_gas, /atom/movable/screen/parallax_layer/random/asteroids)
		random_parallax_color = pick(COLOR_TEAL, COLOR_GREEN, COLOR_SILVER, COLOR_YELLOW, COLOR_CYAN, COLOR_ORANGE, COLOR_PURPLE)//Special color for random_layer1. Has to be done here so everyone sees the same color.
	planet_y_offset = rand(100, 160)
	planet_x_offset = rand(100, 160)

/datum/controller/subsystem/parallax/fire(resumed = 0)
	if (!resumed)
		src.currentrun = GLOB.clients.Copy()

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun

	while(length(currentrun))
		var/client/current_client = currentrun[currentrun.len]
		currentrun.len--
		if (!current_client || !current_client.eye)
			if (MC_TICK_CHECK)
				return
			continue
		var/atom/movable/clients_camera = current_client.eye
		if(!istype(clients_camera))
			continue
		for (clients_camera; isloc(clients_camera.loc) && !isturf(clients_camera.loc); clients_camera = clients_camera.loc);

		if(clients_camera != current_client.movingmob)
			if(current_client.movingmob)
				LAZYREMOVE(current_client.movingmob.client_mobs_in_contents, current_client.mob)
			LAZYADD(clients_camera.client_mobs_in_contents, current_client.mob)
			current_client.movingmob = clients_camera
		if (MC_TICK_CHECK)
			return
	currentrun = null
