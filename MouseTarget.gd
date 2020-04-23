extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(MainScp.GROUP_M_TARGET)
	$AnimatedSprite.play("default")
	$Timer.connect("timeout", self, "queue_free")
	$Timer.set_wait_time(1.2)
	$Timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
