extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color = "#334455"
	print("Node: ",get_path())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
