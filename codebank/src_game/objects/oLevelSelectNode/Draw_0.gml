if (is_undefined(node)) exit;

var k = node.kind;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Subtle hover scaling
var r = radius + (hover ? 6 : 0);

// System = square
if (k == NK_SYSTEM) {
    var half = r;
    draw_rectangle(x - half, y - half, x + half, y + half, false);
}
// Planet = circle (single or multi)
else {
    draw_circle(x, y, r, false);

    // Optional: make multi-level planet visually distinct (ring)
    if (k == NK_PLANET_MULTI) {
        draw_circle(x, y, r + 6, true);
    }
}

// Label
draw_text(x, y + r + 14, node.name);
