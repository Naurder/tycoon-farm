extends Node


var dollars = 0
var passive_income = 0			#passive income / second
signal money_updated(new_amount)  # Declare the signal


func _ready():	#entry
	load_money()  # Load money when the game starts
	emit_signal("money_updated", dollars)  # Emit signal to update money

	print("Game is ready, passive income timer is running.")


func _exit_tree():
	save_money()  # Save money when the game ends or scene changes


################ CORE FUNCTIONS ##########################
# Saves money to file
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


#						#########signals###########
#signal from ClickingArea which gives us 1$
func _on_clicking_area_money_earned(amount: Variant) -> void:
	update_money(amount)
	print("Gained: $", amount)


#signal from ShopPanel.gd		bough animal, money reduced
func _on_shop_panel_money_updated(new_amount: Variant, animal_ID: Variant, passive_Income: Variant) -> void:
	update_money(new_amount)
	passive_income += passive_Income
	


#call 1/s     to update passive income
func _on_timer_timeout() -> void:
	#print("one second elapsed and this is passive income", passive_income)
	update_money(passive_income)
