How to set up Multiple render targets with Udon.

This also captures depth on the main camera.

Make sure cameras are orthogonal!

(1) Install U#

(2)
```c#
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class QuadUTest : UdonSharpBehaviour
{
    public RenderTexture RT0A;
    public RenderTexture RT1A;
    public RenderTexture RT2A;
    public RenderTexture RT3A;
    public RenderTexture RT0B;
    public RenderTexture RT1B;
    public RenderTexture RT2B;
    public RenderTexture RT3B;

    public RenderTexture Scene;
    public RenderTexture SceneDepth;
    public Camera CAMScene;
    public Camera CAMA;
    public Camera CAMB;

    void Start()
    {
        RenderBuffer[] renderBuffersScene = new RenderBuffer[] { Scene.colorBuffer };
        CAMScene.SetTargetBuffers(renderBuffersScene, SceneDepth.depthBuffer);

        RenderBuffer[] renderBuffersA = new RenderBuffer[] { RT0A.colorBuffer, RT1A.colorBuffer, RT2A.colorBuffer, RT3A.colorBuffer };
        CAMA.SetTargetBuffers(renderBuffersA, RT0A.depthBuffer);
        RenderBuffer[] renderBuffersB = new RenderBuffer[] { RT0B.colorBuffer, RT1B.colorBuffer, RT2B.colorBuffer, RT3B.colorBuffer };
        CAMB.SetTargetBuffers(renderBuffersB, RT0B.depthBuffer);
    }
}
```

3: Make sure your textures are:
(1) The same size
(2) Your depth texture on input is "Depth" type not "R float"
(3) Probably use nearest neighbor. 

Make render pass cameras part of the scene itself.









Floor Shader Input: 1024x1024 and the ping/pong is run this back to back with 1024->2048->1024

```hlsl
Shader "Custom/ComputeFloor"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _CopiedTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };
			
			fixed2 rotate2D(fixed2 v, fixed a)
			{
				fixed s = sin(a);
				fixed c = cos(a);
				fixed2x2 m = fixed2x2(c, -s, s, c);
				return mul(m,v);
			}

            sampler2D _MainTex;
            sampler2D _CopiedTex;
            float4 _MainTex_ST;
            
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }
            
            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 nv = tex2D(_MainTex, fixed2( 1.0 - i.uv.r, i.uv.g ) );
				fixed vin = nv.x;
                fixed4 ov = tex2D(_CopiedTex, i.uv );
                fixed4 Left1 = tex2D(_CopiedTex, i.uv-fixed2(1./1024.,0.) );
                fixed4 Up1 = tex2D(_CopiedTex, i.uv-fixed2(0.,1./1024.) );
                fixed4 Right1 = tex2D(_CopiedTex, i.uv+fixed2(1./1024.,0.) );
                fixed4 Down1 = tex2D(_CopiedTex, i.uv+fixed2(0.,1./1024.) );

				fixed timestep = .5;

				fixed velocity = ov.z;
				fixed diff = vin-ov.y;
				fixed value = ov.x + diff*.3;

				fixed laplacian = 
					2.0*(
						(Left1.x+Right1.x)/2.0-value.x+(Up1.x+Down1.x)/2.0-value.x);
		
				velocity+=laplacian*timestep;
				value+=velocity*timestep;
			

				ov = fixed4( value*.999, vin, velocity*.999, 1. );

#if 0
				//Charles's weird thing
				fixed avgv = (ovA.b + ovB.b + ovC.b + ovD.b)/4.0;
				
				//Calm it down over time.
				ov.b = ov.b*.99+vin*.01;
				
				ov.b += (ovC.r - ovA.r + ovD.g - ovB.g)*.01;

				fixed dx = (ovA.b-vin) + (vin-ovC.b);
				fixed dy = (ovB.b-vin) + (vin-ovD.b);

				ov.r += dx * 1.0;
				ov.g += dy * 1.0;
				ov.rg = ov.rg + ovA.rg + ovB.rg +
					ovC.rg+ ovD.rg;
				ov.rg/=5;
#endif
				//ov = fixed4(0.,0.,0.,1.);
				//ov.r = 0.;
                return ov;
            }
            ENDCG
        }
    }
}


```
