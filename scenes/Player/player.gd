extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true
@export var max_speed = 500
var speed = max_speed
# custom signals
signal laser_signal(pos,dir)
signal grenade_signal(pos,dir)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# get the input and movement
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	# rotation of player
	look_at(get_global_mouse_position())
	
	# get laser shooting input
	var player_dir = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary action") and can_laser:
		# randomly select laser start
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		# emit the position we selected
		laser_signal.emit(selected_laser.global_position, player_dir)
		$GPUParticles2D.emitting = true
		$LaserTimer.start()
	# grenade input
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		var grenade_markers = $LaserStartPositions.get_children()
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
		can_grenade = false
		grenade_signal.emit(selected_grenade.global_position,player_dir)
		$GrenadeTimer.start()
	


func _on_laser_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true
