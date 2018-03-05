Shader "Holistic/Section3_Lecture20" 
{
	Properties 
	{
		_diffuse ("Diffuse Texture", 2D) = "white" {}
		_bump ("Bump Texture", 2D) = "white" {}
		_bumpSlider ("Bump Amount", Range(0, 10)) = 1
		_brightness ("Brightness", Range(0, 10)) = 1
        _cubemap ("Cube Map", CUBE) = "white" {}
	}

	SubShader 
	{
        CGPROGRAM
    		#pragma surface surf Lambert
			
    		struct Input
    		{
    			float2 uv_diffuse;
				float2 uv_bump;
                float3 worldRefl;
    		};

    		sampler2D _diffuse;
			half _brightness;

			sampler2D _bump;
			half _bumpSlider;

            samplerCUBE _cubemap;

    		void surf(Input IN, inout SurfaceOutput o)
    		{
				// o.Albedo = (tex2D(_diffuse, IN.uv_diffuse) * _brightness).rgb;

				// o.Normal = UnpackNormal(tex2D(_bump, IN.uv_bump));
				// o.Normal *= float3(_bumpSlider, _bumpSlider, 1);

                o.Albedo = texCUBE(_cubemap, IN.worldRefl).rgb;
    		}

		ENDCG
	}
	FallBack "Diffuse"
}