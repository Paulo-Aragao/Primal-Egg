extends Area2D

#vars
var selected = false
var last_position = Vector2()
var final_position = Vector2()
const SMOOTH_SPEED = 4
const speed = 1.3#2 is max value
var repos = Vector2()
var repos_velo = Vector2()
var MY_GROUP = "Unity"

func _ready():
	last_position = get_position()
	final_position = get_position()
	$RigidBody2D/AnimatedSprite.play("Idle")
var moving = false
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if(selected):
			moving  = true
			final_position.y = get_global_mouse_position().y-50
			final_position.x = get_global_mouse_position().x-15
			if final_position.y+ 50 > get_position().y :
				$RigidBody2D/AnimatedSprite.play("Walk")
			else:
				$RigidBody2D/AnimatedSprite.play("Walk_b")
	if (last_position == (get_position()*-1)) or (int(get_position().x) == int(final_position.x)) and (int(get_position().y) == int(final_position.y)):
		$RigidBody2D/AnimatedSprite.play("Idle")
		moving = false
	if(moving):
		var mpos = final_position
		var destination = get_position()
		repos.x = mpos.x - destination.x
		repos.y = mpos.y - destination.y
		repos_velo.x = repos.x * delta * SMOOTH_SPEED
		repos_velo.y = repos.y * delta * SMOOTH_SPEED 
		repos_velo = repos_velo.normalized() * speed
		self.position.x += repos_velo.x
		self.position.y += repos_velo.y
		last_position = self.position
		
func _on_Button_button_down():
	#deve ser chamada em todas as unidades do jogo
	get_tree().call_group_flags(2, MainScp.GROUP_WARRIORS, "deselected")
	get_tree().call_group_flags(2, MainScp.GROUP_ERICA, "deselected")
	MainScp.unity_selected = "Native"
	selected = true
	$RigidBody2D/SptSelection.visible = true
	
func deselected():
	selected = false
	$RigidBody2D/SptSelection.visible = false

func _on_Native_area_entered(area):
	if area.is_in_group(MainScp.GROUP_FRUITS):
		$RigidBody2D/AnimatedSprite.play("Fruit")
	elif area.is_in_group(MainScp.GROUP_FISHS):
		$RigidBody2D/AnimatedSprite.play("Fish")
		
func _on_Native_area_exited(area):
	if area.is_in_group(MainScp.GROUP_FRUITS):
		$RigidBody2D/AnimatedSprite.play("Idle")
	elif area.is_in_group(MainScp.GROUP_FISHS):
		$RigidBody2D/AnimatedSprite.play("Idle")

