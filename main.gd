extends Node2D

func _ready():
	# Zugriff auf die Root-Node und alle Child-Nodes durchlaufen
	list_all_nodes(get_tree().root)  # Beginne beim Root-Node

func list_all_nodes(node):
	print(node.name)  # Gibt den Namen jeder Node aus
	for child in node.get_children():
		list_all_nodes(child)  # Rekursiver Aufruf für alle Kind-Nodes
	
	var scene_size = Vector2(400, 600)
	
	# Erstelle den ersten SubViewport und seinen Container
	var viewport_container1 = SubViewportContainer.new()
	var viewport1 = SubViewport.new()
	viewport1.size = scene_size  # Setze die Größe des Viewports auf die Größe der Szene
	viewport1.render_target_update_mode = SubViewport.UPDATE_ALWAYS  # Ständig aktualisieren
	viewport_container1.add_child(viewport1)
	add_child(viewport_container1)
	
	# Lade und füge die erste Szene hinzu
	var scene1 = load("res://scene1.tscn").instantiate()
	viewport1.add_child(scene1)  # Szene wird in den SubViewport geladen
	
	# Setze die Position des ersten Containers
	viewport_container1.position = Vector2(0, 0)
	
	# Erstelle den zweiten SubViewport und seinen Container
	var viewport_container2 = SubViewportContainer.new()
	var viewport2 = SubViewport.new()
	viewport2.size = scene_size  # Setze die Größe des Viewports auf die Größe der Szene
	viewport2.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	viewport_container2.add_child(viewport2)
	add_child(viewport_container2)
	
	# Lade und füge die zweite Szene hinzu
	var scene2 = load("res://scene2.tscn").instantiate()
	viewport2.add_child(scene2)  # Szene wird in den SubViewport geladen
	
	# Setze die Position des zweiten Containers direkt rechts neben dem ersten
	viewport_container2.position = Vector2(scene_size.x, 0)  # Positioniert den zweiten Container rechts neben dem ersten
