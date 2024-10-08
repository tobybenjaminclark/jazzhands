// Create Event

label_list = [
    "Summoning Hand Recognizer 3000... beep boop",
    "Firing up the Vision Engines! Vroom vroom!",
    "Sending a high-five to the Computer Vision Client",
    "Vision? You there? It's me, Jazzhands!",
    "Aha! Vision is awake! Connecting...",
    "Building models... the AI kind, not the runway kind",
    "Models almost done. The AI is just grabbing a coffee",
    "Activating webcam! It won't judge your messy room...",
    "Apologies for all these puns... But hey, we're ready!"
];

current_label_index = 0;   // Start with the first label
label_switch_time = 300;   // This sets 5 seconds (assuming 30 FPS, you can adjust for other FPS values)

// Set the alarm to trigger every 2 seconds
alarm[0] = label_switch_time;
