extends Node2D


var spawn_area = Rect2(Vector2(100, 250), Vector2(500, 950))	#Rect2 = Position && Size

var sprite_sheet = preload("res://art/Sheets/FarmAnimals.png")
var animal_regions = {
	# Row 1: Cows
	"Cow_1": Rect2(0, 0, 31, 31),
	"Cow_2": Rect2(32, 0, 31, 31),
	"Cow_3": Rect2(64, 0, 31, 31),
	"Cow_4": Rect2(96, 0, 31, 31),
	"Cow_5": Rect2(128, 0, 31, 31),
	"Cow_6": Rect2(160, 0, 31, 31),

	# Row 2: Horses
	"Horse_1": Rect2(1, 32, 31, 31),
	"Horse_2": Rect2(33, 32, 31, 31),
	"Horse_3": Rect2(65, 32, 31, 31),
	"Horse_4": Rect2(97, 32, 31, 31),
	"Horse_5": Rect2(129, 32, 31, 31),
	"Horse_6": Rect2(161, 32, 31, 31),

	# Row 3: Pigs and Llamas
	"Pig_1": Rect2(0, 64, 31, 31),
	"Pig_2": Rect2(32, 64, 31, 31),
	"Pig_3": Rect2(64, 64, 31, 31),
	"Llama_1": Rect2(96, 64, 31, 31),
	"Llama_2": Rect2(128, 64, 31, 31),
	"Llama_3": Rect2(160, 64, 31, 31),

	# Row 4: Goats and Sheep
	"Goat_1": Rect2(0, 96, 31, 31),
	"Goat_2": Rect2(32, 96, 31, 31),
	"Goat_3": Rect2(64, 96, 31, 31),
	"Sheep_1": Rect2(96, 96, 31, 31),
	"Sheep_2": Rect2(128, 96, 31, 31),
	"Sheep_3": Rect2(160, 96, 31, 31),

	# Row 5: Donkeys and Rabbits
	"Donkey_1": Rect2(1, 128, 31, 31),
	"Donkey_2": Rect2(33, 128, 31, 31),
	"Rabbit_1": Rect2(65, 128, 31, 31),
	"Rabbit_2": Rect2(97, 128, 31, 31),
	"Rabbit_3": Rect2(129, 128, 31, 31),
	"Rabbit_4": Rect2(161, 128, 31, 31),

	# Row 6: Ducks and Geese
	"Duck_1": Rect2(0, 160, 31, 31),
	"Duck_2": Rect2(32, 160, 31, 31),
	"Duck_3": Rect2(64, 160, 31, 31),
	"Duck_4": Rect2(96, 160, 31, 31),
	"Goose_1": Rect2(128, 160, 31, 31),
	"Goose_2": Rect2(160, 160, 31, 31),

	# Row 7: Chickens
	"Chicken_1": Rect2(0, 192, 31, 31),
	"Chicken_2": Rect2(32, 192, 31, 31),
	"Chicken_3": Rect2(64, 192, 31, 31),
	"Chicken_4": Rect2(96, 192, 31, 31),
	"Chicken_5": Rect2(128, 192, 31, 31),
	"Chicken_6": Rect2(160, 192, 31, 31),

	# Row 8: Chicks
	"Chick_1": Rect2(0, 224, 31, 31),
	"Chick_2": Rect2(32, 224, 31, 31),
	"Chick_3": Rect2(64, 224, 31, 31),
	"Chick_4": Rect2(96, 224, 31, 31),
	"Chick_5": Rect2(128, 224, 31, 31),
	"Chick_6": Rect2(160, 224, 31, 31)
}
var last_spawn_position = Vector2(320, 640)

var animal_count = {
	"Chicken": 0,
	"Cow": 0,
	"Horse": 0,
	"Pig": 0,
	"Llama": 0,
	"Goat": 0,
	"Sheep": 0,
	"Donkey": 0,
	"Rabbit": 0,
	"Duck": 0,
	"Goose": 0,
	"Chick": 0
}

var income_per_animal = {
	"Chicken": 1,
	"Cow": 3,
	"Horse": 5,
	"Pig": 2,
	"Llama": 4,
	"Goat": 2,
	"Sheep": 3,
	"Donkey": 2,
	"Rabbit": 1,
	"Duck": 1,
	"Goose": 2,
	"Chick": 0.5
}



func _ready() -> void:	#entry
	pass
func _process(delta: float) -> void:	#Called every frame. 'delta' is the elapsed time since the previous frame.
	pass







func spawn_animal(animal_name: String) -> void:
	if animal_regions.has(animal_name):
		
		var animal_sprite = Sprite2D.new()							#create Animal Sprite2D
		animal_sprite.texture = sprite_sheet						#assign map of animals
		animal_sprite.region_enabled = true							#active region cut
		animal_sprite.region_rect = animal_regions[animal_name]		#cut the right animal from map
		var random_x = randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x)
		var random_y = randf_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y)
		animal_sprite.position = Vector2(random_x, random_y)				#spawn
		animal_sprite.scale = Vector2(2, 2)
		add_child(animal_sprite)									# Add it to the scene
		#last_spawn_position.x += 40  # Change position slightly on the x-axis for new animals
		
		
		print("Animal position: ", animal_sprite.position)

		
		
		var animal_type = animal_name.split("_")[0]
		if animal_count.has(animal_type):
			animal_count[animal_type] += 1

	else:
		print("Unknown animal: ", animal_name)

func set_spawn_area(new_position: Vector2, new_size: Vector2) -> void:
	spawn_area.position = new_position
	spawn_area.size = new_size
	print("Updated spawn area to: ", spawn_area)


############################### received signals ###########################################################
#Shop panel tells buy button pressed
func _on_shop_panel_money_updated(new_amount: Variant, animal_ID: Variant, passive_Income: Variant) -> void:
	spawn_animal(animal_ID)
