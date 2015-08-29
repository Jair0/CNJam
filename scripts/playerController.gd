extends RigidBody2D

export( int, 100 ) var playerSpeed
export( float, 0.0, 10.0, 0.1 ) var flyForce

# Child Nodes
var sprite = Sprite
var collisionShape = CollisionShape2D
var animations = AnimationPlayer

# Properties
var isMousePressed = false

func _ready():
	sprite = get_node( "Sprite" )
	collisionShape = get_node( "CollisionShape" )
	animations = get_node( "Animations" )
	
	# Starting Animation
	animations.play( "Fly" )
	
	set_fixed_process( true )
	set_process_input( true )

func _fixed_process( delta ):
	apply_impulse( Vector2( 0.0, 0.0 ), Vector2( playerSpeed * delta , 0.0 ) )
	
	if isMousePressed:
		apply_impulse( Vector2( 0.0, 0.0 ), Vector2( 0.0, -flyForce ) )


func _input( event ):
	if event.type == InputEvent.MOUSE_BUTTON:
		isMousePressed = event.pressed