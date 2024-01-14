/// @description Creation & Side Offset
/// @author Toby Benjamin Clark
/// @date   14/01/2023

start_time = 0;
target_time = 0;
movement_factor = 3;
paused = false;
set = false;

// Set x position based on side
if (side == "LEFT")
{
    x = x - 100;
}
else if (side == "RIGHT")
{
    x = x + 100;
}

moving = false;








