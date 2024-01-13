/**
 * Returns the value of a logistic curve between min and max with the specified step.
 *
 * @param {real} min - The minimum bound of the curve (where it would return 0).
 * @param {real} max - The maximum bound of the curve (where it would return 1).
 * @param {real} step - The step (between min & max) of the curve to return.
 * @returns {real} - The value of the logistic curve at the specified step.
 */
 
function logistic_curve(min, max, step) {
    // Logistic function: f(x) = 1 / (1 + e^(-x))
    // Map the step value to a range that covers the logistic curve
    var mappedValue = (step - min) / (max - min);
    
    // Apply the logistic function
    var result = 1 / (1 + exp(-mappedValue));
    
    // Map the result back to the desired range
    result = lerp(0, 1, result);
    
    return result;
}

/**
 * Returns the value of a modified logistic curve.
 *
 * @param {real} x - The input value.
 * @returns {real} - The modified logistic curve value.
 */
 
function modified_logistic_curve(x)
{
    var k = 10; // Adjust the steepness of the curve
    var c = 0.5; // Adjust the shift along the x-axis
    
    // Calculate the modified logistic function
    var result = 1 / (1 + exp(-k * (x - c)));
    
    return result;
}