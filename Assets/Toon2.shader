Shader "Custom/Toon2"
{
	Properties
	{
		_Color("Albedo", Color) = (1, 1, 1, 1)
		_MainTex("Main Texture", 2D) = "white"{}
	_RampTex("Ramp Texture", 2D) = "white" {}
	}

		SubShader
	{
		CGPROGRAM
#pragma surface surf ToonRamp

		float4 _Color;
	sampler2D _MainTex;
	sampler2D _RampTex;

	float4 LightingToonRamp(SurfaceOutput s, fixed2 lightDir, fixed atten)
	{
		half diff = dot(s.Normal, lightDir);
		float uv = (diff * 0.5) + 0.5; //baja la calidad a la luz y lo acomoda en la textura de ramp. Calculamos el UV.
		float3 ramp = tex2D(_RampTex, uv).rgb; //le damos la textura y acomodamos el UV.
		float4 c;
		c.rgb = s.Albedo * _LightColor0.rgb * ramp;
		c.a = s.Alpha;
		return c;
	}

	struct Input
	{
		float2 uv_MainTex;
	};

	void surf(Input IN, inout SurfaceOutput o)
	{
		o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * _Color.rgb;
	}

	ENDCG
	}
}

