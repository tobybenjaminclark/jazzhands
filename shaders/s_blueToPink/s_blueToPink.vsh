//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 texture = texture2D(gm_BaseTexture, v_vTexcoord);
    vec3 newColor = vec3(1.0, 0.0, 1.0); // RGB values for pink (1, 0, 1)
    gl_FragColor = vec4(texture.r * newColor.r, texture.g * newColor.g, texture.b * newColor.b, texture.a) * v_vColour;
}
