extends Node2D

@export var food : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	# Generate 100 foods
	for i in 100:
		# Instanciate food
		var f = food.instantiate()
		# Add food as a child node
		add_child(f)
		randomize()
		# Set the position of the generated food
		f.position.x = randi_range(-2000, 2000)
		f.position.y = randi_range(-2000, 2000)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
