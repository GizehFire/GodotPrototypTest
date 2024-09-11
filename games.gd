extends Node2D

var main_scene

func _ready():
	# Lade die Hauptszene (main.tscn)
	main_scene = load("res://main.tscn").instantiate()

	# Erstelle einen Button zum Wechseln zur main Szene
	var switch_button = Button.new()
	switch_button.text = "Zurück zu main.tscn"
	switch_button.position = Vector2(200, 100)
	switch_button.size = Vector2(200, 50)  # Setze die Größe des Buttons
	switch_button.set_anchors_preset(Control.PRESET_TOP_WIDE)  # Setze die Anker, um den Button oben zu positionieren und zu skalieren
	switch_button.connect("pressed", Callable(self, "_on_switch_button_pressed"))
	add_child(switch_button)

func _on_switch_button_pressed():
	# Wechsle zurück zur main Szene
	get_tree().root.call_deferred("add_child", main_scene)  # Füge die Hauptszene hinzu
	call_deferred("queue_free")  # Entferne die aktuelle Szene verzögert, um Konflikte zu vermeiden
