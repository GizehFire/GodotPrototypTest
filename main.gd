extends Node2D

var main_scene
var games_scene

func _ready():
	# Lade die Hauptszene (main.tscn) und die zweite Szene (games.tscn)
	main_scene = self  # Die aktuelle Szene ist bereits geladen als main_scene
	games_scene = load("res://games.tscn").instantiate()

	# Erstelle einen Button zum Wechseln zur games Szene
	var switch_button = Button.new()
	switch_button.text = "Wechsel zu games.tscn"
	switch_button.position = Vector2(200, 100)
	switch_button.size = Vector2(200, 50)  # Setze die Größe des Buttons
	switch_button.set_anchors_preset(Control.PRESET_TOP_WIDE)  # Setze die Anker, um den Button oben zu positionieren und zu skalieren
	switch_button.connect("pressed", Callable(self, "_on_switch_button_pressed"))
	add_child(switch_button)

func _on_switch_button_pressed():
	# Wechsle zur games Szene
	get_tree().root.call_deferred("add_child", games_scene)  # Füge die games Szene hinzu
	call_deferred("queue_free")  # Entferne die aktuelle Szene verzögert, um Konflikte zu vermeiden
