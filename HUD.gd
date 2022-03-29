extends CanvasLayer
	
func hide_score():
	$ScoreLabel.hide()
	
func show_score():
	$ScoreLabel.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)

func hide_game_over():
	$GameOverLabel.hide()
	
func show_game_over():
	$GameOverLabel.show()
