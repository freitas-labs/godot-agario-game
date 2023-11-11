extends Node2D

var size = 1.0
var zoom = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$MeshInstance2D.scale.x = lerp($MeshInstance2D.scale.x, size, 0.1)
	$MeshInstance2D.scale.y = lerp($MeshInstance2D.scale.y, size, 0.1)
	
	# Movement of the player
	if Input.is_action_pressed("ui_right"): position.x += 5
	if Input.is_action_pressed("ui_left"): position.x -= 5
	if Input.is_action_pressed("ui_down"): position.y += 5
	if Input.is_action_pressed("ui_up"): position.y -= 5
	
	# Movement of the camera
	$Camera2D.zoom.x = lerp($Camera2D.zoom.x, zoom, 0.1)
	$Camera2D.zoom.y = lerp($Camera2D.zoom.y, zoom, 0.1)
	
	# Get all foods present in the map
	var foods = get_tree().get_nodes_in_group("Food")
	
	for food in foods:
		# If player overlaps food
		if $MeshInstance2D/Area2D.overlaps_area(food):
			# If size of food is smaller than the size of the player
			if food.size < size:
				# Remove food
				food.queue_free()
				# Increase payer size
				size += 0.2
				# Update zoom
				if zoom > 0.75:
					zoom -= 0.04
				else:
					zoom -= 0.01
