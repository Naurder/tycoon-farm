extends Node2D


var sprite_sheet = preload("res://art/Sheets/FarmAnimals.png")
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
		var random_x = randi() % 720
		var random_y = randi() % 1280
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




############################### received signals ###########################################################
#Shop panel tells buy button pressed
func _on_shop_panel_money_updated(new_amount: Variant, animal_ID: Variant, passive_Income: Variant) -> void:
	spawn_animal(animal_ID)
