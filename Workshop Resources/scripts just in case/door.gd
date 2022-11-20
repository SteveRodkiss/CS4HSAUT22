extends Area2D


#signel sent to the script when a body enters the collision area
func _on_door_body_entered(body: Node) -> void:
	#is it the player
	if body.name == "player":
		#go to next scene
		get_tree().change_scene("res://scenes/win_scene.tscn")
