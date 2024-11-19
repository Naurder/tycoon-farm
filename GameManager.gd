extends Node

var dollars = 0
signal money_updated(new_amount)  # Declare the signal

func _ready():
	load_money()  # Load money when the game starts
	emit_signal("money_updated", dollars)  # Emit signal to update money

func _exit_tree():
	save_money()  # Save money when the game ends or scene changes



# Saves money
func save_money():
	print("Save_money")
	var file = FileAccess.open("res://save_data/save_file.dat", FileAccess.WRITE)  # Use user:// path to save in a portable location
	if file:
		file.store_var(dollars)
		file.close()
		print("Money saved: " + str(dollars))  # Debugging line
	else:
		print("Failed to save money!")  # Debugging line

# Loads money
func load_money():
	var file = FileAccess.open("res://save_data/save_file.dat", FileAccess.READ)  # Open the file for reading
	if file:
		dollars = file.get_var()
		file.close()
	else:
		print("No save file found or failed to load.")

# Updates money
func update_money(amountGained: Variant):
	dollars+= amountGained
	emit_signal("money_updated", dollars)  # Emit signal to update money



#signal from ClickingArea which gives us 1$
func _on_clicking_area_money_earned(amount: Variant) -> void:
	update_money(amount)
	print("Gained: $", amount)


func _on_shop_panel_money_updated(new_amount: Variant) -> void:
	update_money(new_amount)
