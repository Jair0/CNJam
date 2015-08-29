extends Node2D

export(NodePath) var playerPath

var player = Node
var hp = ProgressBar
var score = Label

var xOffset = 0.0
var yPos = 0.0
var testBool

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	hp = get_node( "ProgressBar" )
	score = get_node( "Label" )

	hp.set_value(100)

	testBool = true
	
	set_fixed_process(true)
	
	var pos = get_pos()
	
	player = get_node( playerPath )
	xOffset      = pos.x - player.get_pos().x
	yPos         = pos.y
	
	pass

func _fixed_process(delta):

	score.set_text( "texto" )
	print (hp.get_value())
	if hp.get_value() >= 100:
		hp.set_value(99)
		testBool = false
	if hp.get_value() <= 0:
		hp.set_value(1)
		testBool = true

	if testBool:
		hp.set_value( hp.get_value() + delta * 5)
	else:
		hp.set_value( hp.get_value() - delta * 5)
	set_pos( Vector2( player.get_pos().x + xOffset, yPos ) )

	pass

