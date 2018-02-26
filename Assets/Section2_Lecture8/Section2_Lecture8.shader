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

    		struct Input
    		{
    			float2 uvMainTex;
    		};

    		fixed4 _myColour;

    		void surf(Input IN, inout SurfaceOutput o)
    		{
                o.Albedo = _myColour.rgb; // Same as _myColour.xyz | Can be swapped (gbr, grb)
    		}

		ENDCG
	}
	FallBack "Diffuse"
}