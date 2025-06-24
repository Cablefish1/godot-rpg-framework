extends PopupPanel
class_name ContextMenu



func show_menu(options : Array):
	#removing old buttons
	var old_options = $Options.get_children()
	if old_options != null:
		for old_option in old_options:
			old_option.queue_free()
	if options == null:
		push_error("ERROR: No options passed to menu function!")
		return
	for option in options:
		var button = Button.new()
		button.text = option.name
		button.disabled = not option.enabled
		#Handle arguments if present:
		if option.has("callback") and option.callback is Callable:
			var callable = option.callback
			if option.has("arguments") and typeof(option.arguments) == TYPE_ARRAY:
				callable = callable.bindv(option.arguments)
				
			button.pressed.connect(callable)
		else:
			button.connect("pressed", option.callback)
		$Options.add_child(button)
	popup()
	position = get_viewport().get_mouse_position()
	
#Scriptet her skal lave buttons der refererer tilbage til de actions der kan udføres.
