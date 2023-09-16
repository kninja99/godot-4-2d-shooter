extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_gate_player_entered_gate(body):
	print("player has entered the gate")
	print(body)


func _on_player_laser_signal():
	print("Laser from level")


func _on_player_grenade_signal():
	print("grenade from level")
