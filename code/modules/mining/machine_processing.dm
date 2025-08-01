/// Smelt amount per second
#define SMELT_AMOUNT 50

/**********************Mineral processing unit console**************************/

/obj/machinery/mineral
	idle_power_usage = IDLE_DRAW_MINIMAL
	processing_flags = START_PROCESSING_MANUALLY
	subsystem_type = /datum/controller/subsystem/processing/fastprocess
	/// The current direction of `input_turf`, in relation to the machine.
	var/input_dir = NORTH
	/// The current direction, in relation to the machine, that items will be output to.
	var/output_dir = SOUTH
	/// The turf the machines listens to for items to pick up. Calls the `pickup_item()` proc.
	var/turf/input_turf = null
	/// Determines if this machine needs to pick up items. Used to avoid registering signals to `/mineral` machines that don't pickup items.
	var/needs_item_input = FALSE

/obj/machinery/mineral/Initialize(mapload)
	. = ..()
	if(needs_item_input && anchored)
		register_input_turf()

/// Gets the turf in the `input_dir` direction adjacent to the machine, and registers signals for ATOM_ENTERED. Calls the `pickup_item()` proc when it receives these signals.
/// DO NOT ADD COMSIG_ATOM_CREATED, SINCE PICKUP_ITEM WILL QDEL THE ITEM AND QDELING AN INITIALISING THING IS STUPID
/obj/machinery/mineral/proc/register_input_turf()
	input_turf = get_step(src, input_dir)
	if(input_turf) // make sure there is actually a turf
		RegisterSignal(input_turf, COMSIG_ATOM_ENTERED, PROC_REF(pickup_item))

/// Unregisters signals that are registered the machine's input turf, if it has one.
/obj/machinery/mineral/proc/unregister_input_turf()
	if(input_turf)
		UnregisterSignal(input_turf, COMSIG_ATOM_ENTERED)

/obj/machinery/mineral/Moved()
	. = ..()
	if(!needs_item_input || !anchored)
		return
	unregister_input_turf()
	register_input_turf()

/**
	Base proc for all `/mineral` subtype machines to use. Place your item pickup behavior in this proc when you override it for your specific machine.

	Called when the COMSIG_ATOM_ENTERED and COMSIG_ATOM_CREATED signals are sent.

	Arguments:
	* source - the turf that is listening for the signals.
	* target - the atom that just moved onto the `source` turf.
	* oldLoc - the old location that `target` was at before moving onto `source`.
*/
/obj/machinery/mineral/proc/pickup_item(datum/source, atom/movable/target, atom/oldLoc)
	SIGNAL_HANDLER

	return

/// Generic unloading proc. Takes an atom as an argument and forceMove's it to the turf adjacent to this machine in the `output_dir` direction.
/obj/machinery/mineral/proc/unload_mineral(atom/movable/S)
	S.forceMove(drop_location())
	var/turf/T = get_step(src,output_dir)
	if(T)
		S.forceMove(T)

/obj/machinery/mineral/processing_unit_console
	name = "production machine console"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "console"
	density = FALSE
	///Connected processing unit
	var/obj/machinery/mineral/processing_unit/machine
	/// Direction for which console looks for stacking machine to connect to
	var/machinedir = EAST
	var/dist = 1

/obj/machinery/mineral/processing_unit_console/Initialize()
	. = ..()
	machine = locate(/obj/machinery/mineral/processing_unit, get_ranged_target_turf(src, machinedir, dist))
	if (machine)
		machine.CONSOLE = src

/obj/machinery/mineral/processing_unit_console/multitool_act(mob/living/user, obj/item/I) //TEMP newly adding: multitool linkage
	if(!multitool_check_buffer(user, I))
		return
	var/obj/item/multitool/M = I
	M.buffer = src
	to_chat(user, span_notice("You store linkage information in [I]'s buffer."))
	return TRUE

/obj/machinery/mineral/processing_unit_console/ui_interact(mob/user)
	. = ..()
	if(!machine)
		return

	var/dat = machine.get_machine_data()

	var/datum/browser/popup = new(user, "processing", "Smelting Console", 300, 500)
	popup.set_content(dat)
	popup.open()

/obj/machinery/mineral/processing_unit_console/Topic(href, href_list)
	if(..())
		return
	usr.set_machine(src)
	add_fingerprint(usr)

	if(href_list["material"])
		var/datum/material/new_material = locate(href_list["material"])
		if(istype(new_material))
			machine.selected_material = new_material
			machine.selected_alloy = null

	if(href_list["alloy"])
		machine.selected_material = null
		machine.selected_alloy = href_list["alloy"]

	if(href_list["set_on"])
		machine.on = (href_list["set_on"] == "on")
		machine.begin_processing()

	updateUsrDialog()
	return

/obj/machinery/mineral/processing_unit_console/Destroy()
	machine = null
	return ..()

/**********************Mineral processing unit**************************/


/obj/machinery/mineral/processing_unit
	name = "furnace"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "furnace"
	density = TRUE
	needs_item_input = TRUE
	var/obj/machinery/mineral/processing_unit_console/CONSOLE = null
	var/on = FALSE
	var/datum/material/selected_material = null
	var/selected_alloy = null
	var/datum/techweb/stored_research
	///Proximity monitor associated with this atom, needed for proximity checks.
	var/datum/proximity_monitor/proximity_monitor

