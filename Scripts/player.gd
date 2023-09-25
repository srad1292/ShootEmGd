extends Node2D

signal damage_taken



func _on_area_2d_area_entered(area):
	if area.is_in_group("Enemy"):
		print("Player hit by enemy")
		damage_taken.emit()


func _on_hud_game_over():
	$Weapon.disable_weapon()
	


func _on_hud_restart_game():
	$Weapon.enable_weapon()
