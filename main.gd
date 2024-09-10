extends Node2D

var position_label  # Deklaration des Labels für die Anzeige der Mausposition

# Funktion zur Ermittlung und Ausgabe der Mausposition
func get_mouse_position():
	var mouse_pos = get_viewport().get_mouse_position()  # Ermittelt die Position der Maus im Viewport
	print("Mausposition: ", mouse_pos)
	return mouse_pos  # Gibt die Mausposition als Vector2 zurück

func center_label(label: Label):
	# Wandelt die Viewport-Größe korrekt zu Vector2 um
	var viewport_size = Vector2(get_viewport().get_size().x, get_viewport().get_size().y)
	var label_size = label.get_size()  # Ermittelt die Größe des Labels
	# Berechnet die Position, um das Label im Viewport zu zentrieren
	label.position = (viewport_size - label_size) / 2
	# Funktion zum Erstellen und Anzeigen eines neuen Fensters

# Funktion zum Erstellen und Anzeigen eines neuen, separaten Fensters
func create_new_window():
	# Erstelle ein neues Window-Objekt
	var new_window = Window.new()
	new_window.title = "Neues Fenster"
	new_window.min_size = Vector2i(400, 300)  # Setze die Mindestgröße des neuen Fensters
	
	# Erstelle einen SubViewportContainer und SubViewport, um Inhalte hinzuzufügen
	var viewport_container = SubViewportContainer.new()
	var sub_viewport = SubViewport.new()
	sub_viewport.size = new_window.min_size
	
	# Füge das SubViewport dem Container hinzu und Container dem Fenster
	viewport_container.add_child(sub_viewport)
	new_window.add_child(viewport_container)
	
	# Füge ein Label zum SubViewport hinzu
	var label = Label.new()
	label.text = "Dies ist ein separates Fenster!"
	label.position = Vector2(10, 10)
	sub_viewport.add_child(label)
	
	# Zeige das neue Fenster an
	new_window.show()
	
	# Füge das neue Fenster zum Haupt-Viewport hinzu
	get_tree().get_root().add_child(new_window)
	
	# Zeige das neue Fenster an
	new_window.show()
	
	# Füge das neue Fenster zum Viewport hinzu
	get_tree().get_root().add_child(new_window)

func _ready() -> void:
	var viewport_size = get_viewport().get_size()
	var MSG_Text = Label.new()	
	MSG_Text.text = "Willkommen"	
	add_child(MSG_Text)
# Erstelle und positioniere das Label
	position_label = Label.new()
	position_label.position = Vector2(10, 10)  # Positioniere das Label an einer sichtbaren Stelle
	add_child(position_label)  # Füge das Label der Szene hinzu
	center_label(MSG_Text)
	
	# Starte das kontinuierliche Update der Mausposition
	set_process(true)
	
	create_new_window()
	
	print("Aktuelle Fenstergröße: ", viewport_size)
	print("Breite: ", viewport_size.x, "Höhe: ", viewport_size.y)
	# Beispiel für die Verwendung der Funktion
	var position = get_mouse_position()
	print("Aktuelle Mausposition: ", position)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Aktualisiere die Mausposition im Label in jedem Frame
	var mouse_pos = get_viewport().get_mouse_position()
	position_label.text = "Mausposition: (" + str(mouse_pos.x) + ", " + str(mouse_pos.y) + ")"
