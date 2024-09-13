extends Node2D

const MAX_WIDTH = 400  # Maximale Breite der ersten Szene (Weißer Bereich)
const MAX_HEIGHT = 600  # Maximale Höhe der ersten Szene

func _ready():
	# Erstelle das erste unabhängige Fenster in scene1
	var window1 = Window.new()
	window1.title = "Fenster 1"
	window1.position = Vector2i(50, 50)  # Anfangsposition
	window1.size = Vector2i(200, 200)  # Größe des Fensters

	# Erstelle einen Button im ersten Fenster
	var button1 = Button.new()
	button1.text = "Button im Fenster 1"
	button1.position = Vector2(20, 20)
	window1.add_child(button1)

	# Begrenzung der Fensterbewegung durch das korrekte Signal 'input_event'
	window1.connect("input_event", Callable(self, "_on_window_input").bind(window1))
	get_tree().root.call_deferred("add_child", window1)
	window1.show()

func _on_window_input(window, event):
	if event is InputEventMouseMotion and event.button_mask & MOUSE_BUTTON_MASK_LEFT:
		# Berechne die neue Position basierend auf Bewegung
		var new_pos = window.position + event.relative

		# Begrenzungen setzen, damit das Fenster innerhalb der ersten Szene bleibt
		new_pos.x = clamp(new_pos.x, 0, MAX_WIDTH - window.size.x)  # Begrenzung auf 400 Pixel Breite
		new_pos.y = clamp(new_pos.y, 0, MAX_HEIGHT - window.size.y)  # Begrenzung auf 600 Pixel Höhe
		
		# Setze die begrenzte Position
		window.position = new_pos
