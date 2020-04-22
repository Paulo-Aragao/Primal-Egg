extends Position2D
export (PackedScene) var spawn_scene
onready var spawn_reference = load(spawn_scene.get_path())

export (NodePath) var timer_path
onready var time_node = get_node(timer_path)


func _ready():
	$Sprite.visible = false
	randomize()
	time_node.set_wait_time(rand_range(MainScp.time_interval_alein_spawn_min,MainScp.time_interval_alein_spawn_max))
	time_node.start()

func _on_Timer_timeout():
	var spawn_instance = spawn_reference.instance()
	get_parent().add_child(spawn_instance)
	spawn_instance.position = self.position
	time_node.set_wait_time(rand_range(MainScp.time_interval_alein_spawn_min,MainScp.time_interval_alein_spawn_max))
	time_node.start()
	pass # Replace with function body.
