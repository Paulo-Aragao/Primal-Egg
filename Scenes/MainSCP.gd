extends Node2D


var natives
const GROUP_FRUITS = "Fishs"
const GROUP_FISHS = "Fruits"
const GROUP_ALIENS = "Aliens"
const GROUP_WARRIORS = "Warriors"
const GROUP_ARROWS = "Arrows"
#variables of alien Control

var time_interval_alein_spawn_max
var time_interval_alein_spawn_min

var unity_selected = "NORTHING"
func _ready():
	time_interval_alein_spawn_max = 30
	time_interval_alein_spawn_min = 200
	load("res://Scenes/Native.gd")
	natives = get_tree().get_nodes_in_group("Natives")


func was_selected_unity():
	return true


	
