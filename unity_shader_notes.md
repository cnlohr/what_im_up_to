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

Toocanzs provides these shortcuts.
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



MORE NOTES FROM TOOCANZS

Readable fake 3d noise from a texture working in Unity courtesy of @1001 but initially from IQ on shadertoy

```hlsl
float noise( float3 p ){
    float3 i = floor(p); p -= i; p *= p*(3. - 2.*p);
    float2 uv = (p.xy + i.xy + float2(37, 17)*i.z + .5)/256.;
    uv.y *= -1;
    p.xy = tex2Dlod(_MainTex, float4(uv, 0, -100)).yx;
    return lerp(p.x, p.y, p.z);
}
```


And the version with less instructions but is mostly unreadable:

```hlsl
float snoise(float3 x) 
    {
        float f = frac(x.z);
        float i = floor(x.z); 
        f *= f * (3. - 2.*f);
        float2 uv = x.xy*float2(0.00390625, -0.00390625) + float2(37, 17)*i*float2(0.00390625, -0.00390625) + 0.001953125;
        float2 n = tex2Dlod(_NoiseTex, float4(uv, 0, 0)).yx;
        return lerp(n.x, n.y, f);
    }
```

"I forget exactly how it's setup, trying to find the article that explains it but as far as i understand it's 2d noise with a 3rd channel that's offset in some way such that it makes pretty good 3d noise"
ah https://shadertoyunofficial.wordpress.com/2016/07/21/usual-tricks-in-shadertoyglsl/

`Noise color texture: G and A channels are R and B translated by (37.,17.) , if no vflip. This allows to fake interpolated 3D noise.`

Not quite the explanation you're hoping for but that's it - I believe it originally comes from here https://www.shadertoy.com/view/XslGRr
```
- this noise texture is special: r planes are equal to g planes with an offset, which allows mimicking volume, thus line 13. hard to fake for other textures.
- texture flag vflip must be unset  and linear instead of mipmap

simply means the R(x,y) = G(x+37,y+17).
It' a hack to fake 3D volumes (that where not available at that time).
Just manually interpolating between the R and G slices (obtained in one single fetch) is like interpolating in a volume slice.  then when floor(z) pass to the net slice you just offset xy index by (37,17) for continuity.
```

