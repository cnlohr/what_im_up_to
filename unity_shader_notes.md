Codified from my time on the VRC Shader Discord Channel.

Need a `mod` that doesn't do dumb things with negative numbers? 
```glsl
glsl mod(x, y) is:
x - y * floor(x/y)

hlsl fmod(x, y) is:
x - y * trunc(x/y)
```
Look no further.
```hlsl
            #define mod(x,y) (x-y*floor(x/y)) // glsl mod
```

Toocanzs provides these shortcuts.
```hlsl
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

Hmm well i kinda created it https://www.shadertoy.com/view/tsVBz3

problem is buffers are screen resolution not 256x256 like the texture
but it's as the guy says you generate a texture with 

```glsl
    float g = noise(fragCoord.xy);
    float r = noise(fragCoord.xy + vec2(37,17));
```

and sample it with

```glsl
float noise( in vec3 x )
{
    vec3 i = floor(x);
    vec3 f = fract(x);
    f = f*f*(3.0-2.0*f);
    vec2 uv = (i.xy+vec2(37.0,17.0)*i.z) + f.xy;
    vec2 rg = textureLod( iChannel0, (uv+0.5)/iChannelResolution[0].xy, 0.0).yx;
    return -1. + 2.*mix( rg.x, rg.y, f.z );
}
```

Also while we're on the topic someone has a 4d version apparently https://www.shadertoy.com/view/XltSWj

CHARLES NOTES The above is trivially modified to produce 4x noise.

```glsl
// Created by inigo quilez - iq/2013
// Adapted for 4d by stubbe in 2016
// Adapted for 4d output by cnlohr 2020
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

// Fast 3D (value) noise by using two cubic-smooth bilinear interpolations in a LUT, 
// which is much faster than its hash based (purely procedural) counterpart.
//
// Note that instead of fetching from a grey scale texture twice at an offset of (37,17)
// pixels, the green channel of the texture is a copy of the red channel offset that amount
// (thx Dave Hoskins for the suggestion to try this)

// Adaped by stubbe for 4d: By applying the same trick again we can copy red and green into 
// blue and alpha with an offset for w and effectively sample a 4d noise by sampling and
// blending two 3d noises.


const vec2 zOffset = vec2(37.0,17.0);
const vec2 wOffset = vec2(59.0,83.0);

vec4 tex(vec2 uv)	// Emulate a single texture fetch into the precalculated texture
{
    // NOTE: Precalculate texture, so we can do a single fetch instead of 4.
    // Afaik we can't generate a texture of a specific size in shadertoy at the momemt.
    float r = textureLod( iChannel0, (uv+0.5)/256.0, 0.0 ).r;
    float g = textureLod( iChannel0, (uv+0.5 + zOffset)/256.0, 0.0 ).r;
    float b = textureLod( iChannel0, (uv+0.5 + wOffset)/256.0, 0.0 ).r;
    float a = textureLod( iChannel0, (uv+0.5 + zOffset + wOffset)/256.0, 0.0 ).r;
    
    return vec4(r, g, b, a);
}


vec4 noise( in vec4 x )
{
    vec4 p = floor(x);
    vec4 f = fract(x);
	f = f*f*(3.0-2.0*f);
    
	vec2 uv = (p.xy + p.z*zOffset + p.w*wOffset) + f.xy;
  
     vec4 r = textureLod( iChannel0, (uv+0.5)/256.0, 0.0 );
    vec4 g = textureLod( iChannel0, (uv+0.5 + zOffset)/256.0, 0.0 );
    vec4 b = textureLod( iChannel0, (uv+0.5 + wOffset)/256.0, 0.0 );
    vec4 a = textureLod( iChannel0, (uv+0.5 + zOffset + wOffset)/256.0, 0.0 );
    
   // return vec4(r, g, b, a);

//   	vec4 s = tex(uv);
	return mix(mix( r, g, f.z ), mix(b, a, f.z), f.w);
}

//===============================================================================================
//===============================================================================================
//===============================================================================================
//===============================================================================================
//===============================================================================================


const mat4 m = mat4( 0.00,  0.80,  0.60, -0.4,
                    -0.80,  0.36, -0.48, -0.5,
                    -0.60, -0.48,  0.64,  0.2,
                     0.40,  0.30,  0.20,  0.4);
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 p = (-iResolution.xy + 2.0*fragCoord.xy) / iResolution.y;

     // camera movement	
	float an = 0.5*iTime*0.0;
	vec3 ro = vec3( 2.5*cos(an), 1.0, 2.5*sin(an) );
    vec3 ta = vec3( 0.0, 1.0, 0.0 );
    // camera matrix
    vec3 ww = normalize( ta - ro );
    vec3 uu = normalize( cross(ww,vec3(0.0,1.0,0.0) ) );
    vec3 vv = normalize( cross(uu,ww));
	// create view ray
	vec3 rd = normalize( p.x*uu + p.y*vv + 1.5*ww );

    // sphere center	
	vec3 sc = vec3(0.0,1.0,0.0);

    // raytrace
	float tmin = 10000.0;
	vec3  nor = vec3(0.0);
	float occ = 1.0;
	vec3  pos = vec3(0.0);
	
	// raytrace-plane
	float h = (0.0-ro.y)/rd.y;
	if( h>0.0 ) 
	{ 
		tmin = h; 
		nor = vec3(0.0,1.0,0.0); 
		pos = ro + h*rd;
		vec3 di = sc - pos;
		float l = length(di);
		occ = 1.0 - dot(nor,di/l)*1.0*1.0/(l*l); 
	}

	// raytrace-sphere
	vec3  ce = ro - sc;
	float b = dot( rd, ce );
	float c = dot( ce, ce ) - 1.0;
	h = b*b - c;
	if( h>0.0 )
	{
		h = -b - sqrt(h);
		if( h<tmin ) 
		{ 
			tmin=h; 
			nor = normalize(ro+h*rd-sc); 
			occ = 0.5 + 0.5*nor.y;
		}
	}

    // shading/lighting	
	vec3 col = vec3(0.9);
	if( tmin<100.0 )
	{
	    pos = ro + tmin*rd;
        vec4 samplePos = vec4(pos,0.0) + vec4( vec3(-0.5-iTime*0.2,-0.5+iTime*0.4,-0.5-iTime*0.2), 0.5+iTime*0.8 );
        samplePos *= m;
	    vec4 f;// = 0.0;
		
		vec4 q = 4.0*samplePos;
        f  = 0.5000*noise( q ).bbbb; q = m*q*2.01;
       // f += 0.2500*noise( q ); q = m*q*2.02;
       // f += 0.1250*noise( q ); q = m*q*2.03;
       // f += 0.0625*noise( q ); q = m*q*2.01;
        col = vec3( abs(f*4.0-1.0));
	//	f *= occ;
	//	col = vec3(f*1.2);
	//	col = mix( col, vec3(0.9), 1.0-exp( -0.003*tmin*tmin ) );
	}
	
	//col = sqrt( col );
	
	//col *= smoothstep( 0.006, 0.008, abs(p.x) );
	
	fragColor = vec4( col, 1.0 );
}
```
