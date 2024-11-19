extends Node

var dollars = 0
signal money_updated(new_amount)  # Declare the signal

func _ready():
	load_money()  # Load money when the game starts
	update_money_display()

func _exit_tree():
	save_money()  # Save money when the game ends or scene changes
	
# Save money to file
func save_money():
	var file = FileAccess.open("res://save_data/save_file.dat", FileAccess.WRITE)  # Open the file for writing
	if file:
		file.store_var(dollars)
		file.close()

# Load money from file
func load_money():
	var file = FileAccess.open("res://save_data/save_file.dat", FileAccess.READ)  # Open the file for reading
	if file:
		dollars = file.get_var()
		file.close()
	else:
		print("No save file found or failed to load.")

func _on_clicking_area_money_earned(amount: Variant) -> void:
	dollars+= amount
	print(dollars)
	update_money_display()

# Function to update the money displayed on the label
func update_money_display():
	emit_signal("money_updated", dollars)  # Emit signal to update money
