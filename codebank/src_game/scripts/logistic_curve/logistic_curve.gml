/// @description Functions for logistic & sigmoid curve (used across program).
/// @author Toby Benjamin Clark
/// @date   12/01/2023

/**
 * Returns the value of a logistic curve between min and max with the specified step. (f(x) = 1 / (1 + e^(-x)))
 *
 * @param {real} min - The minimum bound of the curve (where it would return 0).
 * @param {real} max - The maximum bound of the curve (where it would return 1).
 * @param {real} step - The step (between min & max) of the curve to return.
 * @returns {real} - The value of the logistic curve at the specified step.
 */
function logistic_curve(min, max, step)
{
	/* I can't tell you how this works, sorry, try (https://en.wikipedia.org/wiki/Logistic_function) */
    return lerp(0, 1, (1 / (1 + exp(- (step - min) / (max - min)))));
}



/**
 * Returns the value of a modified logistic curve. (uses sigmoid curve)
 * @param {real} x - The input value.
 * @returns {real} - The modified logistic curve value.
 */
 
function modified_logistic_curve(x)
{
    var k = 10;  /* <-- Adjust the steepness of the curve */
    var c = 0.5; /* <-- Adjust the shift along the x-axis */
    
    /* Calculate the modified logistic function*/
    return 1 / (1 + exp(-k * (x - c)));
}