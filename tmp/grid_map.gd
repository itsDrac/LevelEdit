extends GridMap


# Called when the node enters the scene tree for the first time.
func _ready():
	set_cell_item(Vector3i(0,1,0),1)
	print(get_used_cells())
	var lib = mesh_library
	print(lib.get_item_name(1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
