extends Marker3D

@export_range(0,1,0.01) var mouseSensitivity = 0.02
var middleButtonPressed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	print("sdds")
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MIDDLE:
			if event.pressed:
				middleButtonPressed = true
			else:
				middleButtonPressed = false
	
	if event is InputEventMouseMotion and middleButtonPressed:
#		var yRad = event.relative.y * mouseSensitivity
#		transform.basis = transform.basis.rotated(Vector3.RIGHT, yRad)
		var xRad = -event.relative.x * mouseSensitivity
		transform.basis = transform.basis.rotated(Vector3.UP, xRad)
		
#		rotation.x = (clamp(rotation.x,deg_to_rad(-85),deg_to_rad(30)))
#		rotation_degrees.z = 0
		print(rotation_degrees)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
