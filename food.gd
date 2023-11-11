extends Area2D

var size

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	size = randf_range(0.5, 1.5)
	# Set the food size
	$MeshInstance2D.scale = Vector2(size, size)
	$CollisionShape2D.scale = Vector2(size, size)
	# Set the food color
	$MeshInstance2D.modulate = Color8(randi_range(0, 255), randi_range(0, 255), randi_range(0, 255), 255)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
