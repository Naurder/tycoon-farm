extends PanelContainer

# Data for animals in the shop

func generate_icons() -> Dictionary:
	var animal_regions = {
		# Row 1: Cows
		"Cow_1": Rect2(0, 0, 32, 32),
		"Cow_2": Rect2(32, 0, 32, 32),
		"Cow_3": Rect2(64, 0, 32, 32),
		"Cow_4": Rect2(96, 0, 32, 32),
		"Cow_5": Rect2(128, 0, 32, 32),
		"Cow_6": Rect2(160, 0, 32, 32),

		# Row 2: Horses
		"Horse_1": Rect2(0, 32, 32, 32),
		"Horse_2": Rect2(32, 32, 32, 32),
		"Horse_3": Rect2(64, 32, 32, 32),
		"Horse_4": Rect2(96, 32, 32, 32),
		"Horse_5": Rect2(128, 32, 32, 32),
		"Horse_6": Rect2(160, 32, 32, 32),

		# Row 3: Pigs and Llamas
		"Pig_1": Rect2(0, 64, 32, 32),
		"Pig_2": Rect2(32, 64, 32, 32),
		"Pig_3": Rect2(64, 64, 32, 32),
		"Llama_1": Rect2(96, 64, 32, 32),
		"Llama_2": Rect2(128, 64, 32, 32),
		"Llama_3": Rect2(160, 64, 32, 32),

		# Row 4: Goats and Sheep
		"Goat_1": Rect2(0, 96, 32, 32),
		"Goat_2": Rect2(32, 96, 32, 32),
		"Goat_3": Rect2(64, 96, 32, 32),
		"Sheep_1": Rect2(96, 96, 32, 32),
		"Sheep_2": Rect2(128, 96, 32, 32),
		"Sheep_3": Rect2(160, 96, 32, 32),

		# Row 5: Donkeys and Rabbits
		"Donkey_1": Rect2(0, 128, 32, 32),
		"Donkey_2": Rect2(32, 128, 32, 32),
		"Rabbit_1": Rect2(64, 128, 32, 32),
		"Rabbit_2": Rect2(96, 128, 32, 32),
		"Rabbit_3": Rect2(128, 128, 32, 32),
		"Rabbit_4": Rect2(160, 128, 32, 32),

		# Row 6: Ducks and Geese
		"Duck_1": Rect2(0, 160, 32, 32),
		"Duck_2": Rect2(32, 160, 32, 32),
		"Duck_3": Rect2(64, 160, 32, 32),
		"Duck_4": Rect2(96, 160, 32, 32),
		"Goose_1": Rect2(128, 160, 32, 32),
		"Goose_2": Rect2(160, 160, 32, 32),

		# Row 7: Chickens
		"Chicken_1": Rect2(0, 192, 32, 32),
		"Chicken_2": Rect2(32, 192, 32, 32),
		"Chicken_3": Rect2(64, 192, 32, 32),
		"Chicken_4": Rect2(96, 192, 32, 32),
		"Chicken_5": Rect2(128, 192, 32, 32),
		"Chicken_6": Rect2(160, 192, 32, 32),

		# Row 8: Chicks
		"Chick_1": Rect2(0, 224, 32, 32),
		"Chick_2": Rect2(32, 224, 32, 32),
		"Chick_3": Rect2(64, 224, 32, 32),
		"Chick_4": Rect2(96, 224, 32, 32),
		"Chick_5": Rect2(128, 224, 32, 32),
		"Chick_6": Rect2(160, 224, 32, 32)
	}
	var icons = {}
	var sprite_sheet = preload("res://art/Sheets/FarmAnimals.png")
	
	for animal_name in animal_regions.keys():
		var region = animal_regions[animal_name]
		
		# Create an ImageTexture for the icon
		var icon_texture = AtlasTexture.new()
		icon_texture.atlas = sprite_sheet
		icon_texture.region = region
		
		# Store in the dictionary
		icons[animal_name] = icon_texture
	
	return icons
var animal_icons = generate_icons()				#it is dictionary that contains all of 

