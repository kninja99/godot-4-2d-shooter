extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/Projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/Projectiles/grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_player_laser_signal(pos,dir):
	var laser = laser_scene.instantiate() as Area2D
	laser.rotation_degrees = rad_to_deg(dir.angle()) + 90
	laser.direction = dir
	# update laser position
	laser.position = pos
	$Projectiles.add_child(laser)


func _on_player_grenade_signal(pos,dir):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = dir * grenade.speed
	$Projectiles.add_child(grenade)
