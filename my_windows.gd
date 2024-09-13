extends Window


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#draggable = true
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if position.x >= (400-size.x):
		print("ueber 400")

	
	pass
