Shader "Holistic/Section2_Lecture12" 
{
	Properties 
	{
		_myTex ("Texture", 2D) = "white" {}
	}

	SubShader 
	{
        CGPROGRAM
    		#pragma surface surf Lambert
			
			// Input utilises a mesh's data to perform calculations
			// IMPORTANT: Only include the variables you want to use. Otherwise you're taking more memory
    		struct Input
    		{
    			float2 uv_myTex; // First set of UVs
				// The word 'uv' must be followed by the name of the texture
				// If the texture is '_MainTex': 'uv_MainTex' ||| '_MainTex': 'uv_MainTex'
    		};

    		sampler2D _myTex;

    		void surf(Input IN, inout SurfaceOutput o)
    		{
				// Challenge 2
                o.Albedo = (tex2D(_myTex, IN.uv_myTex)).rgb;
				// o.Albedo.g = 1;

				// Challenge 3
				// o.Albedo = (tex2D(_myTex, IN.uv_myTex) * fixed3(0, 1, 0)).rgb; // Can also be multiplied by fixed4(0, 1, 0, 1)
    		}

		ENDCG
	}
	FallBack "Diffuse"
}