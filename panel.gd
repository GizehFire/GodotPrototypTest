extends Panel

var dragging = false
var drag_offset = Vector2.ZERO

func _ready():
	# Setze das Panel für die Mausinteraktion
	self.mouse_filter = Control.MOUSE_FILTER_PASS
	# Erstelle ein Label und füge es dem Panel hinzu
	size=Vector2(200,100)
	var label = Label.new()
	label.text = "Verschiebbares Panel"
	label.position = Vector2(10, 10)  # Setze die Position des Labels im Panel
	add_child(label)  # Füge das Label dem Panel hinzu
	call_deferred("Raender")
	
func Raender() -> void:
	
	# Greife auf die Node zwei Ebenen über der aktuellen Node zu
	var target_node = $"../../"
	#var farbe_rect = $"../../farberect"
	var farbe_rect = get_node("/root/main/@SubViewportContainer@3/@SubViewport@2/scene1/FarbeRect")  # Passe den Pfad entsprechend deiner Scene-Hierarchie an
	
	print("Frabe: ",farbe_rect.color)
	farbe_rect.color = "#154545"
	
	#var target_colorRect_node = $ColorRect
	
	if target_node and target_node.name == "SubBereich":
		# Beispiel: Zugriff auf eine Positionseigenschaft von SubBereich
		var sub_bereich_position = target_node.position
		print("Position von SubBereich: ", sub_bereich_position)
		
		# Beispiel: Setze eine neue Position
		target_node.position
		print("Neue Position von SubBereich: ", target_node.position)
	else:
		print("Fehler: Node SubBereich nicht gefunden oder falsch referenziert.")
	
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Starte das Ziehen
				dragging = true
				drag_offset = event.position
			else:
				# Stoppe das Ziehen
				dragging = false
	
	if event is InputEventMouseMotion and dragging:
		# Aktualisiere die Position des Panels basierend auf der Mausbewegung
		position += event.position - drag_offset
