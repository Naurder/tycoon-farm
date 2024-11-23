extends Area2D

signal money_earned(amount)

func _ready() -> void:			#entry
	set_process_input(true)
	set_process(true)

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# Check if the event is a mouse button event
	if event is InputEventMouseButton:
		# If the left mouse button is clicked
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# Emit the signal to increase money by 1
			emit_signal("money_earned", 1)
