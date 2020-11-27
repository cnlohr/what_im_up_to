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
