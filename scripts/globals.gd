extends Node

var currentScene = Node
var root = Node #?????
var scenes = {}

func setScene( scene ):
	currentScene.queue_free()
	root.add_child( scenes[scene] )

func _ready():
	root         = get_tree().get_root()
	currentScene = root.get_child( root.get_child_count() - 1 )
	
	scenes["main"] = ResourceLoader.load( "res://scenes/main.xscn" ).instance()