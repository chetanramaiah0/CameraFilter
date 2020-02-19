precision highp float;

uniform vec3                iResolution;
uniform float               iGlobalTime;
uniform sampler2D           iChannel0;
varying vec2                texCoord;


void main()
{
    vec4 Color = texture2D( iChannel0, texCoord);
    vec3 lum = vec3(0.299, 0.587, 0.114);
    vec3 grey = vec3(dot( Color.rgb, lum));
    float w = (floor(min(grey.r, 0.5) * 2.0));
    vec3 by = vec3(1.0-w,1.0-w,w);
    gl_FragColor = vec4( by, Color.a);

}