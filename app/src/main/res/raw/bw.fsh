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
    vec3 bw = floor(min(grey, 0.5) * 2.0) ;
    gl_FragColor = vec4( bw, Color.a);

}
