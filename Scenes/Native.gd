extends Area2D

#vars
var selected = false
var current_position = get_position()
var final_position = get_position()
###
#corrotine verification
var corr_verrification
#variavei de contador de resumo de corrotina
var time_corr = 0.0

const SMOOTH_SPEED = 4
var repos = Vector2()
var repos_velo = Vector2()
func _ready():
	time_corr = 0.0
	#corr_verrification = selected_verification(NAN)
	#corr_verrification.resume()
	add_to_group("Natives")
	current_position = get_position()
	final_position = get_position()
	$RigidBody2D/AnimatedSprite.play("Idle")
# warning-ignore:unused_argument
func get_selected():
	return selected;

var velocity = Vector2()
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if(selected):
			final_position = get_global_mouse_position()
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
		
func _on_Button_button_down():
	#deve ser chamada em todas as unidades do jogo
	get_tree().call_group_flags(2, MainScp.GROUP_WARRIORS, "deselected")
	get_tree().call_group_flags(2, "Natives", "deselected")
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
