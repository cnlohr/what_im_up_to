Codified from my time on the VRC Shader Discord Channel.

Need a `mod` that doesn't do dumb things with negative numbers? 
```
glsl mod(x, y) is:
x - y * floor(x/y)

hlsl fmod(x, y) is:
x - y * trunc(x/y)
```
Look no further.
```
            #define mod(x,y) (x-y*floor(x/y)) // glsl mod
```

Toocanz provides these shortcuts.
```
#define iTime _Time.y
#define iResolution _ScreenParams
#define vec2 float2
#define vec3 float3
#define vec4 float4
#define mix lerp
#define texture tex2D
#define fract frac
#define mat4 float4x4
#define mat3 float3x3
#define textureLod(a,b,c) tex2Dlod(a,float4(b,0,c))
```
