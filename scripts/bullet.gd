extends RigidBody2D

class_name Bullet

var viewportRect: Rect2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewportRect = get_viewport_rect()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if position.x > viewportRect.size.x:
		queue_free()

	elif position.y > viewportRect.size.y:
		queue_free()

	elif position.x < 0:
		queue_free()

	elif position.y < 0:
		queue_free()

		
