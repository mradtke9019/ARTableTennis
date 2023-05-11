Shader "Unlit/PlaneTransparentShader" {
    Properties{
        _Color("Main Color", Color) = (1, 1, 1, 0.5)
        _MainTex("Albedo (RGB)", 2D) = "white" {}
    }

        SubShader{
            Tags { "RenderType" = "Transparent" }
            LOD 200
            Cull Off

            Blend SrcAlpha OneMinusSrcAlpha

            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #include "UnityCG.cginc"

                struct appdata {
                    float4 vertex : POSITION;
                    float2 uv : TEXCOORD0;
                };

                struct v2f {
                    float2 uv : TEXCOORD0;
                    float4 vertex : SV_POSITION;
                };

                sampler2D _MainTex;
                fixed4 _Color;

                v2f vert(appdata v) {
                    v2f o;
                    o.vertex = UnityObjectToClipPos(v.vertex);
                    o.uv = v.uv;
                    return o;
                }

                fixed4 frag(v2f i) : SV_Target {
                    fixed4 c = tex2D(_MainTex, i.uv) * _Color;
                    c.rgb *= c.a; // Multiply color by alpha to achieve proper transparency
                    return c;
                }
                ENDCG
            }
    }
        FallBack "Diffuse"
}
