extends PanelContainer

# Data for animals in the shop
var animals = [
	{ "name": "Chicken", "cost": 50, "icon": preload("res://art/chicken_icon.svg") },
	{ "name": "Chicken", "cost": 50, "icon": preload("res://art/chicken_icon.svg") }
	#{ "name": "Cow", "cost": 200, "icon": preload("res://cow_icon.png") }
]

signal money_updated(new_amount)

var money = 0  # Reference player's money (update from main game)

# Called when the node enters the scene tree
func _ready():
	populate_shop()
	self.visible = false

# Populate the shop UI
func populate_shop():
	var animal_list = $VBoxContainer/AnimalList
	for animal in animals:
		# Create a new HBoxContainer for each animal
		var entry = HBoxContainer.new()

		# Add icon
		var icon = TextureRect.new()
		icon.texture = animal["icon"]
		icon.expand_mode = 2
		icon.custom_minimum_size = Vector2(64, 64)  # Fix the icon's minimum size
		entry.add_child(icon)


		# Add name label
		var name_label = Label.new()
		name_label.text = animal["name"]
		entry.add_child(name_label)

		# Add cost label
		var cost_label = Label.new()
		cost_label.text = "$" + str(animal["cost"])
		entry.add_child(cost_label)

		# Add buy button
		var buy_button = Button.new()
		buy_button.text = "Buy"
		buy_button.connect("pressed", _on_buy_pressed.bind(animal))


		entry.add_child(buy_button)

		# Add the entry to the animal list
		animal_list.add_child(entry)

# Handle buy button presses
func _on_buy_pressed(animal):
	if money >= animal["cost"]:
		emit_signal("money_updated", -animal["cost"])
		add_animal_to_inventory(animal)
	else:
		print("Not enough money!")
		print(money)

# Add purchased animal to the player's inventory
func add_animal_to_inventory(animal):
	print("Purchased: " + animal["name"])
	# Implement your logic to add the animal to the game (e.g., increase passive income)




#Show shop
func _on_shop_button_toggled(toggled_on: bool) -> void:
	self.visible = !self.visible

#Updates money
func _on_game_manager_money_updated(new_amount: Variant) -> void:
	money = new_amount;
