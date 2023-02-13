extends Node3D

@onready var gridMap = $GridMap
var selected_mesh_id: int = -1
var last_used_pos: Vector3i
var is_mesh_selected: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
#	add_mesh_in_map()
	pass # Replace with function body.

func add_mesh_in_map(mesh_id: int):
	var last_pos = gridMap.get_used_cells().pop_back()
	var new_pos = last_pos + Vector3i(1, 0, 0) if last_pos != null else Vector3.ZERO
	selected_mesh_id = mesh_id
	last_used_pos = new_pos
	is_mesh_selected = true
	gridMap.set_cell_item(new_pos, mesh_id)

func move_key_pressed(key):
	if is_mesh_selected:
		match key:
			"w":
				gridMap.set_cell_item(last_used_pos, -1)
				last_used_pos += Vector3i(0, 0, -1)
				gridMap.set_cell_item(last_used_pos, selected_mesh_id)
			"s":
				gridMap.set_cell_item(last_used_pos, -1)
				last_used_pos += Vector3i(0, 0, 1)
				gridMap.set_cell_item(last_used_pos, selected_mesh_id)
			"a":
				gridMap.set_cell_item(last_used_pos, -1)
				last_used_pos += Vector3i(-1, 0, 0)
				gridMap.set_cell_item(last_used_pos, selected_mesh_id)
			"d":
				gridMap.set_cell_item(last_used_pos, -1)
				last_used_pos += Vector3i(1, 0, 0)
				gridMap.set_cell_item(last_used_pos, selected_mesh_id)
			_:
				print("default is also printing")

# Called every frame. 'delta' is the elapsed time since the previous frame.
