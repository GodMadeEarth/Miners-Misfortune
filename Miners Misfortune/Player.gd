extends CharacterBody2D

var audio = [load("res://SFX_FS_Dirt_01.wav"),load("res://SFX_FS_Dirt_02.wav"),load("res://SFX_FS_Dirt_03.wav")]
var audioPlayer = AudioStreamPlayer.new()

func _ready():
		add_child(audioPlayer)

func _physics_process(_delta):
	move_logic()
	if Input.is_key_pressed(KEY_R) : get_tree().reload_current_scene()

func move_logic():
	velocity = Vector2.ZERO
	
	if Input.is_key_pressed(KEY_W) : velocity.y -= 1
	if Input.is_key_pressed(KEY_S) : velocity.y += 1
	if Input.is_key_pressed(KEY_A) : velocity.x -= 1
	if Input.is_key_pressed(KEY_D) : velocity.x += 1
	
	if Input.is_key_pressed(KEY_UP) : velocity.y -= 1
	if Input.is_key_pressed(KEY_DOWN) : velocity.y += 1
	if Input.is_key_pressed(KEY_LEFT) : velocity.x -= 1
	if Input.is_key_pressed(KEY_RIGHT) : velocity.x += 1
	
	velocity *= 50
	move_and_slide()
	
	if velocity != Vector2.ZERO and not audioPlayer.playing:
		$Sprite2D.frame = int(!bool($Sprite2D.frame))
		audioPlayer.stream = audio.pick_random()
		audioPlayer.volume_db = -10
		audioPlayer.play()
