extends Node2D

@export var bulletScene: PackedScene
@export var enemyScene: PackedScene

var score: int = 0

var viewportRect;

#var shotBullets: Array[PackedScene] = [] 
var spawnedEnemies: Array[Area2D] = []

var deltaTime: float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewportRect = get_viewport_rect()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var scoreText: String = "Score:  "[score]
	print(scoreText)
	
	deltaTime = delta
	
	var viewportRectOffset: float = 100
	
	for enemy in spawnedEnemies:
		if enemy.position.x > (viewportRect.size.x + viewportRectOffset):
			enemy.queue_free()
			spawnedEnemies.erase(enemy)
			print("removed enemy because it went out of screen")
			
		elif enemy.position.y > (viewportRect.size.y + viewportRectOffset):
			enemy.queue_free()
			spawnedEnemies.erase(enemy)
			print("removed enemy because it went out of screen")
		
		elif enemy.position.x < (0 - viewportRectOffset):
			enemy.queue_free()
			spawnedEnemies.erase(enemy)
			print("removed enemy because it went out of screen")
		
		elif enemy.position.y < (0 - viewportRectOffset):
			enemy.queue_free()
			spawnedEnemies.erase(enemy)
			print("removed enemy because it went out of screen")
			
			
		
		


func _on_player_shoot() -> void:
	
	var bullet: Bullet = bulletScene.instantiate()
	
	bullet.position = $Player.position
	
	bullet.rotation = $Player.rotation
	
	#bullet.look_at(get_global_mouse_position())
	
	
	#var direction = $Player.position.angle_to(get_global_mouse_position())
	
	var velocity = Vector2(get_global_mouse_position() - $Player.global_position).normalized() * 970
		
	bullet.linear_velocity = velocity
	
	$AudioStreamPlayer2D.play()
	
	
	
	add_child(bullet)
#	shotBullets.append(bullet)
	
func gameOver() -> void: 
	$Player.hide() #hide the player because it got hit
	
	get_tree().reload_current_scene()

func _on_player_area_entered(area: Area2D) -> void:
	gameOver()
	


func _on_enemy_spawn_delay_timeout() -> void:
	var enemy = enemyScene.instantiate()
	
	var enemySpawnPath = $EnemyPath/EnemySpawn
	
	enemySpawnPath.progress_ratio = randf()
	
	enemy.position = enemySpawnPath.position
	
	enemy.look_at($Player.position)
	enemy.rotation += 3.14 #3.14 because 180 degrees in radians is pi
	
	enemy.velocity = ($Player.position - enemy.position).normalized() * 200

	
	add_child(enemy)
	spawnedEnemies.append(enemy)	
	
	
	
	
	
