// Create Event

// Array of labels
label_list = [
"Establishing Hand Recogniser 3000",
"Enabling Vision Drive",
"Connecting to Computer Vision Client",
"Knock Knock? Are you there Vision?",
"There we go! Connected to Computer Vision Client",
"Building Models (Machine learning, not fashion)",
"Models almost built, we are nearly there!",
"Engaging Webcam! (Non-martial)",
"Apologising for jokes on this loading screen! We're ready!"
];  

current_label_index = 0;   // Start with the first label
label_switch_time = 300;   // This sets 5 seconds (assuming 30 FPS, you can adjust for other FPS values)

// Set the alarm to trigger every 2 seconds
alarm[0] = label_switch_time;
