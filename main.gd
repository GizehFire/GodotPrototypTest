extends Node2D

func _ready():
	
	var OkayButton = Button.new()
	OkayButton.text = "Okay"
	OkayButton.size = Vector2(100,100)
	OkayButton.position = Vector2(800/2, 600/2)
	OkayButton.connect("pressed", Callable(self, "_on_OkayButton_pressed"))
	add_child(OkayButton)
	
	# Erstelle einen Callable und binde einen Parameter
	var callable_instance = Callable(self, "_print_message").bind("Das ist eine Nachricht mit einem Parameter.")
	
	# Rufe die Methode mit dem gebundenen Parameter auf
	callable_instance.call()

func _print_message(message):
	
	print(message)

func _on_OkayButton_pressed():
	
	print("Du hast ein Button gedrueckt")
	
	
