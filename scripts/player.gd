extends Area2D


signal shoot

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func faceMouse() -> void:
	var mousePos: Vector2 = get_global_mouse_position()
	
		
	look_at(mousePos)
	rotation += deg_to_rad(90)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	faceMouse()	
	
	if Input.is_action_just_pressed("Shoot"):
		emit_signal("shoot")
	
		
		
