extends Node2D

export(NodePath) var nodeToFollowPath

var nodeToFollow = Node
var xOffset = 0.0
var yPos = 0.0

func _ready():
	var pos = get_pos()
	set_process( true )
	
	nodeToFollow = get_node( nodeToFollowPath )
	xOffset      = pos.x - nodeToFollow.get_pos().x
	yPos         = pos.y

func _process( delta ):
	set_pos( Vector2( nodeToFollow.get_pos().x + xOffset, yPos ) )