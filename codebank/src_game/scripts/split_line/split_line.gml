/// @function split_line(x1, y1, x2, y2, y3)
/// @desc Splits a line from (x1, y1) to (x2, y2) at a given Y-coordinate y3, returning two new lines. (Shit chat gpt code)
/// @param {real} x1 - The x-coordinate of the first point.
/// @param {real} y1 - The y-coordinate of the first point.
/// @param {real} x2 - The x-coordinate of the second point.
/// @param {real} y2 - The y-coordinate of the second point.
/// @param {real} y3 - The y-coordinate at which to split the line.
/// @return {array} An array containing two arrays, each representing a line segment.
function split_line(x1, y1, x2, y2, y3) {
    // Check if the line needs to be split
    if (y1 == y2) {
        // Line is horizontal and cannot be split by y3
        return [[x1, y1, x2, y2]];
    }

    // Calculate the slope of the line
    var slope = (x2 - x1) / (y2 - y1);
    
    // Calculate the x-coordinate at y3
    var x3 = x1 + (y3 - y1) * slope;

    // Create the two new line segments
    var line1 = [x1, y1, x3, y3];
    var line2 = [x3, y3, x2, y2];

    // Return the two new lines
    return [line1, line2];
}
