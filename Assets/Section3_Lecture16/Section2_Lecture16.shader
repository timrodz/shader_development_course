Shader "Holistic/Section3_Lecture16" 
{
	Properties 
	{
		_diffuse ("Diffuse Texture", 2D) = "white" {}
		_diffuseSlider ("Diffuse slider", Range(0, 10)) = 1
		_bump ("Bump Texture", 2D) = "white" {}
		_bumpSlider ("Bump Amount", Range(0, 10)) = 1
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
			half _diffuseSlider;

			sampler2D _bump;
			half _bumpSlider;

    		void surf(Input IN, inout SurfaceOutput o)
    		{
				o.Albedo = (tex2D(_diffuse, IN.uv_diffuse) * _diffuseSlider).rgb;

				o.Normal = UnpackNormal(tex2D(_bump, IN.uv_bump));
				o.Normal *= float3(_bumpSlider, _bumpSlider, 1);
    		}

		ENDCG
	}
	FallBack "Diffuse"
}