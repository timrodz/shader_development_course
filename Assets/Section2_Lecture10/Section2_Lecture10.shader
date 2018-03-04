Shader "Holistic/Section2_Lecture10" 
{
	Properties 
	{
		_myColor ("Example Color", Color) = (1,1,1,1)
        _myRange ("Example Range", Range(0,5)) = 1
        _myTex ("Example Texture", 2D) = "white" {}
        _myCube ("Example Cube", CUBE) = "" {}
        _myFloat ("Example Float", Float) = 0.5
        _myVector ("Example Vector", Vector) = (0.5,1,1,1)
	}

	SubShader 
	{
        CGPROGRAM
    		#pragma surface surf Lambert

			fixed4 _myColor;
			half _myRange;
	        sampler2D _myTex;
	        samplerCUBE _myCube;
	        float _myFloat;
	        float4 _myVector;
			
			// Input utilises a mesh's data to perform calculations
			// IMPORTANT: Only include the variables you want to use. Otherwise you're taking more memory
    		struct Input
    		{
    			float2 uv_myTex; // Only get the first UV set
				// The word 'uv' must be followed by the name of the texture
				// If the texture is '_MainTex': 'uv_MainTex' ||| '_MainTex': 'uv_MainTex'

				float3 worldRefl; // How to reflect an image off the surface of a model
				// Creation of shiny looking objects that have a mirror finish.
    		};

    		void surf(Input IN, inout SurfaceOutput o)
    		{
                // o.Albedo = tex2D(_myTex, IN.uv_myTex).rgb; // Applies the texture to the Albedo
				o.Albedo = (tex2D(_myTex, IN.uv_myTex) * _myRange * _myColor).rgb; // Applies the texture to the albedo. Its intensity is multiplied by the range (0-5)
				o.Emission = texCUBE(_myCube, IN.worldRefl).rgb;
			}

		ENDCG
	}
	FallBack "Diffuse"
}