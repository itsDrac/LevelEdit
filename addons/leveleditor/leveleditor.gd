@tool
extends EditorPlugin
class_name LevelEditor

const CG = preload("res://addons/leveleditor/customgizmo.gd")

var customGizmo = CG.new()

func _enter_tree():
	# Initialization of the plugin goes here.
	add_node_3d_gizmo_plugin(customGizmo)


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_node_3d_gizmo_plugin(customGizmo)
