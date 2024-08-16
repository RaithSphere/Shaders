Shader "CytraX/Core"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_metText("metText", 2D) = "white" {}
		_MainTex("MainTex", 2D) = "white" {}
		_MainEmi("Main Emi", 2D) = "white" {}
		[Normal]_BumpMap1("BumpMap", 2D) = "bump" {}
		_MainColor("Main Color", Color) = (1,1,1,1)
		_EmiColor("Emi Color", Color) = (1,1,1,1)
		[Toggle(_METALIC_ON)] _Metalic("Metalic", Float) = 0
		[Toggle(_SMOOTHNESS_ON)] _smoothness("smoothness", Float) = 0
		[Toggle(_ENABLELTCGI_ON)] _enableLTCGI("enableLTCGI", Float) = 0
		[Toggle(_ENABLEAL_ON)] _enableAL("enableAL", Float) = 0
		[Toggle(_DISSOLVE_ON)] _dissolve("dissolve", Float) = 0
		[Toggle(_EMISSION)] _EnableEmission("_Enable Emission", Float) = 0
		_metLevel("metLevel", Range( 0 , 1)) = 0
		_smoothLevel("smoothLevel", Range( 0 , 1)) = 0
		_emiBright("emiBright", Range( 0 , 1)) = 0
		_BumpScale("Normal Scale", Range( 0 , 1)) = 1
		[SingleLineTexture]_OcclusionMap("OcclusionMap", 2D) = "white" {}
		[SingleLineTexture]_smoothMap("smoothMap", 2D) = "white" {}
		_OcclusionStrength("Occlusion Strength", Range( 0 , 1)) = 1
		_DirectionalMap("Directional Map", 2D) = "white" {}
		[HDR]_EmissionGlowTint("EmissionGlowTint", Color) = (1,1,1,0)
		[Enum(None,0,Zone 1,1,Zone 2,2,Zone 3,3,Zone 4,4,Gradient 1,5,Gradient 2,6,Gradient 3,7)]_EmissionGlowZone("EmissionGlowZone", Int) = 0
		[Enum(Global,0,Pulse,1,Radial,2,Direction Map,3,Reversed Direction Map,4)]_EmissionGlowMode("EmissionGlowMode", Int) = 0
		[Enum(Multiply,0,Additive,1)]_EmissionGlowBlendMode("EmissionGlowBlendMode", Int) = 0
		_EmissionGlowMinBrightness("EmissionGlowMinBrightness", Range( 0 , 1)) = 0
		_EmissionGlowPulseDir("EmissionGlowPulseDir", Float) = 0
		_EmissionGlowPulseScale("EmissionGlowPulseScale", Float) = 127
		_EmissionGlowPulseOffset("EmissionGlowPulseOffset", Float) = 0
		[Enum(None,10,Bass,0,Low Mid,1,High Mid,2,Treble,3)]_EmissionGlowAnimationBand("EmissionGlowAnimationBand", Int) = 10
		[Enum(Default,0,Wobble,1,Smooth,2,Hard Stop,3,Constant,4)]_EmissionGlowAnimationMode("EmissionGlowAnimationMode", Int) = 0
		[Enum(Slow,0,Fast,1)]_EmissionGlowAnimationSpeed("EmissionGlowAnimationSpeed", Int) = 0
		_EmissionGlowAnimationStrength("EmissionGlowAnimationStrength", Float) = 1
		_EmissionGlowRadialCenter("EmissionGlowRadialCenter", Vector) = (0.5,0.5,0,0)
		[HDR]_EmissionReactiveTint("EmissionReactiveTint", Color) = (1,1,1,0)
		[Enum(None,10,Bass,0,Low Mid,1,High Mid,2,Treble,3)]_EmissionReactiveBand("EmissionReactiveBand", Int) = 10
		[Enum(Global,0,Pulse,1,Radial,2,Direction Map,3,Reversed Direction Map,4,Smooth Global,5)]_EmissionReactiveMode("EmissionReactiveMode", Int) = 0
		[Enum(Multiply,0,Additive,1,Reversed Multiply,2,Reversed Additve,3)]_EmissionReactiveBlendMode("EmissionReactiveBlendMode", Int) = 0
		_EmissionReactiveMinBrightness("EmissionReactiveMinBrightness", Range( 0 , 1)) = 0
		_EmissionReactiveGlobalSmoothing("EmissionReactiveGlobalSmoothing", Range( 0 , 2)) = 1
		_EmissionReactivePulseDir("EmissionReactivePulseDir", Float) = 0
		_EmissionReactivePulseScale("EmissionReactivePulseScale", Float) = 127
		_EmissionReactivePulseOffset("EmissionReactivePulseOffset", Float) = 0
		_EmissionReactiveRadialCenter("EmissionReactiveRadialCenter", Vector) = (0.5,0.5,0,0)
		_ShowEmissGlow("_ShowEmissGlow", Float) = 0
		_ShowEmissAL("_ShowEmissAL", Float) = 0
		_GlowMask("GlowMask", 2D) = "black" {}
		[HDR]_RedChGlowTint("RedChGlowTint", Color) = (1,1,1,0)
		[Enum(None,0,Zone 1,1,Zone 2,2,Zone 3,3,Zone 4,4,Gradient 1,5,Gradient 2,6,Gradient 3,7)]_RedChGlowZone("RedChGlowZone", Int) = 0
		[Enum(Global,0,Pulse,1,Radial,2,Direction Map,3,Reversed Direction Map,4)]_RedChGlowMode("RedChGlowMode", Int) = 0
		_RedChGlowMinBrightness("RedChGlowMinBrightness", Range( 0 , 1)) = 0
		_RedChGlowPulseDir("RedChGlowPulseDir", Float) = 0
		_RedChGlowPulseScale("RedChGlowPulseScale", Float) = 127
		_RedChGlowPulseOffset("RedChGlowPulseOffset", Float) = 0
		[Enum(None,10,Bass,0,Low Mid,1,High Mid,2,Treble,3)]_RedChGlowAnimationBand("RedChGlowAnimationBand", Int) = 10
		[Enum(Default,0,Wobble,1,Smooth,2,Hard Stop,3,Constant,4)]_RedChGlowAnimationMode("RedChGlowAnimationMode", Int) = 0
		[Enum(Slow,0,Fast,1)]_RedChGlowAnimationSpeed("RedChGlowAnimationSpeed", Int) = 0
		_RedChGlowAnimationStrength("RedChGlowAnimationStrength", Float) = 1
		_RedChGlowRadialCenter("RedChGlowRadialCenter", Vector) = (0.5,0.5,0,0)
		[HDR]_RedChReactiveTint("RedChReactiveTint", Color) = (1,1,1,0)
		[Enum(None,10,Bass,0,Low Mid,1,High Mid,2,Treble,3)]_RedChReactiveBand("RedChReactiveBand", Int) = 10
		[Enum(Global,0,Pulse,1,Radial,2,Direction Map,3,Reversed Direction Map,4,Smooth Global,5)]_RedChReactiveMode("RedChReactiveMode", Int) = 0
		[Enum(Multiply,0,Additive,1,Reversed Multiply,2,Reversed Additve,3)]_RedChReactiveBlendMode("RedChReactiveBlendMode", Int) = 0
		_RedChReactiveMinBrightness("RedChReactiveMinBrightness", Range( 0 , 1)) = 0
		_RedChReactiveGlobalSmoothing("RedChReactiveGlobalSmoothing", Range( 0 , 2)) = 1
		_RedChReactivePulseDir("RedChReactivePulseDir", Float) = 0
		_RedChReactivePulseScale("RedChReactivePulseScale", Float) = 127
		_RedChReactivePulseOffset("RedChReactivePulseOffset", Float) = 0
		_RedChReactiveRadialCenter("RedChReactiveRadialCenter", Vector) = (0.5,0.5,0,0)
		_ShowRedGlow("_ShowRedGlow", Float) = 0
		_ShowRedAL("_ShowRedAL", Float) = 0
		[ToggleUI]_EnableRedChannel("_EnableRedChannel", Float) = 0
		[HDR]_GreenChGlowTint("GreenChGlowTint", Color) = (1,1,1,0)
		[Enum(None,0,Zone 1,1,Zone 2,2,Zone 3,3,Zone 4,4,Gradient 1,5,Gradient 2,6,Gradient 3,7)]_GreenChGlowZone("GreenChGlowZone", Int) = 0
		[Enum(Global,0,Pulse,1,Radial,2,Direction Map,3,Reversed Direction Map,4)]_GreenChGlowMode("GreenChGlowMode", Int) = 0
		_GreenChReactiveMinBrightness("GreenChReactiveMinBrightness", Range( 0 , 1)) = 0
		_GreenChGlowPulseDir("GreenChGlowPulseDir", Float) = 0
		_GreenChGlowPulseScale("GreenChGlowPulseScale", Float) = 127
		_GreenChGlowPulseOffset("GreenChGlowPulseOffset", Float) = 0
		[Enum(None,10,Bass,0,Low Mid,1,High Mid,2,Treble,3)]_GreenChGlowAnimationBand("GreenChGlowAnimationBand", Int) = 10
		[Enum(Default,0,Wobble,1,Smooth,2,Hard Stop,3,Constant,4)]_GreenChGlowAnimationMode("GreenChGlowAnimationMode", Int) = 0
		[Enum(Slow,0,Fast,1)]_GreenChGlowAnimationSpeed("GreenChGlowAnimationSpeed", Int) = 0
		_GreenChGlowAnimationStrength("GreenChGlowAnimationStrength", Float) = 1
		_GreenChGlowRadialCenter("GreenChGlowRadialCenter", Vector) = (0.5,0.5,0,0)
		[HDR]_GreenChReactiveTint("GreenChReactiveTint", Color) = (1,1,1,0)
		[Enum(None,10,Bass,0,Low Mid,1,High Mid,2,Treble,3)]_GreenChReactiveBand("GreenChReactiveBand", Int) = 10
		[Enum(Global,0,Pulse,1,Radial,2,Direction Map,3,Reversed Direction Map,4,Smooth Global,5)]_GreenChReactiveMode("GreenChReactiveMode", Int) = 0
		[Enum(Multiply,0,Additive,1,Reversed Multiply,2,Reversed Additve,3)]_GreenChReactiveBlendMode("GreenChReactiveBlendMode", Int) = 0
		_GreenChGlowMinBrightness("GreenChGlowMinBrightness", Range( 0 , 1)) = 0
		_GreenChReactiveGlobalSmoothing("GreenChReactiveGlobalSmoothing", Range( 0 , 2)) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		_GreenChReactivePulseDir("GreenChReactivePulseDir", Float) = 0
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		_GreenChReactivePulseScale("GreenChReactivePulseScale", Float) = 127
		_GreenChReactivePulseOffset("GreenChReactivePulseOffset", Float) = 0
		_GreenChReactiveRadialCenter("GreenChReactiveRadialCenter", Vector) = (0.5,0.5,0,0)
		_ShowGreenGlow("_ShowGreenGlow", Float) = 0
		_ShowGreenAL("_ShowGreenAL", Float) = 0
		[ToggleUI]_EnableGreenChannel("_EnableGreenChannel", Float) = 0
		[HDR]_BlueChGlowTint("BlueChGlowTint", Color) = (1,1,1,0)
		[Enum(None,0,Zone 1,1,Zone 2,2,Zone 3,3,Zone 4,4,Gradient 1,5,Gradient 2,6,Gradient 3,7)]_BlueChGlowZone("BlueChGlowZone", Int) = 0
		[Enum(Global,0,Pulse,1,Radial,2,Direction Map,3,Reversed Direction Map,4)]_BlueChGlowMode("BlueChGlowMode", Int) = 0
		_BlueChGlowMinBrightness("BlueChGlowMinBrightness", Range( 0 , 1)) = 0
		_BlueChGlowPulseDir("BlueChGlowPulseDir", Float) = 0
		_BlueChGlowPulseScale("BlueChGlowPulseScale", Float) = 127
		_BlueChGlowPulseOffset("BlueChGlowPulseOffset", Float) = 0
		[Enum(None,10,Bass,0,Low Mid,1,High Mid,2,Treble,3)]_BlueChGlowAnimationBand("BlueChGlowAnimationBand", Int) = 10
		[Enum(Default,0,Wobble,1,Smooth,2,Hard Stop,3,Constant,4)]_BlueChGlowAnimationMode("BlueChGlowAnimationMode", Int) = 0
		[Enum(Slow,0,Fast,1)]_BlueChGlowAnimationSpeed("BlueChGlowAnimationSpeed", Int) = 0
		_BlueChGlowAnimationStrength("BlueChGlowAnimationStrength", Float) = 1
		_BlueChGlowRadialCenter("BlueChGlowRadialCenter", Vector) = (0.5,0.5,0,0)
		[HDR]_BlueChReactiveTint("BlueChReactiveTint", Color) = (1,1,1,0)
		[Enum(None,10,Bass,0,Low Mid,1,High Mid,2,Treble,3)]_BlueChReactiveBand("BlueChReactiveBand", Int) = 10
		[Enum(Global,0,Pulse,1,Radial,2,Direction Map,3,Reversed Direction Map,4,Smooth Global,5)]_BlueChReactiveMode("BlueChReactiveMode", Int) = 0
		[Enum(Multiply,0,Additive,1,Reversed Multiply,2,Reversed Additve,3)]_BlueChReactiveBlendMode("BlueChReactiveBlendMode", Int) = 0
		_BlueChReactiveMinBrightness("BlueChReactiveMinBrightness", Range( 0 , 1)) = 0
		_BlueChReactiveGlobalSmoothing("BlueChReactiveGlobalSmoothing", Range( 0 , 2)) = 1
		_BlueChReactivePulseDir("BlueChReactivePulseDir", Float) = 0
		_BlueChReactivePulseScale("BlueChReactivePulseScale", Float) = 127
		_BlueChReactivePulseOffset("BlueChReactivePulseOffset", Float) = 0
		_BlueChReactiveRadialCenter("BlueChReactiveRadialCenter", Vector) = (0.5,0.5,0,0)
		_ShowBlueGlow("_ShowBlueGlow", Float) = 0
		_ShowBlueAL("_ShowBlueAL", Float) = 0
		[ToggleUI]_EnableBlueChannel("_EnableBlueChannel", Float) = 0
		[HDR]_AlphaChGlowTint("AlphaChGlowTint", Color) = (1,1,1,0)
		[Enum(None,0,Zone 1,1,Zone 2,2,Zone 3,3,Zone 4,4,Gradient 1,5,Gradient 2,6,Gradient 3,7)]_AlphaChGlowZone("AlphaChGlowZone", Int) = 0
		[Enum(Global,0,Pulse,1,Radial,2,Direction Map,3,Reversed Direction Map,4)]_AlphaChGlowMode("AlphaChGlowMode", Int) = 0
		_AlphaChGlowMinBrightness("AlphaChGlowMinBrightness", Range( 0 , 1)) = 0
		_AlphaChGlowPulseDir("AlphaChGlowPulseDir", Float) = 0
		_AlphaChGlowPulseScale("AlphaChGlowPulseScale", Float) = 127
		_AlphaChGlowPulseOffset("AlphaChGlowPulseOffset", Float) = 0
		[Enum(None,10,Bass,0,Low Mid,1,High Mid,2,Treble,3)]_AlphaChGlowAnimationBand("AlphaChGlowAnimationBand", Int) = 10
		[Enum(Default,0,Wobble,1,Smooth,2,Hard Stop,3,Constant,4)]_AlphaChGlowAnimationMode("AlphaChGlowAnimationMode", Int) = 0
		[Enum(Slow,0,Fast,1)]_AlphaChGlowAnimationSpeed("AlphaChGlowAnimationSpeed", Int) = 0
		_AlphaChGlowAnimationStrength("AlphaChGlowAnimationStrength", Float) = 1
		_AlphaChGlowRadialCenter("AlphaChGlowRadialCenter", Vector) = (0.5,0.5,0,0)
		[HDR]_AlphaChReactiveTint("AlphaChReactiveTint", Color) = (1,1,1,0)
		[Enum(None,10,Bass,0,Low Mid,1,High Mid,2,Treble,3)]_AlphaChReactiveBand("AlphaChReactiveBand", Int) = 10
		[Enum(Global,0,Pulse,1,Radial,2,Direction Map,3,Reversed Direction Map,4,Smooth Global,5)]_AlphaChReactiveMode("AlphaChReactiveMode", Int) = 0
		[Enum(Multiply,0,Additive,1,Reversed Multiply,2,Reversed Additve,3)]_AlphaChReactiveBlendMode("AlphaChReactiveBlendMode", Int) = 0
		_AlphaChReactiveMinBrightness("AlphaChReactiveMinBrightness", Range( 0 , 1)) = 0
		_AlphaChReactiveGlobalSmoothing("AlphaChReactiveGlobalSmoothing", Range( 0 , 2)) = 1
		_AlphaChReactivePulseDir("AlphaChReactivePulseDir", Float) = 0
		_AlphaChReactivePulseScale("AlphaChReactivePulseScale", Float) = 127
		_AlphaChReactivePulseOffset("AlphaChReactivePulseOffset", Float) = 0
		_AlphaChReactiveRadialCenter("AlphaChReactiveRadialCenter", Vector) = (0.5,0.5,0,0)
		_ShowAlphaGlow("_ShowAlphaGlow", Float) = 0
		_ShowAlphaAL("_ShowAlphaAL", Float) = 0
		[ToggleUI]_EnableAlphaChannel("_EnableAlphaChannel", Float) = 0
		_TextureSample1("Texture Sample 1", 2D) = "white" {}
		_dissolveMap("dissolveMap", 2D) = "white" {}
		_dissolveTotal("dissolveTotal", Range( 0 , 1)) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Geometry+0" "IsEmissive" = "true"  "LTCGI"="ALWAYS" }
		Cull Back
		Blend SrcAlpha OneMinusSrcAlpha
		
		AlphaToMask On
		CGINCLUDE
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#pragma shader_feature_local _EMISSION
		#pragma shader_feature_local _ENABLELTCGI_ON
		#pragma shader_feature_local _ENABLEAL_ON
		#pragma shader_feature_local _METALIC_ON
		#pragma shader_feature_local _SMOOTHNESS_ON
		#pragma shader_feature_local _DISSOLVE_ON
        // Define the keyword
        #pragma multi_compile _ USE_LTCGI

        // Include LTCGI if USE_LTCGI is defined
        #ifdef USE_LTCGI
            #include "Assets/_pi_/_LTCGI/Shaders/LTCGI.cginc"
        #endif

		#include "Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc"
		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
			float2 uv2_texcoord2;
		};

		uniform float _ShowEmissGlow;
		uniform float _ShowEmissAL;
		uniform float _ShowRedGlow;
		uniform float _ShowRedAL;
		uniform float _EnableRedChannel;
		uniform float _ShowGreenGlow;
		uniform float _ShowGreenAL;
		uniform float _ShowBlueGlow;
		uniform float _ShowBlueAL;
		uniform float _ShowAlphaGlow;
		uniform float _ShowAlphaAL;
		uniform sampler2D _BumpMap1;
		uniform float _BumpScale;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform float4 _MainColor;
		uniform sampler2D _MainEmi;
		uniform float4 _MainEmi_ST;
		uniform float _emiBright;
		uniform float4 _EmiColor;
		uniform float4 _BumpMap1_ST;
		uniform float _smoothLevel;
		uniform int _RedChGlowZone;
		uniform float _RedChGlowPulseDir;
		uniform float _RedChGlowPulseScale;
		uniform float _RedChGlowPulseOffset;
		uniform float _RedChGlowAnimationStrength;
		uniform int _RedChGlowAnimationBand;
		uniform int _RedChGlowAnimationMode;
		uniform int _RedChGlowAnimationSpeed;
		uniform float2 _RedChGlowRadialCenter;
		uniform int _RedChGlowMode;
		uniform sampler2D _DirectionalMap;
		uniform float4 _DirectionalMap_ST;
		uniform float _RedChGlowMinBrightness;
		uniform float4 _RedChGlowTint;
		uniform int _RedChReactiveBand;
		uniform float _RedChReactivePulseDir;
		uniform float _RedChReactivePulseScale;
		uniform float _RedChReactivePulseOffset;
		uniform float2 _RedChReactiveRadialCenter;
		uniform int _RedChReactiveMode;
		uniform float _RedChReactiveGlobalSmoothing;
		uniform float _RedChReactiveMinBrightness;
		uniform float4 _RedChReactiveTint;
		uniform int _RedChReactiveBlendMode;
		uniform sampler2D _GlowMask;
		uniform float4 _GlowMask_ST;
		uniform int _GreenChGlowZone;
		uniform float _GreenChGlowPulseDir;
		uniform float _GreenChGlowPulseScale;
		uniform float _GreenChGlowPulseOffset;
		uniform float _GreenChGlowAnimationStrength;
		uniform int _GreenChGlowAnimationBand;
		uniform int _GreenChGlowAnimationMode;
		uniform int _GreenChGlowAnimationSpeed;
		uniform float2 _GreenChGlowRadialCenter;
		uniform int _GreenChGlowMode;
		uniform float _GreenChGlowMinBrightness;
		uniform float4 _GreenChGlowTint;
		uniform int _GreenChReactiveBand;
		uniform float _GreenChReactivePulseDir;
		uniform float _GreenChReactivePulseScale;
		uniform float _GreenChReactivePulseOffset;
		uniform float2 _GreenChReactiveRadialCenter;
		uniform int _GreenChReactiveMode;
		uniform float _GreenChReactiveGlobalSmoothing;
		uniform float _GreenChReactiveMinBrightness;
		uniform float4 _GreenChReactiveTint;
		uniform int _GreenChReactiveBlendMode;
		uniform float _EnableGreenChannel;
		uniform int _BlueChGlowZone;
		uniform float _BlueChGlowPulseDir;
		uniform float _BlueChGlowPulseScale;
		uniform float _BlueChGlowPulseOffset;
		uniform float _BlueChGlowAnimationStrength;
		uniform int _BlueChGlowAnimationBand;
		uniform int _BlueChGlowAnimationMode;
		uniform int _BlueChGlowAnimationSpeed;
		uniform float2 _BlueChGlowRadialCenter;
		uniform int _BlueChGlowMode;
		uniform float _BlueChGlowMinBrightness;
		uniform float4 _BlueChGlowTint;
		uniform int _BlueChReactiveBand;
		uniform float _BlueChReactivePulseDir;
		uniform float _BlueChReactivePulseScale;
		uniform float _BlueChReactivePulseOffset;
		uniform float2 _BlueChReactiveRadialCenter;
		uniform int _BlueChReactiveMode;
		uniform float _BlueChReactiveGlobalSmoothing;
		uniform float _BlueChReactiveMinBrightness;
		uniform float4 _BlueChReactiveTint;
		uniform int _BlueChReactiveBlendMode;
		uniform float _EnableBlueChannel;
		uniform int _AlphaChGlowZone;
		uniform float _AlphaChGlowPulseDir;
		uniform float _AlphaChGlowPulseScale;
		uniform float _AlphaChGlowPulseOffset;
		uniform float _AlphaChGlowAnimationStrength;
		uniform int _AlphaChGlowAnimationBand;
		uniform int _AlphaChGlowAnimationMode;
		uniform int _AlphaChGlowAnimationSpeed;
		uniform float2 _AlphaChGlowRadialCenter;
		uniform int _AlphaChGlowMode;
		uniform float _AlphaChGlowMinBrightness;
		uniform float4 _AlphaChGlowTint;
		uniform int _AlphaChReactiveBand;
		uniform float _AlphaChReactivePulseDir;
		uniform float _AlphaChReactivePulseScale;
		uniform float _AlphaChReactivePulseOffset;
		uniform float2 _AlphaChReactiveRadialCenter;
		uniform int _AlphaChReactiveMode;
		uniform float _AlphaChReactiveGlobalSmoothing;
		uniform float _AlphaChReactiveMinBrightness;
		uniform float4 _AlphaChReactiveTint;
		uniform int _AlphaChReactiveBlendMode;
		uniform float _EnableAlphaChannel;
		uniform int _EmissionGlowZone;
		uniform float _EmissionGlowPulseDir;
		uniform float _EmissionGlowPulseScale;
		uniform float _EmissionGlowPulseOffset;
		uniform float _EmissionGlowAnimationStrength;
		uniform int _EmissionGlowAnimationBand;
		uniform int _EmissionGlowAnimationMode;
		uniform int _EmissionGlowAnimationSpeed;
		uniform float2 _EmissionGlowRadialCenter;
		uniform int _EmissionGlowMode;
		uniform float _EmissionGlowMinBrightness;
		uniform float4 _EmissionGlowTint;
		uniform int _EmissionReactiveBand;
		uniform float _EmissionReactivePulseDir;
		uniform float _EmissionReactivePulseScale;
		uniform float _EmissionReactivePulseOffset;
		uniform float2 _EmissionReactiveRadialCenter;
		uniform int _EmissionReactiveMode;
		uniform float _EmissionReactiveGlobalSmoothing;
		uniform float _EmissionReactiveMinBrightness;
		uniform float4 _EmissionReactiveTint;
		uniform int _EmissionReactiveBlendMode;
		uniform int _EmissionGlowBlendMode;
		uniform sampler2D _metText;
		uniform float4 _metText_ST;
		uniform float _metLevel;
		uniform sampler2D _smoothMap;
		uniform float4 _smoothMap_ST;
		uniform sampler2D _OcclusionMap;
		uniform float _OcclusionStrength;
		uniform sampler2D _TextureSample1;
		uniform float4 _TextureSample1_ST;
		uniform float _dissolveTotal;
		uniform sampler2D _dissolveMap;
		uniform float4 _dissolveMap_ST;
		uniform float _Cutoff = 0.5;


		float3 getThemeData( int Zone )
		{
			float3 result = lerp(AudioLinkData(ALPASS_THEME_COLOR0),AudioLinkData(ALPASS_THEME_COLOR1),saturate(Zone));
			result = lerp(result,AudioLinkData(ALPASS_THEME_COLOR2),saturate(Zone-1));
			result = lerp(result,AudioLinkData(ALPASS_THEME_COLOR3),saturate(Zone-2));
			return result;
		}


		inline int IsActive11_g4937( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline float3 GlowData2_g4936( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) );
		}


		inline int IsActive11_g4939( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline int AudioLinkDecodeDataAsUInt6_g4943( int Band, int Mode )
		{
			return AudioLinkDecodeDataAsUInt( ALPASS_CHRONOTENSITY + int2(Mode, Band));
		}


		inline float glslmod13_g4930( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod12_g4930( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod34_g4930( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float3 GlowLerp11_g4938( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) );
		}


		inline float4 AudioLinkLerp1_g4942( float Position )
		{
			return AudioLinkLerp( ALPASS_CCSTRIP + float2( Position * 128., 0 ) ).rgba;;
		}


		inline float3 GlowLerp11_g4940( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) );
		}


		inline int IsActive11_g4941( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline float AudioLinkData3_g4931( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		inline float glslmod96_g4930( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod97_g4930( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod98_g4930( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float AudioLinkLerp3_g4933( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) ).r;
		}


		inline float AudioLinkLerp3_g4935( int Band, float FilteredAmount )
		{
			return AudioLinkLerp( ALPASS_FILTEREDAUDIOLINK + float2( FilteredAmount, Band ) ).r;
		}


		float IfAudioLinkv2Exists1_g4945(  )
		{
			int w = 0; 
			int h; 
			int res = 0;
			#ifndef SHADER_TARGET_SURFACE_ANALYSIS
			_AudioTexture.GetDimensions(w, h); 
			#endif
			if (w == 128) res = 1;
			return res;
		}


		inline int IsActive11_g4953( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline float3 GlowData2_g4952( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) );
		}


		inline int IsActive11_g4955( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline int AudioLinkDecodeDataAsUInt6_g4959( int Band, int Mode )
		{
			return AudioLinkDecodeDataAsUInt( ALPASS_CHRONOTENSITY + int2(Mode, Band));
		}


		inline float glslmod13_g4946( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod12_g4946( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod34_g4946( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float3 GlowLerp11_g4954( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) );
		}


		inline float4 AudioLinkLerp1_g4958( float Position )
		{
			return AudioLinkLerp( ALPASS_CCSTRIP + float2( Position * 128., 0 ) ).rgba;;
		}


		inline float3 GlowLerp11_g4956( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) );
		}


		inline int IsActive11_g4957( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline float AudioLinkData3_g4947( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		inline float glslmod96_g4946( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod97_g4946( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod98_g4946( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float AudioLinkLerp3_g4949( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) ).r;
		}


		inline float AudioLinkLerp3_g4951( int Band, float FilteredAmount )
		{
			return AudioLinkLerp( ALPASS_FILTEREDAUDIOLINK + float2( FilteredAmount, Band ) ).r;
		}


		float IfAudioLinkv2Exists1_g4961(  )
		{
			int w = 0; 
			int h; 
			int res = 0;
			#ifndef SHADER_TARGET_SURFACE_ANALYSIS
			_AudioTexture.GetDimensions(w, h); 
			#endif
			if (w == 128) res = 1;
			return res;
		}


		inline int IsActive11_g4969( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline float3 GlowData2_g4968( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) );
		}


		inline int IsActive11_g4971( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline int AudioLinkDecodeDataAsUInt6_g4975( int Band, int Mode )
		{
			return AudioLinkDecodeDataAsUInt( ALPASS_CHRONOTENSITY + int2(Mode, Band));
		}


		inline float glslmod13_g4962( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod12_g4962( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod34_g4962( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float3 GlowLerp11_g4970( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) );
		}


		inline float4 AudioLinkLerp1_g4974( float Position )
		{
			return AudioLinkLerp( ALPASS_CCSTRIP + float2( Position * 128., 0 ) ).rgba;;
		}


		inline float3 GlowLerp11_g4972( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) );
		}


		inline int IsActive11_g4973( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline float AudioLinkData3_g4963( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		inline float glslmod96_g4962( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod97_g4962( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod98_g4962( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float AudioLinkLerp3_g4965( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) ).r;
		}


		inline float AudioLinkLerp3_g4967( int Band, float FilteredAmount )
		{
			return AudioLinkLerp( ALPASS_FILTEREDAUDIOLINK + float2( FilteredAmount, Band ) ).r;
		}


		float IfAudioLinkv2Exists1_g4977(  )
		{
			int w = 0; 
			int h; 
			int res = 0;
			#ifndef SHADER_TARGET_SURFACE_ANALYSIS
			_AudioTexture.GetDimensions(w, h); 
			#endif
			if (w == 128) res = 1;
			return res;
		}


		inline int IsActive11_g4985( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline float3 GlowData2_g4984( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) );
		}


		inline int IsActive11_g4987( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline int AudioLinkDecodeDataAsUInt6_g4991( int Band, int Mode )
		{
			return AudioLinkDecodeDataAsUInt( ALPASS_CHRONOTENSITY + int2(Mode, Band));
		}


		inline float glslmod13_g4978( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod12_g4978( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod34_g4978( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float3 GlowLerp11_g4986( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) );
		}


		inline float4 AudioLinkLerp1_g4990( float Position )
		{
			return AudioLinkLerp( ALPASS_CCSTRIP + float2( Position * 128., 0 ) ).rgba;;
		}


		inline float3 GlowLerp11_g4988( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) );
		}


		inline int IsActive11_g4989( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline float AudioLinkData3_g4979( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		inline float glslmod96_g4978( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod97_g4978( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod98_g4978( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float AudioLinkLerp3_g4981( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) ).r;
		}


		inline float AudioLinkLerp3_g4983( int Band, float FilteredAmount )
		{
			return AudioLinkLerp( ALPASS_FILTEREDAUDIOLINK + float2( FilteredAmount, Band ) ).r;
		}


		float IfAudioLinkv2Exists1_g4993(  )
		{
			int w = 0; 
			int h; 
			int res = 0;
			#ifndef SHADER_TARGET_SURFACE_ANALYSIS
			_AudioTexture.GetDimensions(w, h); 
			#endif
			if (w == 128) res = 1;
			return res;
		}


		inline int IsActive11_g4926( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline float3 GlowData2_g4925( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) );
		}


		inline int IsActive11_g4928( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline int AudioLinkDecodeDataAsUInt6_g4920( int Band, int Mode )
		{
			return AudioLinkDecodeDataAsUInt( ALPASS_CHRONOTENSITY + int2(Mode, Band));
		}


		inline float glslmod13_g4914( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod12_g4914( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod34_g4914( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float3 GlowLerp11_g4927( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) );
		}


		inline float4 AudioLinkLerp1_g4924( float Position )
		{
			return AudioLinkLerp( ALPASS_CCSTRIP + float2( Position * 128., 0 ) ).rgba;;
		}


		inline float3 GlowLerp11_g4922( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) );
		}


		inline int IsActive11_g4923( int Band )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, Band ) ).r;
		}


		inline float AudioLinkData3_g4915( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		inline float glslmod96_g4914( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod97_g4914( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float glslmod98_g4914( float x, float y )
		{
			return glsl_mod(x,y);
		}


		inline float AudioLinkLerp3_g4917( int Band, float Delay )
		{
			return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) ).r;
		}


		inline float AudioLinkLerp3_g4919( int Band, float FilteredAmount )
		{
			return AudioLinkLerp( ALPASS_FILTEREDAUDIOLINK + float2( FilteredAmount, Band ) ).r;
		}


		inline float glslmod270_g4914( float x, float y )
		{
			return glsl_mod(x,y);
		}


		float IfAudioLinkv2Exists1_g4929(  )
		{
			int w = 0; 
			int h; 
			int res = 0;
			#ifndef SHADER_TARGET_SURFACE_ANALYSIS
			_AudioTexture.GetDimensions(w, h); 
			#endif
			if (w == 128) res = 1;
			return res;
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 Normal44 = UnpackScaleNormal( tex2D( _BumpMap1, i.uv_texcoord ), ( _BumpScale * 1.25 ) );
			o.Normal = Normal44;
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 MainTex21 = tex2D( _MainTex, uv_MainTex );
			float4 MainColor23 = _MainColor;
			o.Albedo = ( MainTex21 * MainColor23 ).rgb;
			float2 uv_MainEmi = i.uv_texcoord * _MainEmi_ST.xy + _MainEmi_ST.zw;
			float4 mainEmissive16 = tex2D( _MainEmi, uv_MainEmi );
			#ifdef _EMISSION
				float4 staticSwitch28 = mainEmissive16;
			#else
				float4 staticSwitch28 = float4( 0,0,0,0 );
			#endif
			float4 EmissionRGBA29 = ( staticSwitch28 * _emiBright );
			float4 EmiColor31 = _EmiColor;
			float localLTCGI15_g1 = ( 0.0 );
			float3 ase_worldPos = i.worldPos;
			float3 worldPos15_g1 = ase_worldPos;
			float2 uv_BumpMap1 = i.uv_texcoord * _BumpMap1_ST.xy + _BumpMap1_ST.zw;
			float3 normalizeResult9_g1 = normalize( (WorldNormalVector( i , UnpackNormal( tex2D( _BumpMap1, uv_BumpMap1 ) ) )) );
			float3 worldNorm15_g1 = normalizeResult9_g1;
			float3 normalizeResult12_g1 = normalize( ( _WorldSpaceCameraPos - ase_worldPos ) );
			float3 cameraDir15_g1 = normalizeResult12_g1;
			float roughness15_g1 = ( 1.0 - _smoothLevel );
			float2 lightmapUV15_g1 = i.uv2_texcoord2;
			float3 diffuse15_g1 = float3( 0,0,0 );
			float3 specular15_g1 = float3( 0,0,0 );
			float specularIntensity15_g1 = 0;
			{
				#ifdef USE_LTCGI
					LTCGI_Contribution(worldPos15_g1, worldNorm15_g1, cameraDir15_g1, roughness15_g1, lightmapUV15_g1, diffuse15_g1, specular15_g1, specularIntensity15_g1);
				#endif
			}
			#ifdef _ENABLELTCGI_ON
				float3 staticSwitch78 = ( ( diffuse15_g1 * 0.05 ) + ( specular15_g1 * 1.0 ) );
			#else
				float3 staticSwitch78 = float3( 0,0,0 );
			#endif
			float4 temp_cast_2 = (1.0).xxxx;
			float3 temp_cast_3 = (1.0).xxx;
			int EmissionGlowZone47_g4930 = _RedChGlowZone;
			int clampResult8_g4936 = clamp( EmissionGlowZone47_g4930 , 1 , 4 );
			int temp_output_3_0_g4936 = ( clampResult8_g4936 - 1 );
			int Zone16_g4936 = temp_output_3_0_g4936;
			float3 localgetThemeData16_g4936 = getThemeData( Zone16_g4936 );
			int Band11_g4937 = 56;
			int localIsActive11_g4937 = IsActive11_g4937( Band11_g4937 );
			int temp_output_14_0_g4936 = localIsActive11_g4937;
			int lerpResult15_g4936 = lerp( temp_output_3_0_g4936 , ( 63 - temp_output_3_0_g4936 ) , (float)temp_output_14_0_g4936);
			int Band2_g4936 = lerpResult15_g4936;
			int Delay2_g4936 = 0;
			float3 localGlowData2_g4936 = GlowData2_g4936( Band2_g4936 , Delay2_g4936 );
			float3 lerpResult17_g4936 = lerp( ( localgetThemeData16_g4936 * localGlowData2_g4936 ) , localGlowData2_g4936 , (float)temp_output_14_0_g4936);
			int temp_output_21_0_g4930 = saturate( EmissionGlowZone47_g4930 );
			float3 lerpResult20_g4930 = lerp( temp_cast_3 , lerpResult17_g4936 , (float)temp_output_21_0_g4930);
			float3 temp_cast_7 = (1.0).xxx;
			int clampResult8_g4938 = clamp( EmissionGlowZone47_g4930 , 1 , 4 );
			int temp_output_3_0_g4938 = ( clampResult8_g4938 - 1 );
			int Zone15_g4938 = temp_output_3_0_g4938;
			float3 localgetThemeData15_g4938 = getThemeData( Zone15_g4938 );
			int Band11_g4939 = 56;
			int localIsActive11_g4939 = IsActive11_g4939( Band11_g4939 );
			int temp_output_13_0_g4938 = localIsActive11_g4939;
			int lerpResult14_g4938 = lerp( temp_output_3_0_g4938 , ( 63 - temp_output_3_0_g4938 ) , (float)temp_output_13_0_g4938);
			int Band11_g4938 = lerpResult14_g4938;
			float cos6_g4930 = cos( radians( _RedChGlowPulseDir ) );
			float sin6_g4930 = sin( radians( _RedChGlowPulseDir ) );
			float2 rotator6_g4930 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos6_g4930 , -sin6_g4930 , sin6_g4930 , cos6_g4930 )) + float2( 0.5,0.5 );
			int Band6_g4943 = _RedChGlowAnimationBand;
			int Mode6_g4943 = ( ( _RedChGlowAnimationMode * 2 ) + _RedChGlowAnimationSpeed );
			int localAudioLinkDecodeDataAsUInt6_g4943 = AudioLinkDecodeDataAsUInt6_g4943( Band6_g4943 , Mode6_g4943 );
			float localGetLocalTime2_g4944 = ( AudioLinkDecodeDataAsSeconds( ALPASS_GENERALVU_LOCAL_TIME ) );
			float lerpResult206_g4930 = lerp( ( ( localAudioLinkDecodeDataAsUInt6_g4943 % 628319 ) / 100000.0 ) , localGetLocalTime2_g4944 , (float)saturate( ( _RedChGlowAnimationMode - 3 ) ));
			float EmissionGlowAnimation195_g4930 = ( _RedChGlowAnimationStrength * lerpResult206_g4930 * step( _RedChGlowAnimationBand , 9 ) );
			float x13_g4930 = ( ( rotator6_g4930.x * _RedChGlowPulseScale ) + _RedChGlowPulseOffset + EmissionGlowAnimation195_g4930 );
			float y13_g4930 = 127.0;
			float localglslmod13_g4930 = glslmod13_g4930( x13_g4930 , y13_g4930 );
			float2 CenteredUV15_g4932 = ( i.uv_texcoord - _RedChGlowRadialCenter );
			float2 break17_g4932 = CenteredUV15_g4932;
			float2 appendResult23_g4932 = (float2(( length( CenteredUV15_g4932 ) * _RedChGlowPulseScale * 2.0 ) , ( atan2( break17_g4932.x , break17_g4932.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float x12_g4930 = ( _RedChGlowPulseOffset + appendResult23_g4932.x + EmissionGlowAnimation195_g4930 );
			float y12_g4930 = 127.0;
			float localglslmod12_g4930 = glslmod12_g4930( x12_g4930 , y12_g4930 );
			int EmissionGlowMode35_g4930 = _RedChGlowMode;
			int temp_output_37_0_g4930 = ( EmissionGlowMode35_g4930 - 1 );
			float lerpResult5_g4930 = lerp( localglslmod13_g4930 , localglslmod12_g4930 , (float)saturate( temp_output_37_0_g4930 ));
			float2 uv_DirectionalMap = i.uv_texcoord * _DirectionalMap_ST.xy + _DirectionalMap_ST.zw;
			float Direction27_g4913 = tex2D( _DirectionalMap, uv_DirectionalMap ).r;
			float DirectionalMap106_g4930 = Direction27_g4913;
			float lerpResult179_g4930 = lerp( DirectionalMap106_g4930 , ( 1.0 - DirectionalMap106_g4930 ) , (float)saturate( ( EmissionGlowMode35_g4930 - 3 ) ));
			float x34_g4930 = ( _RedChGlowPulseOffset + ( _RedChGlowPulseScale * lerpResult179_g4930 ) + EmissionGlowAnimation195_g4930 );
			float y34_g4930 = 127.0;
			float localglslmod34_g4930 = glslmod34_g4930( x34_g4930 , y34_g4930 );
			float lerpResult30_g4930 = lerp( lerpResult5_g4930 , localglslmod34_g4930 , (float)saturate( ( temp_output_37_0_g4930 - 1 ) ));
			float EmissionGlowDelay56_g4930 = lerpResult30_g4930;
			float Delay11_g4938 = EmissionGlowDelay56_g4930;
			float3 localGlowLerp11_g4938 = GlowLerp11_g4938( Band11_g4938 , Delay11_g4938 );
			float3 lerpResult17_g4938 = lerp( ( localgetThemeData15_g4938 * localGlowLerp11_g4938 ) , localGlowLerp11_g4938 , (float)temp_output_13_0_g4938);
			float3 lerpResult22_g4930 = lerp( temp_cast_7 , lerpResult17_g4938 , (float)temp_output_21_0_g4930);
			float3 lerpResult23_g4930 = lerp( lerpResult20_g4930 , lerpResult22_g4930 , (float)saturate( EmissionGlowMode35_g4930 ));
			float4 temp_cast_17 = (1.0).xxxx;
			float temp_output_10_0_g4940 = EmissionGlowDelay56_g4930;
			float Position1_g4942 = ( temp_output_10_0_g4940 / 127.0 );
			float4 localAudioLinkLerp1_g4942 = AudioLinkLerp1_g4942( Position1_g4942 );
			int clampResult8_g4940 = clamp( ( EmissionGlowZone47_g4930 - 4 ) , 1 , 3 );
			int Band11_g4940 = ( 59 - ( clampResult8_g4940 - 1 ) );
			float Delay11_g4940 = temp_output_10_0_g4940;
			float3 localGlowLerp11_g4940 = GlowLerp11_g4940( Band11_g4940 , Delay11_g4940 );
			int Band11_g4941 = 56;
			int localIsActive11_g4941 = IsActive11_g4941( Band11_g4941 );
			float4 lerpResult14_g4940 = lerp( localAudioLinkLerp1_g4942 , float4( localGlowLerp11_g4940 , 0.0 ) , (float)localIsActive11_g4941);
			float4 lerpResult52_g4930 = lerp( temp_cast_17 , lerpResult14_g4940 , (float)saturate( EmissionGlowZone47_g4930 ));
			float4 lerpResult51_g4930 = lerp( float4( lerpResult23_g4930 , 0.0 ) , lerpResult52_g4930 , (float)saturate( ( EmissionGlowZone47_g4930 - 4 ) ));
			float4 temp_cast_22 = (_RedChGlowMinBrightness).xxxx;
			float4 temp_cast_23 = (( _RedChGlowMinBrightness + 1.0 )).xxxx;
			int temp_output_254_0_g4930 = saturate( EmissionGlowZone47_g4930 );
			float4 EmissionGlow142_g4930 = ( (temp_cast_22 + (lerpResult51_g4930 - float4( 0,0,0,0 )) * (temp_cast_23 - temp_cast_22) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 ))) * _RedChGlowTint * temp_output_254_0_g4930 );
			float4 lerpResult257_g4930 = lerp( temp_cast_2 , EmissionGlow142_g4930 , (float)temp_output_254_0_g4930);
			float4 EmissionGlowTog258_g4930 = lerpResult257_g4930;
			int EmissionReactiveBand243_g4930 = _RedChReactiveBand;
			int Band3_g4931 = EmissionReactiveBand243_g4930;
			int Delay3_g4931 = 0;
			float localAudioLinkData3_g4931 = AudioLinkData3_g4931( Band3_g4931 , Delay3_g4931 );
			int temp_output_64_0_g4930 = step( _RedChReactiveBand , 9 );
			float lerpResult66_g4930 = lerp( 1.0 , localAudioLinkData3_g4931 , (float)temp_output_64_0_g4930);
			int Band3_g4933 = _RedChReactiveBand;
			float cos78_g4930 = cos( radians( _RedChReactivePulseDir ) );
			float sin78_g4930 = sin( radians( _RedChReactivePulseDir ) );
			float2 rotator78_g4930 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos78_g4930 , -sin78_g4930 , sin78_g4930 , cos78_g4930 )) + float2( 0.5,0.5 );
			float x96_g4930 = ( ( rotator78_g4930.x * _RedChReactivePulseScale ) + _RedChReactivePulseOffset );
			float y96_g4930 = 127.0;
			float localglslmod96_g4930 = glslmod96_g4930( x96_g4930 , y96_g4930 );
			float2 CenteredUV15_g4934 = ( i.uv_texcoord - _RedChReactiveRadialCenter );
			float2 break17_g4934 = CenteredUV15_g4934;
			float2 appendResult23_g4934 = (float2(( length( CenteredUV15_g4934 ) * _RedChReactivePulseScale * 2.0 ) , ( atan2( break17_g4934.x , break17_g4934.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float x97_g4930 = ( _RedChReactivePulseOffset + appendResult23_g4934.x );
			float y97_g4930 = 127.0;
			float localglslmod97_g4930 = glslmod97_g4930( x97_g4930 , y97_g4930 );
			int EmissionReactiveMode99_g4930 = _RedChReactiveMode;
			int temp_output_90_0_g4930 = ( EmissionReactiveMode99_g4930 - 1 );
			float lerpResult77_g4930 = lerp( localglslmod96_g4930 , localglslmod97_g4930 , (float)saturate( temp_output_90_0_g4930 ));
			float lerpResult174_g4930 = lerp( DirectionalMap106_g4930 , ( 1.0 - DirectionalMap106_g4930 ) , (float)saturate( ( EmissionReactiveMode99_g4930 - 3 ) ));
			float x98_g4930 = ( _RedChReactivePulseOffset + ( _RedChReactivePulseScale * lerpResult174_g4930 ) );
			float y98_g4930 = 127.0;
			float localglslmod98_g4930 = glslmod98_g4930( x98_g4930 , y98_g4930 );
			float lerpResult87_g4930 = lerp( lerpResult77_g4930 , localglslmod98_g4930 , (float)saturate( ( temp_output_90_0_g4930 - 1 ) ));
			float Delay3_g4933 = lerpResult87_g4930;
			float localAudioLinkLerp3_g4933 = AudioLinkLerp3_g4933( Band3_g4933 , Delay3_g4933 );
			float lerpResult102_g4930 = lerp( 1.0 , localAudioLinkLerp3_g4933 , (float)temp_output_64_0_g4930);
			float lerpResult103_g4930 = lerp( lerpResult66_g4930 , lerpResult102_g4930 , (float)saturate( EmissionReactiveMode99_g4930 ));
			int Band3_g4935 = _RedChReactiveBand;
			float FilteredAmount3_g4935 = ( ( 1.0 - _RedChReactiveGlobalSmoothing ) * 15.0 );
			float localAudioLinkLerp3_g4935 = AudioLinkLerp3_g4935( Band3_g4935 , FilteredAmount3_g4935 );
			float lerpResult168_g4930 = lerp( 1.0 , localAudioLinkLerp3_g4935 , (float)temp_output_64_0_g4930);
			float lerpResult172_g4930 = lerp( lerpResult103_g4930 , lerpResult168_g4930 , (float)saturate( ( EmissionReactiveMode99_g4930 - 4 ) ));
			float ReactivityAlpha132_g4930 = (_RedChReactiveMinBrightness + (lerpResult172_g4930 - 0.0) * (( _RedChReactiveMinBrightness + 1.0 ) - _RedChReactiveMinBrightness) / (1.0 - 0.0));
			float4 temp_cast_34 = (1.0).xxxx;
			float4 lerpResult253_g4930 = lerp( temp_cast_34 , _RedChReactiveTint , (float)step( EmissionReactiveBand243_g4930 , 9 ));
			float4 FinalReactivity68_g4930 = ( ReactivityAlpha132_g4930 * lerpResult253_g4930 );
			float4 lerpResult146_g4930 = lerp( ( EmissionGlowTog258_g4930 * FinalReactivity68_g4930 ) , ( EmissionGlow142_g4930 + FinalReactivity68_g4930 ) , (float)saturate( _RedChReactiveBlendMode ));
			float4 ReversedReactivity152_g4930 = ( ( 1.0 - ReactivityAlpha132_g4930 ) * lerpResult253_g4930 );
			int temp_output_157_0_g4930 = ( _RedChReactiveBlendMode - 1 );
			float4 lerpResult114_g4930 = lerp( lerpResult146_g4930 , ( EmissionGlowTog258_g4930 * ReversedReactivity152_g4930 ) , (float)saturate( temp_output_157_0_g4930 ));
			float4 lerpResult164_g4930 = lerp( lerpResult114_g4930 , ( EmissionGlow142_g4930 + ( ReversedReactivity152_g4930 * step( EmissionReactiveBand243_g4930 , 9 ) ) ) , (float)max( saturate( ( temp_output_157_0_g4930 - 1 ) ) , ( 1.0 - step( EmissionReactiveBand243_g4930 , 9 ) ) ));
			float2 uv_GlowMask = i.uv_texcoord * _GlowMask_ST.xy + _GlowMask_ST.zw;
			float4 GlowMaskRGBA174_g4913 = tex2D( _GlowMask, uv_GlowMask );
			float localIfAudioLinkv2Exists1_g4945 = IfAudioLinkv2Exists1_g4945();
			float4 lerpResult280_g4930 = lerp( float4( 0,0,0,0 ) , ( lerpResult164_g4930 * (GlowMaskRGBA174_g4913).ra.x * localIfAudioLinkv2Exists1_g4945 ) , _EnableRedChannel);
			float4 temp_cast_44 = (1.0).xxxx;
			float3 temp_cast_45 = (1.0).xxx;
			int EmissionGlowZone47_g4946 = _GreenChGlowZone;
			int clampResult8_g4952 = clamp( EmissionGlowZone47_g4946 , 1 , 4 );
			int temp_output_3_0_g4952 = ( clampResult8_g4952 - 1 );
			int Zone16_g4952 = temp_output_3_0_g4952;
			float3 localgetThemeData16_g4952 = getThemeData( Zone16_g4952 );
			int Band11_g4953 = 56;
			int localIsActive11_g4953 = IsActive11_g4953( Band11_g4953 );
			int temp_output_14_0_g4952 = localIsActive11_g4953;
			int lerpResult15_g4952 = lerp( temp_output_3_0_g4952 , ( 63 - temp_output_3_0_g4952 ) , (float)temp_output_14_0_g4952);
			int Band2_g4952 = lerpResult15_g4952;
			int Delay2_g4952 = 0;
			float3 localGlowData2_g4952 = GlowData2_g4952( Band2_g4952 , Delay2_g4952 );
			float3 lerpResult17_g4952 = lerp( ( localgetThemeData16_g4952 * localGlowData2_g4952 ) , localGlowData2_g4952 , (float)temp_output_14_0_g4952);
			int temp_output_21_0_g4946 = saturate( EmissionGlowZone47_g4946 );
			float3 lerpResult20_g4946 = lerp( temp_cast_45 , lerpResult17_g4952 , (float)temp_output_21_0_g4946);
			float3 temp_cast_49 = (1.0).xxx;
			int clampResult8_g4954 = clamp( EmissionGlowZone47_g4946 , 1 , 4 );
			int temp_output_3_0_g4954 = ( clampResult8_g4954 - 1 );
			int Zone15_g4954 = temp_output_3_0_g4954;
			float3 localgetThemeData15_g4954 = getThemeData( Zone15_g4954 );
			int Band11_g4955 = 56;
			int localIsActive11_g4955 = IsActive11_g4955( Band11_g4955 );
			int temp_output_13_0_g4954 = localIsActive11_g4955;
			int lerpResult14_g4954 = lerp( temp_output_3_0_g4954 , ( 63 - temp_output_3_0_g4954 ) , (float)temp_output_13_0_g4954);
			int Band11_g4954 = lerpResult14_g4954;
			float cos6_g4946 = cos( radians( _GreenChGlowPulseDir ) );
			float sin6_g4946 = sin( radians( _GreenChGlowPulseDir ) );
			float2 rotator6_g4946 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos6_g4946 , -sin6_g4946 , sin6_g4946 , cos6_g4946 )) + float2( 0.5,0.5 );
			int Band6_g4959 = _GreenChGlowAnimationBand;
			int Mode6_g4959 = ( ( _GreenChGlowAnimationMode * 2 ) + _GreenChGlowAnimationSpeed );
			int localAudioLinkDecodeDataAsUInt6_g4959 = AudioLinkDecodeDataAsUInt6_g4959( Band6_g4959 , Mode6_g4959 );
			float localGetLocalTime2_g4960 = ( AudioLinkDecodeDataAsSeconds( ALPASS_GENERALVU_LOCAL_TIME ) );
			float lerpResult206_g4946 = lerp( ( ( localAudioLinkDecodeDataAsUInt6_g4959 % 628319 ) / 100000.0 ) , localGetLocalTime2_g4960 , (float)saturate( ( _GreenChGlowAnimationMode - 3 ) ));
			float EmissionGlowAnimation195_g4946 = ( _GreenChGlowAnimationStrength * lerpResult206_g4946 * step( _GreenChGlowAnimationBand , 9 ) );
			float x13_g4946 = ( ( rotator6_g4946.x * _GreenChGlowPulseScale ) + _GreenChGlowPulseOffset + EmissionGlowAnimation195_g4946 );
			float y13_g4946 = 127.0;
			float localglslmod13_g4946 = glslmod13_g4946( x13_g4946 , y13_g4946 );
			float2 CenteredUV15_g4948 = ( i.uv_texcoord - _GreenChGlowRadialCenter );
			float2 break17_g4948 = CenteredUV15_g4948;
			float2 appendResult23_g4948 = (float2(( length( CenteredUV15_g4948 ) * _GreenChGlowPulseScale * 2.0 ) , ( atan2( break17_g4948.x , break17_g4948.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float x12_g4946 = ( _GreenChGlowPulseOffset + appendResult23_g4948.x + EmissionGlowAnimation195_g4946 );
			float y12_g4946 = 127.0;
			float localglslmod12_g4946 = glslmod12_g4946( x12_g4946 , y12_g4946 );
			int EmissionGlowMode35_g4946 = _GreenChGlowMode;
			int temp_output_37_0_g4946 = ( EmissionGlowMode35_g4946 - 1 );
			float lerpResult5_g4946 = lerp( localglslmod13_g4946 , localglslmod12_g4946 , (float)saturate( temp_output_37_0_g4946 ));
			float DirectionalMap106_g4946 = Direction27_g4913;
			float lerpResult179_g4946 = lerp( DirectionalMap106_g4946 , ( 1.0 - DirectionalMap106_g4946 ) , (float)saturate( ( EmissionGlowMode35_g4946 - 3 ) ));
			float x34_g4946 = ( _GreenChGlowPulseOffset + ( _GreenChGlowPulseScale * lerpResult179_g4946 ) + EmissionGlowAnimation195_g4946 );
			float y34_g4946 = 127.0;
			float localglslmod34_g4946 = glslmod34_g4946( x34_g4946 , y34_g4946 );
			float lerpResult30_g4946 = lerp( lerpResult5_g4946 , localglslmod34_g4946 , (float)saturate( ( temp_output_37_0_g4946 - 1 ) ));
			float EmissionGlowDelay56_g4946 = lerpResult30_g4946;
			float Delay11_g4954 = EmissionGlowDelay56_g4946;
			float3 localGlowLerp11_g4954 = GlowLerp11_g4954( Band11_g4954 , Delay11_g4954 );
			float3 lerpResult17_g4954 = lerp( ( localgetThemeData15_g4954 * localGlowLerp11_g4954 ) , localGlowLerp11_g4954 , (float)temp_output_13_0_g4954);
			float3 lerpResult22_g4946 = lerp( temp_cast_49 , lerpResult17_g4954 , (float)temp_output_21_0_g4946);
			float3 lerpResult23_g4946 = lerp( lerpResult20_g4946 , lerpResult22_g4946 , (float)saturate( EmissionGlowMode35_g4946 ));
			float4 temp_cast_59 = (1.0).xxxx;
			float temp_output_10_0_g4956 = EmissionGlowDelay56_g4946;
			float Position1_g4958 = ( temp_output_10_0_g4956 / 127.0 );
			float4 localAudioLinkLerp1_g4958 = AudioLinkLerp1_g4958( Position1_g4958 );
			int clampResult8_g4956 = clamp( ( EmissionGlowZone47_g4946 - 4 ) , 1 , 3 );
			int Band11_g4956 = ( 59 - ( clampResult8_g4956 - 1 ) );
			float Delay11_g4956 = temp_output_10_0_g4956;
			float3 localGlowLerp11_g4956 = GlowLerp11_g4956( Band11_g4956 , Delay11_g4956 );
			int Band11_g4957 = 56;
			int localIsActive11_g4957 = IsActive11_g4957( Band11_g4957 );
			float4 lerpResult14_g4956 = lerp( localAudioLinkLerp1_g4958 , float4( localGlowLerp11_g4956 , 0.0 ) , (float)localIsActive11_g4957);
			float4 lerpResult52_g4946 = lerp( temp_cast_59 , lerpResult14_g4956 , (float)saturate( EmissionGlowZone47_g4946 ));
			float4 lerpResult51_g4946 = lerp( float4( lerpResult23_g4946 , 0.0 ) , lerpResult52_g4946 , (float)saturate( ( EmissionGlowZone47_g4946 - 4 ) ));
			float4 temp_cast_64 = (_GreenChGlowMinBrightness).xxxx;
			float4 temp_cast_65 = (( _GreenChGlowMinBrightness + 1.0 )).xxxx;
			int temp_output_255_0_g4946 = saturate( EmissionGlowZone47_g4946 );
			float4 EmissionGlow142_g4946 = ( (temp_cast_64 + (lerpResult51_g4946 - float4( 0,0,0,0 )) * (temp_cast_65 - temp_cast_64) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 ))) * _GreenChGlowTint * temp_output_255_0_g4946 );
			float4 lerpResult258_g4946 = lerp( temp_cast_44 , EmissionGlow142_g4946 , (float)temp_output_255_0_g4946);
			float4 EmissionGlowTog259_g4946 = lerpResult258_g4946;
			int EmissionReactiveBand243_g4946 = _GreenChReactiveBand;
			int Band3_g4947 = EmissionReactiveBand243_g4946;
			int Delay3_g4947 = 0;
			float localAudioLinkData3_g4947 = AudioLinkData3_g4947( Band3_g4947 , Delay3_g4947 );
			int temp_output_64_0_g4946 = step( _GreenChReactiveBand , 9 );
			float lerpResult66_g4946 = lerp( 1.0 , localAudioLinkData3_g4947 , (float)temp_output_64_0_g4946);
			int Band3_g4949 = _GreenChReactiveBand;
			float cos78_g4946 = cos( radians( _GreenChReactivePulseDir ) );
			float sin78_g4946 = sin( radians( _GreenChReactivePulseDir ) );
			float2 rotator78_g4946 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos78_g4946 , -sin78_g4946 , sin78_g4946 , cos78_g4946 )) + float2( 0.5,0.5 );
			float x96_g4946 = ( ( rotator78_g4946.x * _GreenChReactivePulseScale ) + _GreenChReactivePulseOffset );
			float y96_g4946 = 127.0;
			float localglslmod96_g4946 = glslmod96_g4946( x96_g4946 , y96_g4946 );
			float2 CenteredUV15_g4950 = ( i.uv_texcoord - _GreenChReactiveRadialCenter );
			float2 break17_g4950 = CenteredUV15_g4950;
			float2 appendResult23_g4950 = (float2(( length( CenteredUV15_g4950 ) * _GreenChReactivePulseScale * 2.0 ) , ( atan2( break17_g4950.x , break17_g4950.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float x97_g4946 = ( _GreenChReactivePulseOffset + appendResult23_g4950.x );
			float y97_g4946 = 127.0;
			float localglslmod97_g4946 = glslmod97_g4946( x97_g4946 , y97_g4946 );
			int EmissionReactiveMode99_g4946 = _GreenChReactiveMode;
			int temp_output_90_0_g4946 = ( EmissionReactiveMode99_g4946 - 1 );
			float lerpResult77_g4946 = lerp( localglslmod96_g4946 , localglslmod97_g4946 , (float)saturate( temp_output_90_0_g4946 ));
			float lerpResult174_g4946 = lerp( DirectionalMap106_g4946 , ( 1.0 - DirectionalMap106_g4946 ) , (float)saturate( ( EmissionReactiveMode99_g4946 - 3 ) ));
			float x98_g4946 = ( _GreenChReactivePulseOffset + ( _GreenChReactivePulseScale * lerpResult174_g4946 ) );
			float y98_g4946 = 127.0;
			float localglslmod98_g4946 = glslmod98_g4946( x98_g4946 , y98_g4946 );
			float lerpResult87_g4946 = lerp( lerpResult77_g4946 , localglslmod98_g4946 , (float)saturate( ( temp_output_90_0_g4946 - 1 ) ));
			float Delay3_g4949 = lerpResult87_g4946;
			float localAudioLinkLerp3_g4949 = AudioLinkLerp3_g4949( Band3_g4949 , Delay3_g4949 );
			float lerpResult102_g4946 = lerp( 1.0 , localAudioLinkLerp3_g4949 , (float)temp_output_64_0_g4946);
			float lerpResult103_g4946 = lerp( lerpResult66_g4946 , lerpResult102_g4946 , (float)saturate( EmissionReactiveMode99_g4946 ));
			int Band3_g4951 = _GreenChReactiveBand;
			float FilteredAmount3_g4951 = ( ( 1.0 - _GreenChReactiveGlobalSmoothing ) * 15.0 );
			float localAudioLinkLerp3_g4951 = AudioLinkLerp3_g4951( Band3_g4951 , FilteredAmount3_g4951 );
			float lerpResult168_g4946 = lerp( 1.0 , localAudioLinkLerp3_g4951 , (float)temp_output_64_0_g4946);
			float lerpResult172_g4946 = lerp( lerpResult103_g4946 , lerpResult168_g4946 , (float)saturate( ( EmissionReactiveMode99_g4946 - 4 ) ));
			float ReactivityAlpha132_g4946 = (_GreenChReactiveMinBrightness + (lerpResult172_g4946 - 0.0) * (( _GreenChReactiveMinBrightness + 1.0 ) - _GreenChReactiveMinBrightness) / (1.0 - 0.0));
			float4 temp_cast_76 = (1.0).xxxx;
			float4 lerpResult264_g4946 = lerp( temp_cast_76 , _GreenChReactiveTint , (float)step( EmissionReactiveBand243_g4946 , 9 ));
			float4 FinalReactivity68_g4946 = ( ReactivityAlpha132_g4946 * lerpResult264_g4946 );
			float4 lerpResult146_g4946 = lerp( ( EmissionGlowTog259_g4946 * FinalReactivity68_g4946 ) , ( EmissionGlow142_g4946 + FinalReactivity68_g4946 ) , (float)saturate( _GreenChReactiveBlendMode ));
			float4 ReversedReactivity152_g4946 = ( ( 1.0 - ReactivityAlpha132_g4946 ) * lerpResult264_g4946 );
			int temp_output_157_0_g4946 = ( _GreenChReactiveBlendMode - 1 );
			float4 lerpResult114_g4946 = lerp( lerpResult146_g4946 , ( EmissionGlowTog259_g4946 * ReversedReactivity152_g4946 ) , (float)saturate( temp_output_157_0_g4946 ));
			float4 lerpResult164_g4946 = lerp( lerpResult114_g4946 , ( EmissionGlow142_g4946 + ( ReversedReactivity152_g4946 * step( EmissionReactiveBand243_g4946 , 9 ) ) ) , (float)max( saturate( ( temp_output_157_0_g4946 - 1 ) ) , ( 1.0 - step( EmissionReactiveBand243_g4946 , 9 ) ) ));
			float localIfAudioLinkv2Exists1_g4961 = IfAudioLinkv2Exists1_g4961();
			float4 lerpResult276_g4946 = lerp( float4( 0,0,0,0 ) , ( lerpResult164_g4946 * (GlowMaskRGBA174_g4913).ga.x * localIfAudioLinkv2Exists1_g4961 ) , _EnableGreenChannel);
			float4 temp_cast_86 = (1.0).xxxx;
			float3 temp_cast_87 = (1.0).xxx;
			int EmissionGlowZone47_g4962 = _BlueChGlowZone;
			int clampResult8_g4968 = clamp( EmissionGlowZone47_g4962 , 1 , 4 );
			int temp_output_3_0_g4968 = ( clampResult8_g4968 - 1 );
			int Zone16_g4968 = temp_output_3_0_g4968;
			float3 localgetThemeData16_g4968 = getThemeData( Zone16_g4968 );
			int Band11_g4969 = 56;
			int localIsActive11_g4969 = IsActive11_g4969( Band11_g4969 );
			int temp_output_14_0_g4968 = localIsActive11_g4969;
			int lerpResult15_g4968 = lerp( temp_output_3_0_g4968 , ( 63 - temp_output_3_0_g4968 ) , (float)temp_output_14_0_g4968);
			int Band2_g4968 = lerpResult15_g4968;
			int Delay2_g4968 = 0;
			float3 localGlowData2_g4968 = GlowData2_g4968( Band2_g4968 , Delay2_g4968 );
			float3 lerpResult17_g4968 = lerp( ( localgetThemeData16_g4968 * localGlowData2_g4968 ) , localGlowData2_g4968 , (float)temp_output_14_0_g4968);
			int temp_output_21_0_g4962 = saturate( EmissionGlowZone47_g4962 );
			float3 lerpResult20_g4962 = lerp( temp_cast_87 , lerpResult17_g4968 , (float)temp_output_21_0_g4962);
			float3 temp_cast_91 = (1.0).xxx;
			int clampResult8_g4970 = clamp( EmissionGlowZone47_g4962 , 1 , 4 );
			int temp_output_3_0_g4970 = ( clampResult8_g4970 - 1 );
			int Zone15_g4970 = temp_output_3_0_g4970;
			float3 localgetThemeData15_g4970 = getThemeData( Zone15_g4970 );
			int Band11_g4971 = 56;
			int localIsActive11_g4971 = IsActive11_g4971( Band11_g4971 );
			int temp_output_13_0_g4970 = localIsActive11_g4971;
			int lerpResult14_g4970 = lerp( temp_output_3_0_g4970 , ( 63 - temp_output_3_0_g4970 ) , (float)temp_output_13_0_g4970);
			int Band11_g4970 = lerpResult14_g4970;
			float cos6_g4962 = cos( radians( _BlueChGlowPulseDir ) );
			float sin6_g4962 = sin( radians( _BlueChGlowPulseDir ) );
			float2 rotator6_g4962 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos6_g4962 , -sin6_g4962 , sin6_g4962 , cos6_g4962 )) + float2( 0.5,0.5 );
			int Band6_g4975 = _BlueChGlowAnimationBand;
			int Mode6_g4975 = ( ( _BlueChGlowAnimationMode * 2 ) + _BlueChGlowAnimationSpeed );
			int localAudioLinkDecodeDataAsUInt6_g4975 = AudioLinkDecodeDataAsUInt6_g4975( Band6_g4975 , Mode6_g4975 );
			float localGetLocalTime2_g4976 = ( AudioLinkDecodeDataAsSeconds( ALPASS_GENERALVU_LOCAL_TIME ) );
			float lerpResult206_g4962 = lerp( ( ( localAudioLinkDecodeDataAsUInt6_g4975 % 628319 ) / 100000.0 ) , localGetLocalTime2_g4976 , (float)saturate( ( _BlueChGlowAnimationMode - 3 ) ));
			float EmissionGlowAnimation195_g4962 = ( _BlueChGlowAnimationStrength * lerpResult206_g4962 * step( _BlueChGlowAnimationBand , 9 ) );
			float x13_g4962 = ( ( rotator6_g4962.x * _BlueChGlowPulseScale ) + _BlueChGlowPulseOffset + EmissionGlowAnimation195_g4962 );
			float y13_g4962 = 127.0;
			float localglslmod13_g4962 = glslmod13_g4962( x13_g4962 , y13_g4962 );
			float2 CenteredUV15_g4964 = ( i.uv_texcoord - _BlueChGlowRadialCenter );
			float2 break17_g4964 = CenteredUV15_g4964;
			float2 appendResult23_g4964 = (float2(( length( CenteredUV15_g4964 ) * _BlueChGlowPulseScale * 2.0 ) , ( atan2( break17_g4964.x , break17_g4964.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float x12_g4962 = ( _BlueChGlowPulseOffset + appendResult23_g4964.x + EmissionGlowAnimation195_g4962 );
			float y12_g4962 = 127.0;
			float localglslmod12_g4962 = glslmod12_g4962( x12_g4962 , y12_g4962 );
			int EmissionGlowMode35_g4962 = _BlueChGlowMode;
			int temp_output_37_0_g4962 = ( EmissionGlowMode35_g4962 - 1 );
			float lerpResult5_g4962 = lerp( localglslmod13_g4962 , localglslmod12_g4962 , (float)saturate( temp_output_37_0_g4962 ));
			float DirectionalMap106_g4962 = Direction27_g4913;
			float lerpResult179_g4962 = lerp( DirectionalMap106_g4962 , ( 1.0 - DirectionalMap106_g4962 ) , (float)saturate( ( EmissionGlowMode35_g4962 - 3 ) ));
			float x34_g4962 = ( _BlueChGlowPulseOffset + ( _BlueChGlowPulseScale * lerpResult179_g4962 ) + EmissionGlowAnimation195_g4962 );
			float y34_g4962 = 127.0;
			float localglslmod34_g4962 = glslmod34_g4962( x34_g4962 , y34_g4962 );
			float lerpResult30_g4962 = lerp( lerpResult5_g4962 , localglslmod34_g4962 , (float)saturate( ( temp_output_37_0_g4962 - 1 ) ));
			float EmissionGlowDelay56_g4962 = lerpResult30_g4962;
			float Delay11_g4970 = EmissionGlowDelay56_g4962;
			float3 localGlowLerp11_g4970 = GlowLerp11_g4970( Band11_g4970 , Delay11_g4970 );
			float3 lerpResult17_g4970 = lerp( ( localgetThemeData15_g4970 * localGlowLerp11_g4970 ) , localGlowLerp11_g4970 , (float)temp_output_13_0_g4970);
			float3 lerpResult22_g4962 = lerp( temp_cast_91 , lerpResult17_g4970 , (float)temp_output_21_0_g4962);
			float3 lerpResult23_g4962 = lerp( lerpResult20_g4962 , lerpResult22_g4962 , (float)saturate( EmissionGlowMode35_g4962 ));
			float4 temp_cast_101 = (1.0).xxxx;
			float temp_output_10_0_g4972 = EmissionGlowDelay56_g4962;
			float Position1_g4974 = ( temp_output_10_0_g4972 / 127.0 );
			float4 localAudioLinkLerp1_g4974 = AudioLinkLerp1_g4974( Position1_g4974 );
			int clampResult8_g4972 = clamp( ( EmissionGlowZone47_g4962 - 4 ) , 1 , 3 );
			int Band11_g4972 = ( 59 - ( clampResult8_g4972 - 1 ) );
			float Delay11_g4972 = temp_output_10_0_g4972;
			float3 localGlowLerp11_g4972 = GlowLerp11_g4972( Band11_g4972 , Delay11_g4972 );
			int Band11_g4973 = 56;
			int localIsActive11_g4973 = IsActive11_g4973( Band11_g4973 );
			float4 lerpResult14_g4972 = lerp( localAudioLinkLerp1_g4974 , float4( localGlowLerp11_g4972 , 0.0 ) , (float)localIsActive11_g4973);
			float4 lerpResult52_g4962 = lerp( temp_cast_101 , lerpResult14_g4972 , (float)saturate( EmissionGlowZone47_g4962 ));
			float4 lerpResult51_g4962 = lerp( float4( lerpResult23_g4962 , 0.0 ) , lerpResult52_g4962 , (float)saturate( ( EmissionGlowZone47_g4962 - 4 ) ));
			float4 temp_cast_106 = (_BlueChGlowMinBrightness).xxxx;
			float4 temp_cast_107 = (( _BlueChGlowMinBrightness + 1.0 )).xxxx;
			int temp_output_258_0_g4962 = saturate( EmissionGlowZone47_g4962 );
			float4 EmissionGlow142_g4962 = ( (temp_cast_106 + (lerpResult51_g4962 - float4( 0,0,0,0 )) * (temp_cast_107 - temp_cast_106) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 ))) * _BlueChGlowTint * temp_output_258_0_g4962 );
			float4 lerpResult261_g4962 = lerp( temp_cast_86 , EmissionGlow142_g4962 , (float)temp_output_258_0_g4962);
			float4 EmissionGlowTog262_g4962 = lerpResult261_g4962;
			int EmissionReactiveBand243_g4962 = _BlueChReactiveBand;
			int Band3_g4963 = EmissionReactiveBand243_g4962;
			int Delay3_g4963 = 0;
			float localAudioLinkData3_g4963 = AudioLinkData3_g4963( Band3_g4963 , Delay3_g4963 );
			int temp_output_64_0_g4962 = step( _BlueChReactiveBand , 9 );
			float lerpResult66_g4962 = lerp( 1.0 , localAudioLinkData3_g4963 , (float)temp_output_64_0_g4962);
			int Band3_g4965 = _BlueChReactiveBand;
			float cos78_g4962 = cos( radians( _BlueChReactivePulseDir ) );
			float sin78_g4962 = sin( radians( _BlueChReactivePulseDir ) );
			float2 rotator78_g4962 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos78_g4962 , -sin78_g4962 , sin78_g4962 , cos78_g4962 )) + float2( 0.5,0.5 );
			float x96_g4962 = ( ( rotator78_g4962.x * _BlueChReactivePulseScale ) + _BlueChReactivePulseOffset );
			float y96_g4962 = 127.0;
			float localglslmod96_g4962 = glslmod96_g4962( x96_g4962 , y96_g4962 );
			float2 CenteredUV15_g4966 = ( i.uv_texcoord - _BlueChReactiveRadialCenter );
			float2 break17_g4966 = CenteredUV15_g4966;
			float2 appendResult23_g4966 = (float2(( length( CenteredUV15_g4966 ) * _BlueChReactivePulseScale * 2.0 ) , ( atan2( break17_g4966.x , break17_g4966.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float x97_g4962 = ( _BlueChReactivePulseOffset + appendResult23_g4966.x );
			float y97_g4962 = 127.0;
			float localglslmod97_g4962 = glslmod97_g4962( x97_g4962 , y97_g4962 );
			int EmissionReactiveMode99_g4962 = _BlueChReactiveMode;
			int temp_output_90_0_g4962 = ( EmissionReactiveMode99_g4962 - 1 );
			float lerpResult77_g4962 = lerp( localglslmod96_g4962 , localglslmod97_g4962 , (float)saturate( temp_output_90_0_g4962 ));
			float lerpResult174_g4962 = lerp( DirectionalMap106_g4962 , ( 1.0 - DirectionalMap106_g4962 ) , (float)saturate( ( EmissionReactiveMode99_g4962 - 3 ) ));
			float x98_g4962 = ( _BlueChReactivePulseOffset + ( _BlueChReactivePulseScale * lerpResult174_g4962 ) );
			float y98_g4962 = 127.0;
			float localglslmod98_g4962 = glslmod98_g4962( x98_g4962 , y98_g4962 );
			float lerpResult87_g4962 = lerp( lerpResult77_g4962 , localglslmod98_g4962 , (float)saturate( ( temp_output_90_0_g4962 - 1 ) ));
			float Delay3_g4965 = lerpResult87_g4962;
			float localAudioLinkLerp3_g4965 = AudioLinkLerp3_g4965( Band3_g4965 , Delay3_g4965 );
			float lerpResult102_g4962 = lerp( 1.0 , localAudioLinkLerp3_g4965 , (float)temp_output_64_0_g4962);
			float lerpResult103_g4962 = lerp( lerpResult66_g4962 , lerpResult102_g4962 , (float)saturate( EmissionReactiveMode99_g4962 ));
			int Band3_g4967 = _BlueChReactiveBand;
			float FilteredAmount3_g4967 = ( ( 1.0 - _BlueChReactiveGlobalSmoothing ) * 15.0 );
			float localAudioLinkLerp3_g4967 = AudioLinkLerp3_g4967( Band3_g4967 , FilteredAmount3_g4967 );
			float lerpResult168_g4962 = lerp( 1.0 , localAudioLinkLerp3_g4967 , (float)temp_output_64_0_g4962);
			float lerpResult172_g4962 = lerp( lerpResult103_g4962 , lerpResult168_g4962 , (float)saturate( ( EmissionReactiveMode99_g4962 - 4 ) ));
			float ReactivityAlpha132_g4962 = (_BlueChReactiveMinBrightness + (lerpResult172_g4962 - 0.0) * (( _BlueChReactiveMinBrightness + 1.0 ) - _BlueChReactiveMinBrightness) / (1.0 - 0.0));
			float4 temp_cast_118 = (1.0).xxxx;
			float4 lerpResult268_g4962 = lerp( temp_cast_118 , _BlueChReactiveTint , (float)step( EmissionReactiveBand243_g4962 , 9 ));
			float4 FinalReactivity68_g4962 = ( ReactivityAlpha132_g4962 * lerpResult268_g4962 );
			float4 lerpResult146_g4962 = lerp( ( EmissionGlowTog262_g4962 * FinalReactivity68_g4962 ) , ( EmissionGlow142_g4962 + FinalReactivity68_g4962 ) , (float)saturate( _BlueChReactiveBlendMode ));
			float4 ReversedReactivity152_g4962 = ( ( 1.0 - ReactivityAlpha132_g4962 ) * lerpResult268_g4962 );
			int temp_output_157_0_g4962 = ( _BlueChReactiveBlendMode - 1 );
			float4 lerpResult114_g4962 = lerp( lerpResult146_g4962 , ( EmissionGlowTog262_g4962 * ReversedReactivity152_g4962 ) , (float)saturate( temp_output_157_0_g4962 ));
			float4 lerpResult164_g4962 = lerp( lerpResult114_g4962 , ( EmissionGlow142_g4962 + ( ReversedReactivity152_g4962 * step( EmissionReactiveBand243_g4962 , 9 ) ) ) , (float)max( saturate( ( temp_output_157_0_g4962 - 1 ) ) , ( 1.0 - step( EmissionReactiveBand243_g4962 , 9 ) ) ));
			float localIfAudioLinkv2Exists1_g4977 = IfAudioLinkv2Exists1_g4977();
			float4 lerpResult278_g4962 = lerp( float4( 0,0,0,0 ) , ( lerpResult164_g4962 * (GlowMaskRGBA174_g4913).ba.x * localIfAudioLinkv2Exists1_g4977 ) , _EnableBlueChannel);
			float4 temp_cast_128 = (1.0).xxxx;
			float3 temp_cast_129 = (1.0).xxx;
			int EmissionGlowZone47_g4978 = _AlphaChGlowZone;
			int clampResult8_g4984 = clamp( EmissionGlowZone47_g4978 , 1 , 4 );
			int temp_output_3_0_g4984 = ( clampResult8_g4984 - 1 );
			int Zone16_g4984 = temp_output_3_0_g4984;
			float3 localgetThemeData16_g4984 = getThemeData( Zone16_g4984 );
			int Band11_g4985 = 56;
			int localIsActive11_g4985 = IsActive11_g4985( Band11_g4985 );
			int temp_output_14_0_g4984 = localIsActive11_g4985;
			int lerpResult15_g4984 = lerp( temp_output_3_0_g4984 , ( 63 - temp_output_3_0_g4984 ) , (float)temp_output_14_0_g4984);
			int Band2_g4984 = lerpResult15_g4984;
			int Delay2_g4984 = 0;
			float3 localGlowData2_g4984 = GlowData2_g4984( Band2_g4984 , Delay2_g4984 );
			float3 lerpResult17_g4984 = lerp( ( localgetThemeData16_g4984 * localGlowData2_g4984 ) , localGlowData2_g4984 , (float)temp_output_14_0_g4984);
			int temp_output_21_0_g4978 = saturate( EmissionGlowZone47_g4978 );
			float3 lerpResult20_g4978 = lerp( temp_cast_129 , lerpResult17_g4984 , (float)temp_output_21_0_g4978);
			float3 temp_cast_133 = (1.0).xxx;
			int clampResult8_g4986 = clamp( EmissionGlowZone47_g4978 , 1 , 4 );
			int temp_output_3_0_g4986 = ( clampResult8_g4986 - 1 );
			int Zone15_g4986 = temp_output_3_0_g4986;
			float3 localgetThemeData15_g4986 = getThemeData( Zone15_g4986 );
			int Band11_g4987 = 56;
			int localIsActive11_g4987 = IsActive11_g4987( Band11_g4987 );
			int temp_output_13_0_g4986 = localIsActive11_g4987;
			int lerpResult14_g4986 = lerp( temp_output_3_0_g4986 , ( 63 - temp_output_3_0_g4986 ) , (float)temp_output_13_0_g4986);
			int Band11_g4986 = lerpResult14_g4986;
			float cos6_g4978 = cos( radians( _AlphaChGlowPulseDir ) );
			float sin6_g4978 = sin( radians( _AlphaChGlowPulseDir ) );
			float2 rotator6_g4978 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos6_g4978 , -sin6_g4978 , sin6_g4978 , cos6_g4978 )) + float2( 0.5,0.5 );
			int Band6_g4991 = _AlphaChGlowAnimationBand;
			int Mode6_g4991 = ( ( _AlphaChGlowAnimationMode * 2 ) + _AlphaChGlowAnimationSpeed );
			int localAudioLinkDecodeDataAsUInt6_g4991 = AudioLinkDecodeDataAsUInt6_g4991( Band6_g4991 , Mode6_g4991 );
			float localGetLocalTime2_g4992 = ( AudioLinkDecodeDataAsSeconds( ALPASS_GENERALVU_LOCAL_TIME ) );
			float lerpResult206_g4978 = lerp( ( ( localAudioLinkDecodeDataAsUInt6_g4991 % 628319 ) / 100000.0 ) , localGetLocalTime2_g4992 , (float)saturate( ( _AlphaChGlowAnimationMode - 3 ) ));
			float EmissionGlowAnimation195_g4978 = ( _AlphaChGlowAnimationStrength * lerpResult206_g4978 * step( _AlphaChGlowAnimationBand , 9 ) );
			float x13_g4978 = ( ( rotator6_g4978.x * _AlphaChGlowPulseScale ) + _AlphaChGlowPulseOffset + EmissionGlowAnimation195_g4978 );
			float y13_g4978 = 127.0;
			float localglslmod13_g4978 = glslmod13_g4978( x13_g4978 , y13_g4978 );
			float2 CenteredUV15_g4980 = ( i.uv_texcoord - _AlphaChGlowRadialCenter );
			float2 break17_g4980 = CenteredUV15_g4980;
			float2 appendResult23_g4980 = (float2(( length( CenteredUV15_g4980 ) * _AlphaChGlowPulseScale * 2.0 ) , ( atan2( break17_g4980.x , break17_g4980.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float x12_g4978 = ( _AlphaChGlowPulseOffset + appendResult23_g4980.x + EmissionGlowAnimation195_g4978 );
			float y12_g4978 = 127.0;
			float localglslmod12_g4978 = glslmod12_g4978( x12_g4978 , y12_g4978 );
			int EmissionGlowMode35_g4978 = _AlphaChGlowMode;
			int temp_output_37_0_g4978 = ( EmissionGlowMode35_g4978 - 1 );
			float lerpResult5_g4978 = lerp( localglslmod13_g4978 , localglslmod12_g4978 , (float)saturate( temp_output_37_0_g4978 ));
			float DirectionalMap106_g4978 = Direction27_g4913;
			float lerpResult179_g4978 = lerp( DirectionalMap106_g4978 , ( 1.0 - DirectionalMap106_g4978 ) , (float)saturate( ( EmissionGlowMode35_g4978 - 3 ) ));
			float x34_g4978 = ( _AlphaChGlowPulseOffset + ( _AlphaChGlowPulseScale * lerpResult179_g4978 ) + EmissionGlowAnimation195_g4978 );
			float y34_g4978 = 127.0;
			float localglslmod34_g4978 = glslmod34_g4978( x34_g4978 , y34_g4978 );
			float lerpResult30_g4978 = lerp( lerpResult5_g4978 , localglslmod34_g4978 , (float)saturate( ( temp_output_37_0_g4978 - 1 ) ));
			float EmissionGlowDelay56_g4978 = lerpResult30_g4978;
			float Delay11_g4986 = EmissionGlowDelay56_g4978;
			float3 localGlowLerp11_g4986 = GlowLerp11_g4986( Band11_g4986 , Delay11_g4986 );
			float3 lerpResult17_g4986 = lerp( ( localgetThemeData15_g4986 * localGlowLerp11_g4986 ) , localGlowLerp11_g4986 , (float)temp_output_13_0_g4986);
			float3 lerpResult22_g4978 = lerp( temp_cast_133 , lerpResult17_g4986 , (float)temp_output_21_0_g4978);
			float3 lerpResult23_g4978 = lerp( lerpResult20_g4978 , lerpResult22_g4978 , (float)saturate( EmissionGlowMode35_g4978 ));
			float4 temp_cast_143 = (1.0).xxxx;
			float temp_output_10_0_g4988 = EmissionGlowDelay56_g4978;
			float Position1_g4990 = ( temp_output_10_0_g4988 / 127.0 );
			float4 localAudioLinkLerp1_g4990 = AudioLinkLerp1_g4990( Position1_g4990 );
			int clampResult8_g4988 = clamp( ( EmissionGlowZone47_g4978 - 4 ) , 1 , 3 );
			int Band11_g4988 = ( 59 - ( clampResult8_g4988 - 1 ) );
			float Delay11_g4988 = temp_output_10_0_g4988;
			float3 localGlowLerp11_g4988 = GlowLerp11_g4988( Band11_g4988 , Delay11_g4988 );
			int Band11_g4989 = 56;
			int localIsActive11_g4989 = IsActive11_g4989( Band11_g4989 );
			float4 lerpResult14_g4988 = lerp( localAudioLinkLerp1_g4990 , float4( localGlowLerp11_g4988 , 0.0 ) , (float)localIsActive11_g4989);
			float4 lerpResult52_g4978 = lerp( temp_cast_143 , lerpResult14_g4988 , (float)saturate( EmissionGlowZone47_g4978 ));
			float4 lerpResult51_g4978 = lerp( float4( lerpResult23_g4978 , 0.0 ) , lerpResult52_g4978 , (float)saturate( ( EmissionGlowZone47_g4978 - 4 ) ));
			float4 temp_cast_148 = (_AlphaChGlowMinBrightness).xxxx;
			float4 temp_cast_149 = (( _AlphaChGlowMinBrightness + 1.0 )).xxxx;
			int temp_output_258_0_g4978 = saturate( EmissionGlowZone47_g4978 );
			float4 EmissionGlow142_g4978 = ( (temp_cast_148 + (lerpResult51_g4978 - float4( 0,0,0,0 )) * (temp_cast_149 - temp_cast_148) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 ))) * _AlphaChGlowTint * temp_output_258_0_g4978 );
			float4 lerpResult261_g4978 = lerp( temp_cast_128 , EmissionGlow142_g4978 , (float)temp_output_258_0_g4978);
			float4 EmissionGlowTog262_g4978 = lerpResult261_g4978;
			int EmissionReactiveBand243_g4978 = _AlphaChReactiveBand;
			int Band3_g4979 = EmissionReactiveBand243_g4978;
			int Delay3_g4979 = 0;
			float localAudioLinkData3_g4979 = AudioLinkData3_g4979( Band3_g4979 , Delay3_g4979 );
			int temp_output_64_0_g4978 = step( _AlphaChReactiveBand , 9 );
			float lerpResult66_g4978 = lerp( 1.0 , localAudioLinkData3_g4979 , (float)temp_output_64_0_g4978);
			int Band3_g4981 = _AlphaChReactiveBand;
			float cos78_g4978 = cos( radians( _AlphaChReactivePulseDir ) );
			float sin78_g4978 = sin( radians( _AlphaChReactivePulseDir ) );
			float2 rotator78_g4978 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos78_g4978 , -sin78_g4978 , sin78_g4978 , cos78_g4978 )) + float2( 0.5,0.5 );
			float x96_g4978 = ( ( rotator78_g4978.x * _AlphaChReactivePulseScale ) + _AlphaChReactivePulseOffset );
			float y96_g4978 = 127.0;
			float localglslmod96_g4978 = glslmod96_g4978( x96_g4978 , y96_g4978 );
			float2 CenteredUV15_g4982 = ( i.uv_texcoord - _AlphaChReactiveRadialCenter );
			float2 break17_g4982 = CenteredUV15_g4982;
			float2 appendResult23_g4982 = (float2(( length( CenteredUV15_g4982 ) * _AlphaChReactivePulseScale * 2.0 ) , ( atan2( break17_g4982.x , break17_g4982.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float x97_g4978 = ( _AlphaChReactivePulseOffset + appendResult23_g4982.x );
			float y97_g4978 = 127.0;
			float localglslmod97_g4978 = glslmod97_g4978( x97_g4978 , y97_g4978 );
			int EmissionReactiveMode99_g4978 = _AlphaChReactiveMode;
			int temp_output_90_0_g4978 = ( EmissionReactiveMode99_g4978 - 1 );
			float lerpResult77_g4978 = lerp( localglslmod96_g4978 , localglslmod97_g4978 , (float)saturate( temp_output_90_0_g4978 ));
			float lerpResult174_g4978 = lerp( DirectionalMap106_g4978 , ( 1.0 - DirectionalMap106_g4978 ) , (float)saturate( ( EmissionReactiveMode99_g4978 - 3 ) ));
			float x98_g4978 = ( _AlphaChReactivePulseOffset + ( _AlphaChReactivePulseScale * lerpResult174_g4978 ) );
			float y98_g4978 = 127.0;
			float localglslmod98_g4978 = glslmod98_g4978( x98_g4978 , y98_g4978 );
			float lerpResult87_g4978 = lerp( lerpResult77_g4978 , localglslmod98_g4978 , (float)saturate( ( temp_output_90_0_g4978 - 1 ) ));
			float Delay3_g4981 = lerpResult87_g4978;
			float localAudioLinkLerp3_g4981 = AudioLinkLerp3_g4981( Band3_g4981 , Delay3_g4981 );
			float lerpResult102_g4978 = lerp( 1.0 , localAudioLinkLerp3_g4981 , (float)temp_output_64_0_g4978);
			float lerpResult103_g4978 = lerp( lerpResult66_g4978 , lerpResult102_g4978 , (float)saturate( EmissionReactiveMode99_g4978 ));
			int Band3_g4983 = _AlphaChReactiveBand;
			float FilteredAmount3_g4983 = ( ( 1.0 - _AlphaChReactiveGlobalSmoothing ) * 15.0 );
			float localAudioLinkLerp3_g4983 = AudioLinkLerp3_g4983( Band3_g4983 , FilteredAmount3_g4983 );
			float lerpResult168_g4978 = lerp( 1.0 , localAudioLinkLerp3_g4983 , (float)temp_output_64_0_g4978);
			float lerpResult172_g4978 = lerp( lerpResult103_g4978 , lerpResult168_g4978 , (float)saturate( ( EmissionReactiveMode99_g4978 - 4 ) ));
			float ReactivityAlpha132_g4978 = (_AlphaChReactiveMinBrightness + (lerpResult172_g4978 - 0.0) * (( _AlphaChReactiveMinBrightness + 1.0 ) - _AlphaChReactiveMinBrightness) / (1.0 - 0.0));
			float4 temp_cast_160 = (1.0).xxxx;
			float4 lerpResult268_g4978 = lerp( temp_cast_160 , _AlphaChReactiveTint , (float)step( EmissionReactiveBand243_g4978 , 9 ));
			float4 FinalReactivity68_g4978 = ( ReactivityAlpha132_g4978 * lerpResult268_g4978 );
			float4 lerpResult146_g4978 = lerp( ( EmissionGlowTog262_g4978 * FinalReactivity68_g4978 ) , ( EmissionGlow142_g4978 + FinalReactivity68_g4978 ) , (float)saturate( _AlphaChReactiveBlendMode ));
			float4 ReversedReactivity152_g4978 = ( ( 1.0 - ReactivityAlpha132_g4978 ) * lerpResult268_g4978 );
			int temp_output_157_0_g4978 = ( _AlphaChReactiveBlendMode - 1 );
			float4 lerpResult114_g4978 = lerp( lerpResult146_g4978 , ( EmissionGlowTog262_g4978 * ReversedReactivity152_g4978 ) , (float)saturate( temp_output_157_0_g4978 ));
			float4 lerpResult164_g4978 = lerp( lerpResult114_g4978 , ( EmissionGlow142_g4978 + ( ReversedReactivity152_g4978 * step( EmissionReactiveBand243_g4978 , 9 ) ) ) , (float)max( saturate( ( temp_output_157_0_g4978 - 1 ) ) , ( 1.0 - step( EmissionReactiveBand243_g4978 , 9 ) ) ));
			float localIfAudioLinkv2Exists1_g4993 = IfAudioLinkv2Exists1_g4993();
			float4 lerpResult278_g4978 = lerp( float4( 0,0,0,0 ) , ( lerpResult164_g4978 * (GlowMaskRGBA174_g4913).a * localIfAudioLinkv2Exists1_g4993 ) , _EnableAlphaChannel);
			float4 temp_output_211_0_g4914 = EmissionRGBA29;
			float4 temp_cast_170 = (1.0).xxxx;
			float3 temp_cast_171 = (1.0).xxx;
			int EmissionGlowZone47_g4914 = _EmissionGlowZone;
			int clampResult8_g4925 = clamp( EmissionGlowZone47_g4914 , 1 , 4 );
			int temp_output_3_0_g4925 = ( clampResult8_g4925 - 1 );
			int Zone16_g4925 = temp_output_3_0_g4925;
			float3 localgetThemeData16_g4925 = getThemeData( Zone16_g4925 );
			int Band11_g4926 = 56;
			int localIsActive11_g4926 = IsActive11_g4926( Band11_g4926 );
			int temp_output_14_0_g4925 = localIsActive11_g4926;
			int lerpResult15_g4925 = lerp( temp_output_3_0_g4925 , ( 63 - temp_output_3_0_g4925 ) , (float)temp_output_14_0_g4925);
			int Band2_g4925 = lerpResult15_g4925;
			int Delay2_g4925 = 0;
			float3 localGlowData2_g4925 = GlowData2_g4925( Band2_g4925 , Delay2_g4925 );
			float3 lerpResult17_g4925 = lerp( ( localgetThemeData16_g4925 * localGlowData2_g4925 ) , localGlowData2_g4925 , (float)temp_output_14_0_g4925);
			int temp_output_21_0_g4914 = saturate( EmissionGlowZone47_g4914 );
			float3 lerpResult20_g4914 = lerp( temp_cast_171 , lerpResult17_g4925 , (float)temp_output_21_0_g4914);
			float3 temp_cast_175 = (1.0).xxx;
			int clampResult8_g4927 = clamp( EmissionGlowZone47_g4914 , 1 , 4 );
			int temp_output_3_0_g4927 = ( clampResult8_g4927 - 1 );
			int Zone15_g4927 = temp_output_3_0_g4927;
			float3 localgetThemeData15_g4927 = getThemeData( Zone15_g4927 );
			int Band11_g4928 = 56;
			int localIsActive11_g4928 = IsActive11_g4928( Band11_g4928 );
			int temp_output_13_0_g4927 = localIsActive11_g4928;
			int lerpResult14_g4927 = lerp( temp_output_3_0_g4927 , ( 63 - temp_output_3_0_g4927 ) , (float)temp_output_13_0_g4927);
			int Band11_g4927 = lerpResult14_g4927;
			float cos6_g4914 = cos( radians( _EmissionGlowPulseDir ) );
			float sin6_g4914 = sin( radians( _EmissionGlowPulseDir ) );
			float2 rotator6_g4914 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos6_g4914 , -sin6_g4914 , sin6_g4914 , cos6_g4914 )) + float2( 0.5,0.5 );
			int Band6_g4920 = _EmissionGlowAnimationBand;
			int Mode6_g4920 = ( ( _EmissionGlowAnimationMode * 2 ) + _EmissionGlowAnimationSpeed );
			int localAudioLinkDecodeDataAsUInt6_g4920 = AudioLinkDecodeDataAsUInt6_g4920( Band6_g4920 , Mode6_g4920 );
			float localGetLocalTime2_g4921 = ( AudioLinkDecodeDataAsSeconds( ALPASS_GENERALVU_LOCAL_TIME ) );
			float lerpResult206_g4914 = lerp( ( ( localAudioLinkDecodeDataAsUInt6_g4920 % 628319 ) / 100000.0 ) , localGetLocalTime2_g4921 , (float)saturate( ( _EmissionGlowAnimationMode - 3 ) ));
			float EmissionGlowAnimation195_g4914 = ( _EmissionGlowAnimationStrength * lerpResult206_g4914 * step( _EmissionGlowAnimationBand , 9 ) );
			float x13_g4914 = ( ( rotator6_g4914.x * _EmissionGlowPulseScale ) + _EmissionGlowPulseOffset + EmissionGlowAnimation195_g4914 );
			float y13_g4914 = 127.0;
			float localglslmod13_g4914 = glslmod13_g4914( x13_g4914 , y13_g4914 );
			float2 CenteredUV15_g4916 = ( i.uv_texcoord - _EmissionGlowRadialCenter );
			float2 break17_g4916 = CenteredUV15_g4916;
			float2 appendResult23_g4916 = (float2(( length( CenteredUV15_g4916 ) * _EmissionGlowPulseScale * 2.0 ) , ( atan2( break17_g4916.x , break17_g4916.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float x12_g4914 = ( _EmissionGlowPulseOffset + appendResult23_g4916.x + EmissionGlowAnimation195_g4914 );
			float y12_g4914 = 127.0;
			float localglslmod12_g4914 = glslmod12_g4914( x12_g4914 , y12_g4914 );
			int EmissionGlowMode35_g4914 = _EmissionGlowMode;
			int temp_output_37_0_g4914 = ( EmissionGlowMode35_g4914 - 1 );
			float lerpResult5_g4914 = lerp( localglslmod13_g4914 , localglslmod12_g4914 , (float)saturate( temp_output_37_0_g4914 ));
			float DirectionalMap106_g4914 = Direction27_g4913;
			float lerpResult179_g4914 = lerp( DirectionalMap106_g4914 , ( 1.0 - DirectionalMap106_g4914 ) , (float)saturate( ( EmissionGlowMode35_g4914 - 3 ) ));
			float x34_g4914 = ( _EmissionGlowPulseOffset + ( _EmissionGlowPulseScale * lerpResult179_g4914 ) + EmissionGlowAnimation195_g4914 );
			float y34_g4914 = 127.0;
			float localglslmod34_g4914 = glslmod34_g4914( x34_g4914 , y34_g4914 );
			float lerpResult30_g4914 = lerp( lerpResult5_g4914 , localglslmod34_g4914 , (float)saturate( ( temp_output_37_0_g4914 - 1 ) ));
			float EmissionGlowDelay56_g4914 = lerpResult30_g4914;
			float Delay11_g4927 = EmissionGlowDelay56_g4914;
			float3 localGlowLerp11_g4927 = GlowLerp11_g4927( Band11_g4927 , Delay11_g4927 );
			float3 lerpResult17_g4927 = lerp( ( localgetThemeData15_g4927 * localGlowLerp11_g4927 ) , localGlowLerp11_g4927 , (float)temp_output_13_0_g4927);
			float3 lerpResult22_g4914 = lerp( temp_cast_175 , lerpResult17_g4927 , (float)temp_output_21_0_g4914);
			float3 lerpResult23_g4914 = lerp( lerpResult20_g4914 , lerpResult22_g4914 , (float)saturate( EmissionGlowMode35_g4914 ));
			float4 temp_cast_185 = (1.0).xxxx;
			float temp_output_10_0_g4922 = EmissionGlowDelay56_g4914;
			float Position1_g4924 = ( temp_output_10_0_g4922 / 127.0 );
			float4 localAudioLinkLerp1_g4924 = AudioLinkLerp1_g4924( Position1_g4924 );
			int clampResult8_g4922 = clamp( ( EmissionGlowZone47_g4914 - 4 ) , 1 , 3 );
			int Band11_g4922 = ( 59 - ( clampResult8_g4922 - 1 ) );
			float Delay11_g4922 = temp_output_10_0_g4922;
			float3 localGlowLerp11_g4922 = GlowLerp11_g4922( Band11_g4922 , Delay11_g4922 );
			int Band11_g4923 = 56;
			int localIsActive11_g4923 = IsActive11_g4923( Band11_g4923 );
			float4 lerpResult14_g4922 = lerp( localAudioLinkLerp1_g4924 , float4( localGlowLerp11_g4922 , 0.0 ) , (float)localIsActive11_g4923);
			float4 lerpResult52_g4914 = lerp( temp_cast_185 , lerpResult14_g4922 , (float)saturate( EmissionGlowZone47_g4914 ));
			float4 lerpResult51_g4914 = lerp( float4( lerpResult23_g4914 , 0.0 ) , lerpResult52_g4914 , (float)saturate( ( EmissionGlowZone47_g4914 - 4 ) ));
			float4 temp_cast_190 = (_EmissionGlowMinBrightness).xxxx;
			float4 temp_cast_191 = (( _EmissionGlowMinBrightness + 1.0 )).xxxx;
			int temp_output_245_0_g4914 = saturate( EmissionGlowZone47_g4914 );
			float4 EmissionGlow142_g4914 = ( (temp_cast_190 + (lerpResult51_g4914 - float4( 0,0,0,0 )) * (temp_cast_191 - temp_cast_190) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 ))) * _EmissionGlowTint * temp_output_245_0_g4914 );
			float4 lerpResult248_g4914 = lerp( temp_cast_170 , EmissionGlow142_g4914 , (float)temp_output_245_0_g4914);
			float4 EmissionGlowTog249_g4914 = lerpResult248_g4914;
			int EmissionReactiveBand254_g4914 = _EmissionReactiveBand;
			int Band3_g4915 = EmissionReactiveBand254_g4914;
			int Delay3_g4915 = 0;
			float localAudioLinkData3_g4915 = AudioLinkData3_g4915( Band3_g4915 , Delay3_g4915 );
			int temp_output_64_0_g4914 = step( _EmissionReactiveBand , 9 );
			float lerpResult66_g4914 = lerp( 1.0 , localAudioLinkData3_g4915 , (float)temp_output_64_0_g4914);
			int Band3_g4917 = _EmissionReactiveBand;
			float cos78_g4914 = cos( radians( _EmissionReactivePulseDir ) );
			float sin78_g4914 = sin( radians( _EmissionReactivePulseDir ) );
			float2 rotator78_g4914 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos78_g4914 , -sin78_g4914 , sin78_g4914 , cos78_g4914 )) + float2( 0.5,0.5 );
			float x96_g4914 = ( ( rotator78_g4914.x * _EmissionReactivePulseScale ) + _EmissionReactivePulseOffset );
			float y96_g4914 = 127.0;
			float localglslmod96_g4914 = glslmod96_g4914( x96_g4914 , y96_g4914 );
			float2 CenteredUV15_g4918 = ( i.uv_texcoord - _EmissionReactiveRadialCenter );
			float2 break17_g4918 = CenteredUV15_g4918;
			float2 appendResult23_g4918 = (float2(( length( CenteredUV15_g4918 ) * _EmissionReactivePulseScale * 2.0 ) , ( atan2( break17_g4918.x , break17_g4918.y ) * ( 1.0 / 6.28318548202515 ) * 1.0 )));
			float x97_g4914 = ( _EmissionReactivePulseOffset + appendResult23_g4918.x );
			float y97_g4914 = 127.0;
			float localglslmod97_g4914 = glslmod97_g4914( x97_g4914 , y97_g4914 );
			int EmissionReactiveMode99_g4914 = _EmissionReactiveMode;
			int temp_output_90_0_g4914 = ( EmissionReactiveMode99_g4914 - 1 );
			float lerpResult77_g4914 = lerp( localglslmod96_g4914 , localglslmod97_g4914 , (float)saturate( temp_output_90_0_g4914 ));
			float lerpResult174_g4914 = lerp( DirectionalMap106_g4914 , ( 1.0 - DirectionalMap106_g4914 ) , (float)saturate( ( EmissionReactiveMode99_g4914 - 3 ) ));
			float x98_g4914 = ( _EmissionReactivePulseOffset + ( _EmissionReactivePulseScale * lerpResult174_g4914 ) );
			float y98_g4914 = 127.0;
			float localglslmod98_g4914 = glslmod98_g4914( x98_g4914 , y98_g4914 );
			float lerpResult87_g4914 = lerp( lerpResult77_g4914 , localglslmod98_g4914 , (float)saturate( ( temp_output_90_0_g4914 - 1 ) ));
			float Delay3_g4917 = lerpResult87_g4914;
			float localAudioLinkLerp3_g4917 = AudioLinkLerp3_g4917( Band3_g4917 , Delay3_g4917 );
			float lerpResult102_g4914 = lerp( 1.0 , localAudioLinkLerp3_g4917 , (float)temp_output_64_0_g4914);
			float lerpResult103_g4914 = lerp( lerpResult66_g4914 , lerpResult102_g4914 , (float)saturate( EmissionReactiveMode99_g4914 ));
			int Band3_g4919 = _EmissionReactiveBand;
			float FilteredAmount3_g4919 = ( ( 1.0 - _EmissionReactiveGlobalSmoothing ) * 15.0 );
			float localAudioLinkLerp3_g4919 = AudioLinkLerp3_g4919( Band3_g4919 , FilteredAmount3_g4919 );
			float lerpResult168_g4914 = lerp( 1.0 , localAudioLinkLerp3_g4919 , (float)temp_output_64_0_g4914);
			float lerpResult172_g4914 = lerp( lerpResult103_g4914 , lerpResult168_g4914 , (float)saturate( ( EmissionReactiveMode99_g4914 - 4 ) ));
			float ReactivityAlpha132_g4914 = (_EmissionReactiveMinBrightness + (lerpResult172_g4914 - 0.0) * (( _EmissionReactiveMinBrightness + 1.0 ) - _EmissionReactiveMinBrightness) / (1.0 - 0.0));
			float4 temp_cast_202 = (1.0).xxxx;
			float4 lerpResult265_g4914 = lerp( temp_cast_202 , _EmissionReactiveTint , (float)step( EmissionReactiveBand254_g4914 , 9 ));
			float4 FinalReactivity68_g4914 = ( ReactivityAlpha132_g4914 * lerpResult265_g4914 );
			float4 lerpResult146_g4914 = lerp( ( EmissionGlowTog249_g4914 * FinalReactivity68_g4914 ) , ( EmissionGlow142_g4914 + FinalReactivity68_g4914 ) , (float)saturate( _EmissionReactiveBlendMode ));
			float4 ReversedReactivity152_g4914 = ( ( 1.0 - ReactivityAlpha132_g4914 ) * lerpResult265_g4914 );
			int temp_output_157_0_g4914 = ( _EmissionReactiveBlendMode - 1 );
			float4 lerpResult114_g4914 = lerp( lerpResult146_g4914 , ( EmissionGlowTog249_g4914 * ReversedReactivity152_g4914 ) , (float)saturate( temp_output_157_0_g4914 ));
			float4 lerpResult164_g4914 = lerp( lerpResult114_g4914 , ( EmissionGlow142_g4914 + ( ReversedReactivity152_g4914 * step( EmissionReactiveBand254_g4914 , 9 ) ) ) , (float)saturate( ( temp_output_157_0_g4914 - 1 ) ));
			float grayscale214_g4914 = Luminance(temp_output_211_0_g4914.rgb);
			float smoothstepResult215_g4914 = smoothstep( 0.0 , 0.5 , grayscale214_g4914);
			int ReactiveBlendmode272_g4914 = _EmissionReactiveBlendMode;
			float x270_g4914 = (float)ReactiveBlendmode272_g4914;
			float y270_g4914 = 2.0;
			float localglslmod270_g4914 = glslmod270_g4914( x270_g4914 , y270_g4914 );
			float lerpResult271_g4914 = lerp( localglslmod270_g4914 , (float)_EmissionGlowBlendMode , (float)saturate( EmissionGlowZone47_g4914 ));
			float4 lerpResult212_g4914 = lerp( ( lerpResult164_g4914 * temp_output_211_0_g4914 ) , ( ( lerpResult164_g4914 * smoothstepResult215_g4914 ) + temp_output_211_0_g4914 ) , lerpResult271_g4914);
			float localIfAudioLinkv2Exists1_g4929 = IfAudioLinkv2Exists1_g4929();
			float4 lerpResult281_g4914 = lerp( temp_output_211_0_g4914 , lerpResult212_g4914 , localIfAudioLinkv2Exists1_g4929);
			#ifdef _EMISSION
				float4 staticSwitch284_g4914 = lerpResult281_g4914;
			#else
				float4 staticSwitch284_g4914 = float4( 0,0,0,0 );
			#endif
			float4 EmissionGlow116 = ( ( lerpResult280_g4930 + lerpResult276_g4946 + lerpResult278_g4962 + lerpResult278_g4978 ) + staticSwitch284_g4914 );
			#ifdef _ENABLEAL_ON
				float4 staticSwitch123 = EmissionGlow116;
			#else
				float4 staticSwitch123 = float4( 0,0,0,0 );
			#endif
			o.Emission = ( ( ( EmissionRGBA29 * EmiColor31 ) + float4( staticSwitch78 , 0.0 ) ) + staticSwitch123 ).rgb;
			float2 uv_metText = i.uv_texcoord * _metText_ST.xy + _metText_ST.zw;
			#ifdef _METALIC_ON
				float4 staticSwitch18 = tex2D( _metText, uv_metText );
			#else
				float4 staticSwitch18 = float4( 0,0,0,0 );
			#endif
			float4 metalic19 = ( staticSwitch18 * _metLevel );
			o.Metallic = metalic19.r;
			#ifdef _SMOOTHNESS_ON
				float staticSwitch39 = _smoothLevel;
			#else
				float staticSwitch39 = 0.0;
			#endif
			float2 uv_smoothMap = i.uv_texcoord * _smoothMap_ST.xy + _smoothMap_ST.zw;
			float smoothness40 = ( staticSwitch39 * tex2D( _smoothMap, uv_smoothMap ).r );
			o.Smoothness = smoothness40;
			float4 tex2DNode53 = tex2D( _OcclusionMap, i.uv_texcoord );
			float Occlusion58 = (( 1.0 - _OcclusionStrength ) + (tex2DNode53.g - 0.0) * (1.0 - ( 1.0 - _OcclusionStrength )) / (1.0 - 0.0));
			o.Occlusion = ( specularIntensity15_g1 + Occlusion58 );
			o.Alpha = 1;
			float2 uv_TextureSample1 = i.uv_texcoord * _TextureSample1_ST.xy + _TextureSample1_ST.zw;
			float2 uv_dissolveMap = i.uv_texcoord * _dissolveMap_ST.xy + _dissolveMap_ST.zw;
			float4 dissolve127 = ( (-1.0 + (( 1.0 - _dissolveTotal ) - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) + tex2D( _dissolveMap, uv_dissolveMap ) );
			#ifdef _DISSOLVE_ON
				float4 staticSwitch126 = dissolve127;
			#else
				float4 staticSwitch126 = tex2D( _TextureSample1, uv_TextureSample1 );
			#endif
			clip( staticSwitch126.r - _Cutoff );
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows exclude_path:deferred 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			AlphaToMask Off
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float4 customPack1 : TEXCOORD1;
				float4 tSpace0 : TEXCOORD2;
				float4 tSpace1 : TEXCOORD3;
				float4 tSpace2 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.customPack1.zw = customInputData.uv2_texcoord2;
				o.customPack1.zw = v.texcoord1;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				surfIN.uv2_texcoord2 = IN.customPack1.zw;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "CytraXShaderUI"
}