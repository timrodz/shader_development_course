Shader "Holistic/Section2_Lecture14" 
{
	Properties 
	{
		_difTex ("Diffuse Texture", 2D) = "white" {}
		_emsTex ("Emmisive Texture", 2D) = "white" {}
	}

	SubShader 
	{
        CGPROGRAM
    		#pragma surface surf Lambert
			
    		struct Input
    		{
    			float2 uv_difTex;
				float2 uv_emsTex;
    		};

    		sampler2D _difTex;
			sampler2D _emsTex;

    		void surf(Input IN, inout SurfaceOutput o)
    		{
				o.Albedo = tex2D(_difTex, IN.uv_difTex).rgb;
				o.Emission = tex2D(_emsTex, IN.uv_emsTex).rgb;
    		}

		ENDCG
	}
	FallBack "Diffuse"
}