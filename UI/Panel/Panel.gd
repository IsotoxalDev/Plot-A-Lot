extends Panel

onready var expr_input = $VBox/Control/ExpressionInput

func _ready():
	expr_input.grab_focus()

func _on_ExpressionInput_text_entered(new_text):
	if new_text == "sin x":
		PlotALot.sin_x()
	pass
