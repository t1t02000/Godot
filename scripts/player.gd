extends CharacterBody2D

var speed = 120
var direccion = 0.0
var jump = 250
const gravity = 9

@onready  var anim = $AnimationPlayer
@onready var sprite = $Sprite2D

func _physics_process(delta):
	motion_ctrl()
	
func motion_ctrl() -> void:
	direccion = Input.get_axis("ui_left", "ui_right")
	velocity.x = direccion * speed
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y -= jump
		
		
	if direccion != 0:
		anim.play("correr")
	else:
		anim.play("idle")
	
	
	sprite.flip_h = direccion < 0 if direccion != 0 else sprite.flip_h
	
	if not is_on_floor():
		anim.play("jump")
		anim.play("caer")
	if !is_on_floor():
		velocity.y += gravity
	
	move_and_slide()
	
#func add_Coin():
	#var canvaslayer = get_tree().get_root().get_node_or_null("CanvasLayer")  # Ajusta la ruta según la ubicación de tu CanvasLayer en la jerarquía
	
	#canvaslayer.on_coin_collected()
