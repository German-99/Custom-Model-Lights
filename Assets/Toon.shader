﻿Shader "Custom/Toon"
{
	Properties
	{
		_MainTex ("Main Texture", 2D) = "white" {}
	    _Albedo("Albedo", Color) = (1, 1, 1, 1)
		_RampTex("Ramp Texture", 2D) = "white" {}
	}

		SubShader
	{
		CGPROGRAM
		#pragma surface surf ToonRamp

		float4 _albedo;
	    sampler2D _MainTex;
		sampler2D _RampTex;

		float4 LightingToonRamp(SurfaceOutput s, fixed2 lightDir, fixed attem)
		{
			half diff = dot(s.Normal, lightDir);
			float uv = (diff * 0.5) + 0.5;
		}
		ENDCG
	}
}
