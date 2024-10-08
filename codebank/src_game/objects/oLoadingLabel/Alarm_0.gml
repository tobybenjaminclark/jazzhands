// Alarm[0] Event
// Increment the current label index
current_label_index += 1;

// Loop back to the start if we've reached the end of the list
if (current_label_index >= array_length(label_list)) {
    current_label_index = 0;
}

// Reset the alarm to trigger again in 2 seconds
alarm[0] = label_switch_time;
