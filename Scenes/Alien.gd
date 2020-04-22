extends Area2D
var final_position = Vector2(474,132)
var speed = 4
var repos = Vector2()
var repos_velo = Vector2()

var life_points = 10
func get_position_():
	return get_position()
func _ready():
	speed = 0.1
	add_to_group(MainScp.GROUP_ALIENS)
	pass # Replace with function body.

func _process(delta):
	if(get_position() != final_position):
		var mpos = final_position
		var destination = get_position()
		repos.x = mpos.x - destination.x
		repos.y = mpos.y - destination.y
		repos_velo.x = repos.x * delta * speed
		repos_velo.y = repos.y * delta * speed
		#repos_velo = repos_velo.normalized()
		self.position.x += repos_velo.x
		self.position.y += repos_velo.y
		#move(repos_velo)	
		
func died():
	queue_free()

func _on_Alien_area_entered(area):
	if area.is_in_group(MainScp.GROUP_ARROWS):
		life_points -= 1
		if life_points <=  0:
			died()
