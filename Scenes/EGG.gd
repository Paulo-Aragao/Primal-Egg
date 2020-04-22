extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var r = 10
# warning-ignore:unused_argument
func _process(delta):
# warning-ignore:integer_division
	if (OS.get_ticks_msec()/1000)%10 == 0 and  not $AnimatedSprite.playing:
		r = randi() % 1000
		if r == 34:
			$AnimatedSprite.play("See")


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.play("Idle")
	$AnimatedSprite.playing = false
