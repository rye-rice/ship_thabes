////////////////////////////////////////////SNACKS FROM VENDING MACHINES////////////////////////////////////////////
//in other words: junk food
//don't even bother looking for recipes for these

/obj/item/reagent_containers/food/snacks/candy
	name = "candy"
	desc = "Nougat love it or hate it."
	icon_state = "candy"
	trash = /obj/item/trash/candy
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3)
	junkiness = 25
	filling_color = "#D2691E"
	tastes = list("candy" = 1)
	foodtype = JUNKFOOD | SUGAR
	/*food_flags = FOOD_FINGER_FOOD*/
	w_class = WEIGHT_CLASS_TINY

/obj/item/reagent_containers/food/snacks/sosjerky
	name = "\improper Scaredy's Private Reserve Beef Jerky"
	icon_state = "sosjerky"
	desc = "Beef jerky made from the finest space cows."
	trash = /obj/item/trash/sosjerky
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sodiumchloride = 2)
	junkiness = 25
	filling_color = "#8B0000"
	tastes = list("dried meat" = 1)
	foodtype = JUNKFOOD | MEAT | SUGAR

/obj/item/reagent_containers/food/snacks/sosjerky/healthy
	name = "homemade beef jerky"
	desc = "Homemade beef jerky made from the finest space cows."
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1)
	junkiness = 0

/obj/item/reagent_containers/food/snacks/chips
	name = "chips"
	desc = "Commander Riker's What-The-Crisps."
	icon_state = "chips"
	trash = /obj/item/trash/chips
	bitesize = 1
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sodiumchloride = 1)
	junkiness = 20
	filling_color = "#FFD700"
	tastes = list("salt" = 1, "crisps" = 1)
	foodtype = JUNKFOOD | FRIED

/obj/item/reagent_containers/food/snacks/no_raisin
	name = "4no raisins"
	icon_state = "4no_raisins"
	desc = "Best raisins in the universe. Not sure why."
	trash = /obj/item/trash/raisins
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/sugar = 4)
	junkiness = 25
	filling_color = "#8B0000"
	tastes = list("dried raisins" = 1)
	foodtype = JUNKFOOD | FRUIT | SUGAR
	/*food_flags = FOOD_FINGER_FOOD*/
	custom_price = 5
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/no_raisin/healthy
	name = "homemade raisins"
	desc = "Homemade raisins, the best in all of spess."
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 2)
	junkiness = 0
	foodtype = FRUIT

/obj/item/reagent_containers/food/snacks/spacetwinkie
	name = "space twinkie"
	icon_state = "space_twinkie"
	desc = "Guaranteed to survive longer than you will."
	list_reagents = list(/datum/reagent/consumable/sugar = 4)
	junkiness = 25
	filling_color = "#FFD700"
	foodtype = JUNKFOOD | GRAIN | SUGAR
	/*food_flags = FOOD_FINGER_FOOD*/
	custom_price = 5
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/candy_trash
	name = "candy cigarette butt"
	icon = 'icons/obj/clothing/masks.dmi'
	icon_state = "candybum"
	desc = "The leftover from a smoked-out candy cigarette. Can be eaten!"
	list_reagents = list(/datum/reagent/consumable/sugar = 4, /datum/reagent/ash = 3)
	junkiness = 10 //powergame trash food by buying candy cigs in bulk and eating them when they extinguish
	filling_color = "#FFFFFF"
	foodtype = JUNKFOOD | SUGAR

/obj/item/reagent_containers/food/snacks/candy_trash/nicotine
	desc = "The leftover from a smoked-out candy cigarette. Smells like nicotine..?"
	list_reagents = list(/datum/reagent/consumable/sugar = 4, /datum/reagent/ash = 3, /datum/reagent/drug/nicotine = 1)

