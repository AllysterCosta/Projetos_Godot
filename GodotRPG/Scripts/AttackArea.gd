extends Node2D

func attack(side, d):
	var bodies
	if side == get_parent().LEFT:
		bodies = $Left.get_overlapping_bodies()
	elif side == get_parent().RIGHT:
		bodies = $Right.get_overlapping_bodies()
	elif side == get_parent().UP:
		bodies = $Up.get_overlapping_bodies()
	elif side == get_parent().DOWN:
		bodies = $Down.get_overlapping_bodies()
	
	for b in bodies:
		if b.has_method("damage") and b != get_parent():
			b.damage(side, d)
	
	if d == 0: return
	
	$Sword.frame = 0
	if side == get_parent().LEFT:
		$Sword.play("left")
	elif side == get_parent().RIGHT:
		$Sword.play("right")
	elif side == get_parent().UP:
		$Sword.play("up")
	elif side == get_parent().DOWN:
		$Sword.play("down")