extends Node

@export_range(0,1,0.01) var mouseSensitivity = 0.02
@onready var gimbalX: Marker3D =  $X
@onready var gimbalY: Marker3D =  $X/Y
var middleButtonPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MIDDLE:
			if event.pressed:
				middleButtonPressed = true
			else:
				middleButtonPressed = false
	
	if event is InputEventMouseMotion and middleButtonPressed:
		var yRad = event.relative.y * mouseSensitivity
		var xRad = -event.relative.x * mouseSensitivity
		gimbalY.transform.basis = gimbalY.transform.basis.rotated(Vector3.RIGHT, yRad)
		gimbalX.transform.basis = gimbalX.transform.basis.rotated(Vector3.UP, xRad)
		gimbalY.rotation_degrees.x = clamp(gimbalY.rotation_degrees.x,-75,30)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
