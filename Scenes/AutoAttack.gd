extends Area2D
#extends "WarrIor.gd"
var targets
var time
var col_size
var col_size_2 
var transform_
func _ready():
	add_to_group(MainScp.GROUP_WARRIORS)
	transform_ = $CollisionShape2D.get_shape()
	col_size = transform_.get_radius()
	col_size_2 = 0.0
	time =0
	pass # Replace with function body.
# warning-ignore:unused_argument
func _process(delta):
	if time > 60:
		transform_.set_radius(col_size_2)
		col_size_2 = col_size
		col_size = transform_.get_radius()
		time = 0
		if is_instance_valid(targets) and targets.name != "Warrior":
			get_parent().get_node(".").shoot(targets.get_position())
	time +=1

func _on_AutoAttack_area_entered(area):
	if area.is_in_group(MainScp.GROUP_ALIENS):
		if !is_instance_valid(targets) or targets.name == "Warrior":
			targets = area