var animals = [
	{ "animal_ID": "Cow_1", "cost": 50, "icon": animal_icons["Cow_1"], "passive_income": 5 },
	{ "animal_ID": "Cow_2", "cost": 55, "icon": animal_icons["Cow_2"], "passive_income": 6 },
	{ "animal_ID": "Cow_3", "cost": 60, "icon": animal_icons["Cow_3"], "passive_income": 7 },
	{ "animal_ID": "Cow_4", "cost": 65, "icon": animal_icons["Cow_4"], "passive_income": 8 },
	{ "animal_ID": "Cow_5", "cost": 70, "icon": animal_icons["Cow_5"], "passive_income": 9 },
	{ "animal_ID": "Cow_6", "cost": 75, "icon": animal_icons["Cow_6"], "passive_income": 10 },

	{ "animal_ID": "Horse_1", "cost": 100, "icon": animal_icons["Horse_1"], "passive_income": 10 },
	{ "animal_ID": "Horse_2", "cost": 105, "icon": animal_icons["Horse_2"], "passive_income": 11 },
	{ "animal_ID": "Horse_3", "cost": 110, "icon": animal_icons["Horse_3"], "passive_income": 12 },
	{ "animal_ID": "Horse_4", "cost": 115, "icon": animal_icons["Horse_4"], "passive_income": 13 },
	{ "animal_ID": "Horse_5", "cost": 120, "icon": animal_icons["Horse_5"], "passive_income": 14 },
	{ "animal_ID": "Horse_6", "cost": 125, "icon": animal_icons["Horse_6"], "passive_income": 15 },

	{ "animal_ID": "Pig_1", "cost": 150, "icon": animal_icons["Pig_1"], "passive_income": 15 },
	{ "animal_ID": "Pig_2", "cost": 155, "icon": animal_icons["Pig_2"], "passive_income": 16 },
	{ "animal_ID": "Pig_3", "cost": 160, "icon": animal_icons["Pig_3"], "passive_income": 17 },
	{ "animal_ID": "Llama_1", "cost": 165, "icon": animal_icons["Llama_1"], "passive_income": 18 },
	{ "animal_ID": "Llama_2", "cost": 170, "icon": animal_icons["Llama_2"], "passive_income": 19 },
	{ "animal_ID": "Llama_3", "cost": 175, "icon": animal_icons["Llama_3"], "passive_income": 20 },

	{ "animal_ID": "Goat_1", "cost": 50, "icon": animal_icons["Goat_1"], "passive_income": 5 },
	{ "animal_ID": "Goat_2", "cost": 55, "icon": animal_icons["Goat_2"], "passive_income": 6 },
	{ "animal_ID": "Goat_3", "cost": 60, "icon": animal_icons["Goat_3"], "passive_income": 7 },
	{ "animal_ID": "Sheep_1", "cost": 65, "icon": animal_icons["Sheep_1"], "passive_income": 8 },
	{ "animal_ID": "Sheep_2", "cost": 70, "icon": animal_icons["Sheep_2"], "passive_income": 9 },
	{ "animal_ID": "Sheep_3", "cost": 75, "icon": animal_icons["Sheep_3"], "passive_income": 10 },

	{ "animal_ID": "Donkey_1", "cost": 100, "icon": animal_icons["Donkey_1"], "passive_income": 10 },
	{ "animal_ID": "Donkey_2", "cost": 105, "icon": animal_icons["Donkey_2"], "passive_income": 11 },
	{ "animal_ID": "Rabbit_1", "cost": 110, "icon": animal_icons["Rabbit_1"], "passive_income": 12 },
	{ "animal_ID": "Rabbit_2", "cost": 115, "icon": animal_icons["Rabbit_2"], "passive_income": 13 },
	{ "animal_ID": "Rabbit_3", "cost": 120, "icon": animal_icons["Rabbit_3"], "passive_income": 14 },
	{ "animal_ID": "Rabbit_4", "cost": 125, "icon": animal_icons["Rabbit_4"], "passive_income": 15 },

	{ "animal_ID": "Duck_1", "cost": 50, "icon": animal_icons["Duck_1"], "passive_income": 5 },
	{ "animal_ID": "Duck_2", "cost": 55, "icon": animal_icons["Duck_2"], "passive_income": 6 },
	{ "animal_ID": "Duck_3", "cost": 60, "icon": animal_icons["Duck_3"], "passive_income": 7 },
	{ "animal_ID": "Duck_4", "cost": 65, "icon": animal_icons["Duck_4"], "passive_income": 8 },
	{ "animal_ID": "Goose_1", "cost": 70, "icon": animal_icons["Goose_1"], "passive_income": 9 },
	{ "animal_ID": "Goose_2", "cost": 75, "icon": animal_icons["Goose_2"], "passive_income": 10 },

	{ "animal_ID": "Chicken_1", "cost": 50, "icon": animal_icons["Chicken_1"], "passive_income": 5 },
	{ "animal_ID": "Chicken_2", "cost": 55, "icon": animal_icons["Chicken_2"], "passive_income": 6 },
	{ "animal_ID": "Chicken_3", "cost": 60, "icon": animal_icons["Chicken_3"], "passive_income": 7 },
	{ "animal_ID": "Chicken_4", "cost": 65, "icon": animal_icons["Chicken_4"], "passive_income": 8 },
	{ "animal_ID": "Chicken_5", "cost": 70, "icon": animal_icons["Chicken_5"], "passive_income": 9 },
	{ "animal_ID": "Chicken_6", "cost": 75, "icon": animal_icons["Chicken_6"], "passive_income": 10 },

	{ "animal_ID": "Chick_1", "cost": 50, "icon": animal_icons["Chick_1"], "passive_income": 5 },
	{ "animal_ID": "Chick_2", "cost": 55, "icon": animal_icons["Chick_2"], "passive_income": 6 },
	{ "animal_ID": "Chick_3", "cost": 60, "icon": animal_icons["Chick_3"], "passive_income": 7 },
	{ "animal_ID": "Chick_4", "cost": 65, "icon": animal_icons["Chick_4"], "passive_income": 8 },
	{ "animal_ID": "Chick_5", "cost": 70, "icon": animal_icons["Chick_5"], "passive_income": 9 },
	{ "animal_ID": "Chick_6", "cost": 75, "icon": animal_icons["Chick_6"], "passive_income": 10 }
];

