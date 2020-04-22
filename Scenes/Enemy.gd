extends Node2D

func _ready():
	$StaticBody2D/AnimatedSprite.play("Idle")
func _process(delta):
	pass	
func _on_Button_button_down():
	$StaticBody2D/SptSelection.visible = true
