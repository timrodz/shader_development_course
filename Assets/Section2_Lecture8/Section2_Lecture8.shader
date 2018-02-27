Shader "Holistic/Section2_Lecture8" 
{
	Properties 
	{
		_myColour ("Example Colour", Color) = (1,1,1,1)
	}

	SubShader 
	{
        CGPROGRAM
    		#pragma surface surf Lambert
			
			// Input utilises a mesh's data to perform calculations
			// IMPORTANT: Only include the variables you want to use. Otherwise you're taking more memory
    		struct Input
    		{
    			float2 uv_MainTex; // First set of UVs
				float2 uv2_MainTex; // Second set of UVs
				// The word 'uv' must be followed by the name of the texture
				// If the texture is '_MainTex': 'uv_MainTex' ||| '_MainTex': 'uv_MainTex'

				float3 viewDir; // Angle at which the model is viewed from
				// Allows us to write shaders that change the surface of a model depending where the camera is.
				// Example: Rim lighting

				float3 worldPos; // Coordinates of the vertex being processed
				// Can perform operations on the shader based on its world location.
				// Example: Show/not show a material on the surface of an object based on its physical world location.

				float3 worldRefl; // How to reflect an image off the surface of a model
				// Creation of shiny looking objects that have a mirror finish.
    		};

    		fixed4 _myColour;

    		void surf(Input IN, inout SurfaceOutput o)
    		{
                o.Albedo = _myColour.rgb; // Same as _myColour.xyz | Can be swapped (gbr, grb)
				o.Emission = IN.viewDir;
    		}

		ENDCG
	}
	FallBack "Diffuse"
}