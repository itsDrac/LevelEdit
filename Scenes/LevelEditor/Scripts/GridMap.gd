extends GridMap


# Called when the node enters the scene tree for the first time.
func _ready():
	mesh_library = preload("res://Scenes/LevelEditor/Assests/Scenes/Platformer.meshlib")

func _input(event):
	if event is InputEventMouseMotion:
		print(event.position)
		print(map_to_local(Vector3(event.position.x, event.position.y,0))/8)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
