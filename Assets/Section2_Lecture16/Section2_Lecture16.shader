Shader "Holistic/Section2_Lecture16" 
{
	Properties 
	{
		_diffuse ("Diffuse Texture", 2D) = "white" {}
		_bump ("Bump Texture", 2D) = "white" {}
	}

	SubShader 
	{
        CGPROGRAM
    		#pragma surface surf Lambert
			
    		struct Input
    		{
    			float2 uv_diffuse;
				float2 uv_bump;
    		};

    		sampler2D _diffuse;
			sampler2D _bump;

    		void surf(Input IN, inout SurfaceOutput o)
    		{
				o.Albedo = tex2D(_diffuse, IN.uv_diffuse).rgb;
				o.Normal = UnpackNormal(tex2D(_bump, IN.uv_bump));
    		}

		ENDCG
	}
	FallBack "Diffuse"
}