/obj/item/reagent_containers/food/snacks/cheesiehonkers
	name = "cheesie honkers"
	desc = "Bite sized cheesie snacks that will honk all over your mouth."
	icon_state = "cheesie_honkers"
	trash = /obj/item/trash/cheesie
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3)
	junkiness = 25
	filling_color = "#FFD700"
	tastes = list("cheese" = 5, "crisps" = 2)
	foodtype = JUNKFOOD | DAIRY | SUGAR
	custom_price = 5

/obj/item/reagent_containers/food/snacks/syndicake
	name = "syndi-cakes"
	icon_state = "syndi_cakes"
	desc = "An extremely moist snack cake that tastes just as good after being nuked."
	trash = /obj/item/trash/syndi_cakes
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/doctor_delight = 5)
	filling_color = "#F5F5DC"
	tastes = list("sweetness" = 3, "cake" = 1)
	foodtype = GRAIN | FRUIT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/energybar
	name = "Minute Energy bar"
	icon_state = "energybar"
	desc = "Referred to by many colorful names by the Minutemen it was issued to, this bar was produced by the Lanchester Foods Co. in order to supplement Minuteman rations in the field and improve morale. Though the initial version was infamous for being used more as a blunt weapon than anything else, nowadays it has found a place within the Minuteman and Civilian markets as a reliable source of nutrition."
	trash = /obj/item/trash/energybar
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/calcium = 2)
	filling_color = "#639fee"
	tastes = list("orange chocolate" = 3, "an awful lemon filling" = 2, "something hard" = 1)
	foodtype = JUNKFOOD | SUGAR
	/*food_flags = FOOD_FINGER_FOOD*/
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/reti
	name = "(yum!) Reti"
	icon_state = "miras-reti"
	desc = "Preserved Miras eggs vacuum sealed inside a small tin for freshness. A label declares it as a \"Proud Product of the Northern Teceti Coalition\"."
	trash = /obj/item/trash/mirastin
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/eggyolk = 2)
	filling_color = "#639fee"
	tastes = list("egg" = 5, "a slight metallic hint" = 1)
	foodtype = JUNKFOOD | MEAT
	/*food_flags = FOOD_FINGER_FOOD*/
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/reti/homemade
	name = "miras reti"
	icon_state = "miras-reti"
	desc = "Dried miras eggs sealed inside a tin. A great snack for on the trail."
	trash = /obj/item/trash/mirastin
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/eggyolk = 2, /datum/reagent/consumable/nutriment/protein = 2)
	filling_color = "#639fee"
	tastes = list("egg" = 5)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/lifosa
	name = "Lifosa Tiris"
	icon_state = "lifosa-tiris"
	desc = "Small pearls of Tiris Cheese, sealed in a salty crust, and distributed in a sealed tin. The interior of the tin is somewhat oily."
	trash = /obj/item/trash/lifosa
	filling_color = "#cac84e"
	tastes = list("rock salts" = 2, "cheese" = 4, "savory herbs" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)
	foodtype = DAIRY
	/*food_flags = FOOD_FINGER_FOOD*/
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/lifosa/homemade
	name = "tiris pearls"
	icon_state = "lifosa-tiris"
	desc = "Small pearls of Tiris Cheese, sealed in a salty crust. They're fairly oily, and have a savory aroma."
	trash = /obj/item/trash/lifosa
	filling_color = "#cac84e"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 2)

/obj/item/reagent_containers/food/snacks/dote
	name = "Dote on it!"
	icon_state = "dote"
	desc = "A quick snack native to Teceti. Dote berries are harvested, lightly seasoned, and dehydrated to make a crunchy fruit-based snack."
	trash = /obj/item/trash/dote
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)
	filling_color = "#639fee"
	tastes = list("crunchy berry" = 5)
	foodtype = JUNKFOOD | FRUIT
	/*food_flags = FOOD_FINGER_FOOD*/
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/dote/homemade
	name = "dried dote"
	icon_state = "dote-natural"
	desc = "Lightly seasoned, air-dried dote berries. A quick and crunchy snack."
	trash = null
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 2)
	filling_color = "#639fee"
	tastes = list("crunchy berry" = 5)
	foodtype = FRUIT
