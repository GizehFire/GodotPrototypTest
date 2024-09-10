extends Node

# Funktion zum Erstellen und Anzeigen eines neuen, separaten Fensters
func create_new_window(title: String, position: Vector2i, size: Vector2i, start_time: int):
	var new_window = Window.new()
	new_window.title = title
	new_window.position = position
	new_window.size = size
	
	# Füge ein Label als Inhalt zum Fenster hinzu
	var label = Label.new()
	label.text = "Dies ist das Fenster: " + title
	label.position = Vector2(10, 10)
	
	# Füge das Label dem Fenster hinzu
	new_window.add_child(label)
	
	# Zeige das Fenster an
	new_window.show()
	
	# Füge das neue Fenster zum Root-Viewport hinzu, verzögert, um den Fehler zu vermeiden
	get_tree().get_root().call_deferred("add_child", new_window)

	# Messung der Verzögerung nach dem Hinzufügen des Fensters
	var end_time = Time.get_ticks_msec()  # Verwende Time.get_ticks_msec() anstelle von OS.get_ticks_msec()
	var delay = end_time - start_time
	print("Verzögerung für Fenster '", title, "': ", delay, " ms")

# Funktion zum Erstellen von zwei getrennten Fenstern
func create_two_windows():
	var start_time = Time.get_ticks_msec()  # Startzeit festlegen
	create_new_window("Fenster 1", Vector2i(100, 100), Vector2i(300, 200), start_time)
	create_new_window("Fenster 2", Vector2i(500, 100), Vector2i(300, 200), start_time)

func _ready():
	# Rufe die Funktion zum Erstellen der beiden Fenster auf
	create_two_windows()