signal money_updated(new_amount, animal_ID, passive_Income)

var money = 0  # Reference player's money (update from main game)



func _ready():	#entry
	populate_shop()
	self.visible = false



# Populate the shop UI
func populate_shop():
	var animal_list = $ScrollContainer/VBoxContainer/AnimalList
	for animal in animals:
		# Create a new HBoxContainer for each animal
		var entry = HBoxContainer.new()
		
		
		entry.set_meta("cost", animal["cost"])
				
		# Add icon
		var icon = TextureRect.new()
		icon.name = "Icon"							#for calling in another functions by get_node()
		icon.texture = animal["icon"]
		icon.expand_mode = 2
		icon.custom_minimum_size = Vector2(64, 64)  # Fix the icon's minimum size
		icon.modulate = Color(0.5, 0.5, 0.5, 0.5)
		entry.add_child(icon)

		# Add name label
		var name_label = Label.new()
		name_label.name = "NameLabel"
		name_label.text = animal["animal_ID"]
		entry.add_child(name_label)

		# Add cost label
		var cost_label = Label.new()
		cost_label.name = "CostLabel"
		cost_label.text = "$" + str(animal["cost"])
		entry.add_child(cost_label)
		

		# Add buy button -> for buying animal
		var buy_button = Button.new()
		buy_button.name = "BuyButton"
		buy_button.text = "Buy"
		buy_button.connect("pressed", _on_buy_pressed.bind(animal))
		entry.add_child(buy_button)

		# Add the entry to the animal list
		animal_list.add_child(entry)

func update_shop():
	var animal_list = $ScrollContainer/VBoxContainer/AnimalList
	for entry in animal_list.get_children():
		var icon = entry.get_node("Icon")  # Assuming the first child is the icon
		#print(entry.get_meta("cost"))
		if entry.has_meta("cost"):
			var cost = entry.get_meta("cost")
			if money < cost:
				icon.modulate = Color(0.5, 0.5, 0.5, 0.5)  # Dim icon
			else:
				icon.modulate = Color(1, 1, 1, 1)  # Full brightness

func _on_buy_pressed(animal): 			# Handle BUY button presses
	if money >= animal["cost"]:
		emit_signal("money_updated", -animal["cost"], animal["animal_ID"], animal["passive_income"])		#informs GameManager.gd that money's reduced
		#print(animal["name"])
		#add_animal_to_inventory(animal)
	else:
		print("Not enough money!")
		print(money)

# Add purchased animal to the player's inventory			#currently ain't has implementation
func add_animal_to_inventory(animal):
	print("Purchased: " + animal["name"])
	# Implement your logic to add the animal to the game (e.g., increase passive income)




#Show shop
func _on_shop_button_toggled(toggled_on: bool) -> void:
	self.visible = !self.visible

#Signal from GameManager.gd     Updates money
func _on_game_manager_money_updated(new_amount: Variant) -> void:
	money = new_amount;
	update_shop()
