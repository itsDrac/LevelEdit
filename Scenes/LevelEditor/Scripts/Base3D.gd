extends Node3D

@onready var previewGridMap: GridMap = $PreviewGridMap
@onready var finalGridMap: GridMap = $FinalGridMap

signal mesh_changed(mesh)

var selected_mesh_id: int = -1
var last_used_pos: Vector3i
var is_mesh_selected: bool = false
var z_value: Vector3i = Vector3i(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	mesh_changed.connect(gridmap_mesh_change)

func add_mesh_in_map(mesh_id: int):
	var new_pos: Vector3i = Vector3i(0,0,0) + z_value
	selected_mesh_id = mesh_id
	last_used_pos = new_pos
	is_mesh_selected = true
	previewGridMap.set_cell_item(new_pos, mesh_id)

func move_key_pressed(key: StringName):
	if is_mesh_selected:
		match key:
			"w":
				previewGridMap.set_cell_item(last_used_pos, -1)
				last_used_pos += Vector3i(0, 0, -1)
				previewGridMap.set_cell_item(last_used_pos, selected_mesh_id)
			"s":
				previewGridMap.set_cell_item(last_used_pos, -1)
				last_used_pos += Vector3i(0, 0, 1)
				previewGridMap.set_cell_item(last_used_pos, selected_mesh_id)
			"a":
				previewGridMap.set_cell_item(last_used_pos, -1)
				last_used_pos += Vector3i(-1, 0, 0)
				previewGridMap.set_cell_item(last_used_pos, selected_mesh_id)
			"d":
				previewGridMap.set_cell_item(last_used_pos, -1)
				last_used_pos += Vector3i(1, 0, 0)
				previewGridMap.set_cell_item(last_used_pos, selected_mesh_id)
			"set":
				finalGridMap.set_cell_item(last_used_pos,selected_mesh_id)
				previewGridMap.clear()
			"r":
				previewGridMap.clear()
				finalGridMap.clear()
			_:
				print("default is also printing")

func gridmap_mesh_change(mesh: MeshLibrary):
	previewGridMap.mesh_library = mesh
	finalGridMap.mesh_library = mesh

