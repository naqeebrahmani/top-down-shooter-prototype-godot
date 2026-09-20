extends Area2D

var velocity: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += velocity * delta
		


func _on_body_entered(body: Node) -> void:
	get_parent().spawnedEnemies.erase(self)
	
	get_parent().score += 1
	
	queue_free()
	body.queue_free()