/obj/machinery/mineral/processing_unit/Initialize()
	. = ..()
	proximity_monitor = new(src, 1)
	AddComponent(/datum/component/material_container, list(/datum/material/iron, /datum/material/glass, /datum/material/silver, /datum/material/gold, /datum/material/diamond, /datum/material/plasma, /datum/material/uranium, /datum/material/hellstone, /datum/material/titanium, /datum/material/bluespace), INFINITY, TRUE, /obj/item/stack)
	stored_research = new /datum/techweb/specialized/autounlocking/smelter
	selected_material = SSmaterials.GetMaterialRef(/datum/material/iron)

/obj/machinery/mineral/processing_unit/Destroy()
	CONSOLE = null
	QDEL_NULL(stored_research)
	return ..()

/obj/machinery/mineral/processing_unit/multitool_act(mob/living/user, obj/item/multitool/M)
	if(istype(M))
		if(istype(M.buffer, /obj/machinery/mineral/processing_unit_console))
			CONSOLE = M.buffer
			CONSOLE.machine = src
			to_chat(user, span_notice("You link [src] to the console in [M]'s buffer."))
			return TRUE

/obj/machinery/mineral/processing_unit/proc/process_ore(obj/item/stack/ore/O)
	if(QDELETED(O))
		return
	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	var/material_amount = materials.get_item_material_amount(O)
	if(!materials.has_space(material_amount))
		unload_mineral(O)
	else
		materials.insert_item(O)
		qdel(O)
		if(CONSOLE)
			CONSOLE.updateUsrDialog()

/obj/machinery/mineral/processing_unit/proc/get_machine_data()
	var/dat = "<b>Smelter control console</b><br><br>"
	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	for(var/datum/material/M in materials.materials)
		var/amount = materials.materials[M]
		dat += "<span class=\"res_name\">[M.name]: </span>[amount] cm&sup3;"
		if (selected_material == M)
			dat += " <i>Smelting</i>"
		else
			dat += " <A href='byond://?src=[REF(CONSOLE)];material=[REF(M)]'><b>Not Smelting</b></A> "
		dat += "<br>"

	dat += "<br><br>"
	dat += "<b>Smelt Alloys</b><br>"

	for(var/v in stored_research.researched_designs)
		var/datum/design/D = SSresearch.techweb_design_by_id(v)
		dat += "<span class=\"res_name\">[D.name] "
		if (selected_alloy == D.id)
			dat += " <i>Smelting</i>"
		else
			dat += " <A href='byond://?src=[REF(CONSOLE)];alloy=[D.id]'><b>Not Smelting</b></A> "
		dat += "<br>"

	dat += "<br><br>"
	//On or off
	dat += "Machine is currently "
	if (on)
		dat += "<A href='byond://?src=[REF(CONSOLE)];set_on=off'>On</A> "
	else
		dat += "<A href='byond://?src=[REF(CONSOLE)];set_on=on'>Off</A> "

	return dat

/obj/machinery/mineral/processing_unit/pickup_item(datum/source, atom/movable/target, atom/oldLoc)
	if(QDELETED(target))
		return
	if(istype(target, /obj/item/stack/ore))
		process_ore(target)

/obj/machinery/mineral/processing_unit/process(seconds_per_tick)
	if(on)
		if(selected_material)
			smelt_ore(seconds_per_tick)

		else if(selected_alloy)
			smelt_alloy(seconds_per_tick)


		if(CONSOLE)
			CONSOLE.updateUsrDialog()
	else
		end_processing()

/obj/machinery/mineral/processing_unit/proc/smelt_ore(seconds_per_tick = 2)
	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	var/datum/material/mat = selected_material
	if(mat)
		var/sheets_to_remove = (materials.materials[mat] >= (MINERAL_MATERIAL_AMOUNT * SMELT_AMOUNT * seconds_per_tick)) ? SMELT_AMOUNT * seconds_per_tick : round(materials.materials[mat] / MINERAL_MATERIAL_AMOUNT)
		if(!sheets_to_remove)
			on = FALSE
		else
			var/out = get_step(src, output_dir)
			materials.retrieve_sheets(sheets_to_remove, mat, out)


/obj/machinery/mineral/processing_unit/proc/smelt_alloy(seconds_per_tick = 2)
	var/datum/design/alloy = stored_research.isDesignResearchedID(selected_alloy) //check if it's a valid design
	if(!alloy)
		on = FALSE
		return

	var/amount = can_smelt(alloy, seconds_per_tick)

	if(!amount)
		on = FALSE
		return

	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	materials.use_materials(alloy.materials, amount)

	generate_mineral(alloy.build_path, amount)

/obj/machinery/mineral/processing_unit/proc/can_smelt(datum/design/D, seconds_per_tick = 2)
	if(D.make_reagents.len)
		return FALSE

	var/build_amount = SMELT_AMOUNT * seconds_per_tick

	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)

	for(var/mat_cat in D.materials)
		var/required_amount = D.materials[mat_cat]
		var/amount = materials.materials[mat_cat]

		build_amount = min(build_amount, round(amount / required_amount))

	return build_amount

/obj/machinery/mineral/processing_unit/proc/generate_mineral(P, amount)
	var/O = new P(src, amount)
	unload_mineral(O)

/obj/machinery/mineral/processing_unit/on_deconstruction()
	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	materials.retrieve_all()
	..()

#undef SMELT_AMOUNT
