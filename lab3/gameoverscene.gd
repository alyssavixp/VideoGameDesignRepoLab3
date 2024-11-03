extends Control


func _on_start_over_pressed() -> void:
	get_tree().change_scene_to_file("res://main_game/level_1.tscn")



func _on_tutorial_pressed() -> void:
	pass # Replace with function body.
	


func _on_exit_pressed() -> void:
	get_tree().quit()
