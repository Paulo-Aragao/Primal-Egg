extends Area2D

#vars
var selected = false
var current_position = get_position()
var final_position = Vector2()


const SMOOTH_SPEED = 4
var repos = Vector2()
var repos_velo = Vector2()

func get_position_():
	return get_position()
func _ready():
	add_to_group("Warriors")
	current_position = get_position()
	final_position = get_position()
	$RigidBody2D/AnimatedSprite.play("Idle")

var velocity = Vector2()
#cooldown shoot
var time = 0
func _process(delta):
	time +=1
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if(selected):
			if MouseCursor.sword.visible:
				final_position = get_position()
				if time > 30:
					time = 0
					shoot(get_global_mouse_position())
			else:
				final_position.y = get_global_mouse_position().y-40
				final_position.x = get_global_mouse_position().x
	if(get_position() != final_position):
		var mpos = final_position
		var destination = get_position()
		repos.x = mpos.x - destination.x
		repos.y = mpos.y - destination.y
		repos_velo.x = repos.x * delta * SMOOTH_SPEED
		repos_velo.y = repos.y * delta * SMOOTH_SPEED
		repos_velo = repos_velo.normalized()
		self.position.x += repos_velo.x
		self.position.y += repos_velo.y
		#move(repos_velo)	
func shoot(target_position):
	var shot = preload("res://Scenes/Arrow.tscn").instance()
	shot.target = target_position
	shot.rotation  = get_angle_to(target_position) 
	shot.position = get_global_position()
	get_parent().add_child(shot)
				
func _on_Button_button_down():
	#deve ser chamada em todas as unidades do jogo
	get_tree().call_group_flags(2, MainScp.GROUP_WARRIORS, "deselected")
	get_tree().call_group_flags(2, MainScp.GROUP_ERICA, "deselected")
	MainScp.unity_selected = "Warrior"
	selected = true
	$RigidBody2D/SptSelection.visible = true
	#corr_verrification.resume()
func deselected():
	selected = false
	$RigidBody2D/SptSelection.visible = false


