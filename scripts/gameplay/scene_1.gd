extends Node2D
# Scene 1

func load_next_scene():
	ScenesGlobal.load_next_day_scene()

# Steps

@onready var timer = $ActionTimer

enum Steps{
	START,
	CLICK_WINDOW, # Zoom in on window
	ENTER, # Then enter the room
	CLICK_NOTIFICATION, # To get phone notification
	CLICK_PHONE_GRAB, # To grab the phone
	CLICK_SHOW_PHONE, # To show the phone
	CLICK_REPLY, # To send a reply
	END
}

var current_step = Steps.START

func complete_step(expected_step, wait_time = ScenesGlobal.default_action_wait_time):
	if ScenesGlobal.step_in_progress:
		return
	if current_step + 1 != expected_step:
		return
	
	ScenesGlobal.start_action_timer(wait_time)
	current_step = (current_step + 1) as Steps
	_on_step_changed()

func _on_step_changed():
	print("Current step: %s" % current_step)
	
	match current_step:
		
		Steps.START:
			print("This line will never happen, but it's here for completeness.")
		
		Steps.CLICK_WINDOW:
			building_scene.zoom_in_on_window()
			
		Steps.ENTER:
			building_scene.queue_free()
			add_inside_scene()
		
		Steps.CLICK_NOTIFICATION:
			print("Notification receiving")
			inside_scene.animate_notification()
			inside_scene.animate_turn_around()
		
		Steps.CLICK_PHONE_GRAB:
			print("grabbing phone")
			inside_scene.animate_reach_phone()
		
		Steps.CLICK_SHOW_PHONE:
			print("showing phone")
			inside_scene.animate_show_phone()
		
		Steps.CLICK_REPLY:
			print("replying to message")
			inside_scene.animate_reply()
		
		Steps.END:
			print("End")
			load_next_scene()
		
		_:
			print("Step not implemented yet.")

# Display

func _ready():
	ScenesGlobal.start_action_timer()
	timer.start()
	
	add_building_scene()

var building_scene = ScenesGlobal.building_scene.instantiate()
func add_building_scene():
	add_child(building_scene)
	building_scene.building_window_clicked.connect(_on_building_window_clicked)

var inside_scene = ScenesGlobal.inside_scene.instantiate()
func add_inside_scene():
	add_child(inside_scene)
	inside_scene.clicked.connect(_on_inside_scene_clicked)

var clicked_window_times = 0
func _on_building_window_clicked():
	if ScenesGlobal.step_in_progress:
		return
	
	clicked_window_times += 1
	if clicked_window_times == 1:
		complete_step(Steps.CLICK_WINDOW)
		return
		
	if clicked_window_times == 2:
		complete_step(Steps.ENTER)
		return

var clicked_inside_times = 0
func _on_inside_scene_clicked():
	if ScenesGlobal.step_in_progress:
		return
	
	clicked_inside_times += 1
	if clicked_inside_times == 1:
		complete_step(Steps.CLICK_NOTIFICATION)
		return
	if clicked_inside_times == 2:
		complete_step(Steps.CLICK_PHONE_GRAB)
		return
	if clicked_inside_times == 3:
		complete_step(Steps.CLICK_SHOW_PHONE)
		return
	if clicked_inside_times == 4:
		complete_step(Steps.CLICK_REPLY)
		return
	if clicked_inside_times == 5:
		complete_step(Steps.END)
		return
