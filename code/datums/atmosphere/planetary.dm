// Atmos types used for planetary airs
/datum/atmosphere/lavaland
	id = LAVALAND_DEFAULT_ATMOS

	base_gases = list(
		GAS_O2=5,
		GAS_N2=10,
	)
	normal_gases = list(
		GAS_O2=10,
		GAS_N2=10,
		GAS_CO2=10,
	)
	restricted_gases = list(
		GAS_BZ=10,
		GAS_PLASMA=0.1,
		GAS_H2O=0.1,
	)
	restricted_chance = 50

	minimum_pressure = WARNING_LOW_PRESSURE + 10
	maximum_pressure = LAVALAND_EQUIPMENT_EFFECT_PRESSURE - 1

	minimum_temp = T20C + 80
	maximum_temp = T20C + 120

/datum/atmosphere/icemoon
	id = ICEMOON_DEFAULT_ATMOS

	base_gases = list(
		GAS_O2=5,
		GAS_N2=10,
	)
	normal_gases = list(
		GAS_O2=10,
		GAS_N2=10,
		GAS_CO2=10,
	)
	restricted_gases = list(
		GAS_PLASMA=0.1,
		GAS_H2O=0.1,
	)
	restricted_chance = 50

	minimum_pressure = HAZARD_LOW_PRESSURE + 10
	maximum_pressure = LAVALAND_EQUIPMENT_EFFECT_PRESSURE - 1

	minimum_temp = 180
	maximum_temp = 180

/datum/atmosphere/desert
	id = DESERT_DEFAULT_ATMOS
	base_gases = list(
		GAS_O2=20,
		GAS_N2=80,
	)
	normal_gases = list(
		GAS_O2=5,
		GAS_N2=5,
	)

	restricted_chance = 0

	minimum_pressure = ONE_ATMOSPHERE
	maximum_pressure = ONE_ATMOSPHERE + 50

	minimum_temp = T20C + 20
	maximum_temp = T20C + 80

/datum/atmosphere/shrouded
	id = SHROUDED_DEFAULT_ATMOS
	base_gases = list(
		GAS_N2=80,
		GAS_O2=20,
	)
	normal_gases = list(
		GAS_BZ=2,
		GAS_CO2=2,
	)
	restricted_chance = 0

	minimum_pressure = ONE_ATMOSPHERE - 10
	maximum_pressure = ONE_ATMOSPHERE + 20

	minimum_temp = T20C - 30
	maximum_temp = T20C - 10
