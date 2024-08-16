#if UNITY_EDITOR

using UnityEngine;
using UnityEditor;
using System.IO;

public class CytraXShaderUI : ShaderGUI
{
    //Set variables
    private Texture2D logoImage;
    private bool showMainProperties;
    MaterialEditor editor;
    MaterialProperty[] properties;
    Material target;

    //Shader locations
    Shader defaultOpaque = Shader.Find("CytraX/Core");

    // LTCGI shader include path the hell?
    private const string LTCGIPath = "Assets/_pi_/_LTCGI/Shaders/LTCGI.cginc";
    private const string LTCGIDownloadURL = "https://vpm.pimaker.at/";
    private const string ShaderKeyword = "USE_LTCGI";

    //This is where the GUI is drawn
    public override void OnGUI(
        MaterialEditor editor, MaterialProperty[] properties
    )
    {
        this.editor = editor;
        this.properties = properties;
        this.target = editor.target as Material;
        Material targetMaterial = editor.target as Material;
        // Check if the LTCGI include file exists
        bool ltciFileExists = File.Exists(LTCGIPath);

        // Enable or disable the shader keyword based on file existence
        if (ltciFileExists)
        {
            targetMaterial.EnableKeyword(ShaderKeyword);
        }
        else
        {
            targetMaterial.DisableKeyword(ShaderKeyword);
        }

        // Check if LTCGI include file exists
        CheckLTCGIFile();

        //Setup UI
        SetLogoImage();

        //Main Properties
        DoMainProperties();
    }
    void CheckLTCGIFile()
    {
        if (!File.Exists(LTCGIPath))
        {
            bool download = EditorUtility.DisplayDialog(
                "LTCGI.cginc Missing",
                "The LTCGI.cginc file is missing. This file is required for the shader to work properly. Would you like to download it now?",
                "Download",
                "Cancel"
            );

            if (download)
            {
                // Open the download link in the user's default web browser
                Application.OpenURL(LTCGIDownloadURL);
            }
        }
    }
    void SetLogoImage()
    {
        logoImage = AssetDatabase.LoadAssetAtPath<Texture2D>("Packages/net.cytrax.shader/Runtime/UI/CytraX.png");
        GUILayout.BeginHorizontal();
        GUILayout.FlexibleSpace();
        GUILayout.BeginVertical();
        GUILayout.FlexibleSpace();
        GUILayout.Label(logoImage, GUILayout.MaxHeight(100));
        GUILayout.FlexibleSpace();
        GUILayout.EndVertical();
        GUILayout.FlexibleSpace();
        GUILayout.EndHorizontal();
    }

    MaterialProperty FindProperty(string name)
    {
        return FindProperty(name, properties);
    }

    static GUIContent staticLabel = new GUIContent();
    static GUIContent MakeLabel(string text, string tooltip = null)
    {
        staticLabel.text = text;
        staticLabel.tooltip = tooltip;
        return staticLabel;
    }

    //Create foldout that contains main properties
    void DoMainProperties()
    {
        DoMainTex();
        DoNormals();
        DoEmission();
        DoMetalic();
        DoSmoothness();
        DoOcclusion();
        DoDissolve();
        DoAudiolink();
    }   
    
    void DoMainTex()
    {
        MaterialProperty mainTex = FindProperty("_MainTex");
        MaterialProperty mainColor = FindProperty("_MainColor");
        editor.TexturePropertySingleLine(MakeLabel("Main Texture", "Texture, main colors with alpha"), mainTex, mainColor);
        EditorGUI.indentLevel += 2;
        editor.TextureScaleOffsetProperty(mainTex);
        EditorGUI.indentLevel -= 2;
    }
    void DoOcclusion()
    {
        MaterialProperty tex = FindProperty("_OcclusionMap");
        MaterialProperty scale = FindProperty("_OcclusionStrength");
        editor.TexturePropertySingleLine(MakeLabel("Occlusion Map", "Texture, adds shadow detail"), tex, scale);
    }
    void DoNormals()
    {
        MaterialProperty tex = FindProperty("_BumpMap1");
        MaterialProperty scale = FindProperty("_BumpScale");
        editor.TexturePropertySingleLine(MakeLabel("Normal Map", "Texture to simulate bumps"), tex, scale);
    }
    void DoDissolve()
    {
        bool showProperties;
        MaterialProperty tog = FindProperty("_dissolve");
        MaterialProperty tex = FindProperty("_dissolveMap");
        MaterialProperty total = FindProperty("_dissolveTotal");

        editor.ShaderProperty(tog, MakeLabel("Enable Dissolve", "Enables Dissolve Effect"));

        if (target.GetFloat("_dissolve") == 1)
        {
            showProperties = true;
        }
        else
        {
            showProperties = false;
        }

            if(showProperties)
            {
                editor.TexturePropertySingleLine(MakeLabel("Dissolve Map", "Texture"), tex, total);
                
            }
    }
    void DoSmoothness()
    {
        bool showProperties;
        float togfl = target.GetFloat("_smoothness");
        MaterialProperty tog = FindProperty("_smoothness");
        MaterialProperty smoothLevel = FindProperty("_smoothLevel");
        MaterialProperty tex = FindProperty("_smoothMap");

        editor.ShaderProperty(tog, MakeLabel("Enable Smoothness", "Enables Smoothness"));

        if (target.GetFloat("_smoothness") == 1)
        {
            showProperties = true;
        }
        else
        {
            showProperties = false;
        }

            if(showProperties)
            {
                editor.TexturePropertySingleLine(MakeLabel("Smooth Map", "Texture"), tex, smoothLevel);
                
            }
    }
    void DoMetalic()
    {
        bool showProperties;
        float togfl = target.GetFloat("_Metalic");
        MaterialProperty tog = FindProperty("_Metalic");
        MaterialProperty mainMet = FindProperty("_metText");
        MaterialProperty metLevel = FindProperty("_metLevel");

        if (target.GetFloat("_Metalic") == 1)
        {
            showProperties = true;
        }
        else
        {
            showProperties = false;
        }

        editor.ShaderProperty(tog, MakeLabel("Enable Metalic", "Enables Shine"));

           if(showProperties)
            {
                editor.TexturePropertySingleLine(MakeLabel("Metalic Texture", "Texture, main colors with alpha"), mainMet, metLevel);
                EditorGUI.indentLevel += 2;
                editor.TextureScaleOffsetProperty(mainMet);
                EditorGUI.indentLevel -= 2;
            }

    }
    void DoAudiolink()
    {
        bool showProperties;
        MaterialProperty glowMask = FindProperty("_GlowMask");
        MaterialProperty tog = FindProperty("_enableAL");
                
        editor.ShaderProperty(tog, MakeLabel("Enable AudioLink", "Wub Wub"));

        if (target.GetFloat("_enableAL") == 1)
        {
            showProperties = true;
        }
        else
        {
            showProperties = false;
        }
        if(showProperties)
        {

        showProperties = EditorGUILayout.Foldout(showProperties, "AudioLink", true, EditorStyles.foldoutHeader);

            DoGlowMask();

            if (target.GetFloat("_EnableEmission") == 1)
            {
                DoEmissionAL();
            }

            if (glowMask.textureValue != null)
            {
                MaterialProperty redTog = FindProperty("_EnableRedChannel");
                EditorGUI.indentLevel += 2;
                editor.ShaderProperty(redTog, MakeLabel("Enable Red Channel", "Use Luma Glow with Glow Mask(R)"));
                EditorGUI.indentLevel -= 2;
                if (target.GetFloat("_EnableRedChannel") == 1)
                {
                    DoRedChAL();
                }

                MaterialProperty greenTog = FindProperty("_EnableGreenChannel");
                EditorGUI.indentLevel += 2;
                editor.ShaderProperty(greenTog, MakeLabel("Enable Green Channel", "Use Luma Glow with Glow Mask(G)"));
                EditorGUI.indentLevel -= 2;
                if (target.GetFloat("_EnableGreenChannel") == 1)
                {
                    DoGreenChAL();
                }

                MaterialProperty blueTog = FindProperty("_EnableBlueChannel");
                EditorGUI.indentLevel += 2;
                editor.ShaderProperty(blueTog, MakeLabel("Enable Blue Channel", "Use Luma Glow with Glow Mask(B)"));
                EditorGUI.indentLevel -= 2;
                if (target.GetFloat("_EnableBlueChannel") == 1)
                {
                    DoBlueChAL();
                }
             }
           }

    }
    void DoEmission()
    {
        bool showProperties;
        MaterialProperty mainEmi = FindProperty("_MainEmi");
        MaterialProperty emiColor = FindProperty("_EmiColor");
        MaterialProperty emiBright = FindProperty("_emiBright");
        MaterialProperty tog = FindProperty("_EnableEmission");
        MaterialProperty ltcgi = FindProperty("_enableLTCGI");

        float togfl = target.GetFloat("_EnableEmission");

        bool ltciFileExists = File.Exists(LTCGIPath);

        // Enable or disable the shader keyword based on file existence
        if (ltciFileExists)
        {
            editor.ShaderProperty(ltcgi, MakeLabel("Enable LTCGI", "Enables LTCGI"));
        }
        else
        {
            // Display a warning message if the LTCGI file is missing
            EditorGUILayout.HelpBox("LTCGI.cginc file is missing! LTCGI will not be enabled.", MessageType.Warning);

            // Disable LTCGI if the file doesn't exist
            target.SetFloat("_enableLTCGI", 0);
        }

        editor.ShaderProperty(tog, MakeLabel("Enable Emission", "Texture/color, adds glow"));

        showProperties = target.GetFloat("_EnableEmission") == 1;

        if (showProperties)
        {
            editor.TexturePropertySingleLine(MakeLabel("Emission Texture", "Texture, main colors with alpha"), mainEmi, emiColor);
            EditorGUI.indentLevel += 2;
            editor.ShaderProperty(emiBright, MakeLabel("Emission Strength", "How Bright?"));
            editor.TextureScaleOffsetProperty(mainEmi);
            EditorGUI.indentLevel -= 2;
        }
    }


    void DoGlowMask()
    {
        MaterialProperty map = FindProperty("_DirectionalMap");
        MaterialProperty mask = FindProperty("_GlowMask");

        editor.TexturePropertySingleLine(MakeLabel("Direction Map", "Helps fix UV seams and add detail"), map);
        EditorGUI.indentLevel += 2;
        editor.TextureScaleOffsetProperty(map);
        EditorGUI.indentLevel -= 2;
        editor.TexturePropertySingleLine(MakeLabel("AL Mask", "Texture, hides glow effects using color channels (RGBA)"), mask);
        EditorGUI.indentLevel += 2;
        editor.TextureScaleOffsetProperty(mask);
        EditorGUI.indentLevel -= 2;
    }

    void DoEmissionAL()
    {
        bool showProperties;
        if (target.GetFloat("_ShowEmissAL") == 1)
        {
            showProperties = true;
        }
        else
        {
            showProperties = false;
        }

        MaterialProperty Mode = FindProperty("_EmissionReactiveMode");
        MaterialProperty BlendMode = FindProperty("_EmissionReactiveBlendMode");
        MaterialProperty Tint = FindProperty("_EmissionReactiveTint");
        MaterialProperty MinBrightness = FindProperty("_EmissionReactiveMinBrightness");
        MaterialProperty PulseDir = FindProperty("_EmissionReactivePulseDir");
        MaterialProperty PulseScale = FindProperty("_EmissionReactivePulseScale");
        MaterialProperty PulseOffset = FindProperty("_EmissionReactivePulseOffset");
        MaterialProperty PulseCenter = FindProperty("_EmissionReactiveRadialCenter");
        MaterialProperty Band = FindProperty("_EmissionReactiveBand");

        //Create Foldout
        EditorGUI.indentLevel += 2;
        showProperties = EditorGUILayout.Foldout(showProperties, "Emission AudioLink", true, EditorStyles.foldoutHeader);
        if (showProperties)
        {
            target.SetFloat("_ShowEmissAL", 1);

            EditorGUI.indentLevel += 1;
            editor.ShaderProperty(Band, MakeLabel("AudioLink Band"));

            if (target.GetFloat("_EmissionReactiveBand") < 10)
            {
                editor.ShaderProperty(Mode, MakeLabel("Mode", "AudioLink: Animation Type"));
                editor.ShaderProperty(BlendMode, MakeLabel("Blend Mode", "AudioLink: How the effect combines"));
                editor.ColorProperty(Tint, "Tint");
                editor.ShaderProperty(MinBrightness, MakeLabel("Min Brightness", "AudioLink: Limits how dim effects become"));

                if (target.GetFloat("_EmissionReactiveBand") > 4 || target.GetFloat("_EmissionReactiveMode") > 0 && target.GetFloat("_EmissionReactiveMode") != 5)
                {
                    if (target.GetFloat("_EmissionReactiveMode") < 2)
                    {
                        editor.ShaderProperty(PulseDir, MakeLabel("Pulse Dir", "AudioLink: Pulse mode animation direction"));
                    }
                    editor.ShaderProperty(PulseScale, MakeLabel("Pulse Scale", "AudioLink: Pulse mode animation scale"));
                    editor.ShaderProperty(PulseOffset, MakeLabel("Pulse Offset", "AudioLink: Pulse mode animation offset"));
                }

                if (target.GetFloat("_EmissionReactiveMode") == 2)
                {
                    editor.ShaderProperty(PulseCenter, MakeLabel("Radial Center", "AudioLink: Radial mode animation center"));
                }
            }
            EditorGUI.indentLevel -= 1;
        }
        else
        {
            target.SetFloat("_ShowEmissAL", 0);
        }
        EditorGUI.indentLevel -= 2;
    }

    void DoRedChAL()
    {
        bool showProperties;
        if (target.GetFloat("_ShowRedAL") == 1)
        {
            showProperties = true;
        }
        else
        {
            showProperties = false;
        }

        MaterialProperty Mode = FindProperty("_RedChReactiveMode");
        MaterialProperty BlendMode = FindProperty("_RedChReactiveBlendMode");
        MaterialProperty Tint = FindProperty("_RedChReactiveTint");
        MaterialProperty MinBrightness = FindProperty("_RedChReactiveMinBrightness");
        MaterialProperty PulseDir = FindProperty("_RedChReactivePulseDir");
        MaterialProperty PulseScale = FindProperty("_RedChReactivePulseScale");
        MaterialProperty PulseOffset = FindProperty("_RedChReactivePulseOffset");
        MaterialProperty PulseCenter = FindProperty("_RedChReactiveRadialCenter");
        MaterialProperty Band = FindProperty("_RedChReactiveBand");

        //Create Foldout
        EditorGUI.indentLevel += 2;
        showProperties = EditorGUILayout.Foldout(showProperties, "RedCh AudioLink", true, EditorStyles.foldoutHeader);
        if (showProperties)
        {
            target.SetFloat("_ShowRedAL", 1);

            EditorGUI.indentLevel += 1;
            editor.ShaderProperty(Band, MakeLabel("AudioLink Band"));

            if (target.GetFloat("_RedChReactiveBand") < 10)
            {
                editor.ShaderProperty(Mode, MakeLabel("Mode", "AudioLink: Animation type"));
                editor.ShaderProperty(BlendMode, MakeLabel("Blend Mode", "AudioLink: How effects combine"));
                editor.ColorProperty(Tint, "Tint");
                editor.ShaderProperty(MinBrightness, MakeLabel("Min Brightness", "AudioLink: Limits how dim effects become"));

                if (target.GetFloat("_RedChReactiveBand") > 4 || target.GetFloat("_RedChReactiveMode") > 0 && target.GetFloat("_RedChReactiveMode") != 5)
                {
                    if (target.GetFloat("_RedChReactiveMode") < 2)
                    {
                        editor.ShaderProperty(PulseDir, MakeLabel("Pulse Dir", "AudioLink: Pulse mode animation direction"));
                    }
                    editor.ShaderProperty(PulseScale, MakeLabel("Pulse Scale", "AudioLink: Pulse mode animation scale"));
                    editor.ShaderProperty(PulseOffset, MakeLabel("Pulse Offset", "AudioLink: Pulse mode animation offset"));
                }

                if (target.GetFloat("_RedChReactiveMode") == 2)
                {
                    editor.ShaderProperty(PulseCenter, MakeLabel("Radial Center", "AudioLink: Radial mode animation center"));
                }
            }
            EditorGUI.indentLevel -= 1;
        }
        else
        {
            target.SetFloat("_ShowRedAL", 0);
        }
        EditorGUI.indentLevel -= 2;
    }

    void DoGreenChAL()
    {
        bool showProperties;
        if (target.GetFloat("_ShowGreenAL") == 1)
        {
            showProperties = true;
        }
        else
        {
            showProperties = false;
        }

        MaterialProperty Mode = FindProperty("_GreenChReactiveMode");
        MaterialProperty BlendMode = FindProperty("_GreenChReactiveBlendMode");
        MaterialProperty Tint = FindProperty("_GreenChReactiveTint");
        MaterialProperty MinBrightness = FindProperty("_GreenChReactiveMinBrightness");
        MaterialProperty PulseDir = FindProperty("_GreenChReactivePulseDir");
        MaterialProperty PulseScale = FindProperty("_GreenChReactivePulseScale");
        MaterialProperty PulseOffset = FindProperty("_GreenChReactivePulseOffset");
        MaterialProperty PulseCenter = FindProperty("_GreenChReactiveRadialCenter");
        MaterialProperty Band = FindProperty("_GreenChReactiveBand");

        //Create Foldout
        EditorGUI.indentLevel += 2;
        showProperties = EditorGUILayout.Foldout(showProperties, "GreenCh AudioLink", true, EditorStyles.foldoutHeader);
        if (showProperties)
        {
            target.SetFloat("_ShowGreenAL", 1);

            EditorGUI.indentLevel += 1;
            editor.ShaderProperty(Band, MakeLabel("AudioLink Band"));

            if (target.GetFloat("_GreenChReactiveBand") < 10)
            {
                editor.ShaderProperty(Mode, MakeLabel("Mode", "AudioLink: Animation type"));
                editor.ShaderProperty(BlendMode, MakeLabel("Blend Mode", "AudioLink: How effects combine"));
                editor.ColorProperty(Tint, "Tint");
                editor.ShaderProperty(MinBrightness, MakeLabel("Min Brightness", "AudioLink: Limits how dim effects become"));

                if (target.GetFloat("_GreenChReactiveBand") > 4 || target.GetFloat("_GreenChReactiveMode") > 0 && target.GetFloat("_GreenChReactiveMode") != 5)
                {
                    if (target.GetFloat("_GreenChReactiveMode") < 2)
                    {
                        editor.ShaderProperty(PulseDir, MakeLabel("Pulse Dir", "AudioLink: Pulse mode animation direction"));
                    }
                    editor.ShaderProperty(PulseScale, MakeLabel("Pulse Scale", "Pulse mode animation scale"));
                    editor.ShaderProperty(PulseOffset, MakeLabel("Pulse Offset", "Pulse mode animation offset"));
                }

                if (target.GetFloat("_GreenChReactiveMode") == 2)
                {
                    editor.ShaderProperty(PulseCenter, MakeLabel("Radial Center", "Radial mode animation center"));
                }
            }
            EditorGUI.indentLevel -= 1;
        }
        else
        {
            target.SetFloat("_ShowGreenAL", 0);
        }
        EditorGUI.indentLevel -= 2;
    }

    void DoBlueChAL()
    {
        bool showProperties;
        if (target.GetFloat("_ShowBlueAL") == 1)
        {
            showProperties = true;
        }
        else
        {
            showProperties = false;
        }

        MaterialProperty Mode = FindProperty("_BlueChReactiveMode");
        MaterialProperty BlendMode = FindProperty("_BlueChReactiveBlendMode");
        MaterialProperty Tint = FindProperty("_BlueChReactiveTint");
        MaterialProperty MinBrightness = FindProperty("_BlueChReactiveMinBrightness");
        MaterialProperty PulseDir = FindProperty("_BlueChReactivePulseDir");
        MaterialProperty PulseScale = FindProperty("_BlueChReactivePulseScale");
        MaterialProperty PulseOffset = FindProperty("_BlueChReactivePulseOffset");
        MaterialProperty PulseCenter = FindProperty("_BlueChReactiveRadialCenter");
        MaterialProperty Band = FindProperty("_BlueChReactiveBand");

        //Create Foldout
        EditorGUI.indentLevel += 2;
        showProperties = EditorGUILayout.Foldout(showProperties, "BlueCh AudioLink", true, EditorStyles.foldoutHeader);
        if (showProperties)
        {
            target.SetFloat("_ShowBlueAL", 1);

            EditorGUI.indentLevel += 1;
            editor.ShaderProperty(Band, MakeLabel("AudioLink Band"));

            if (target.GetFloat("_BlueChReactiveBand") < 10)
            {
                editor.ShaderProperty(Mode, MakeLabel("Mode", "AudioLink: Animation type"));
                editor.ShaderProperty(BlendMode, MakeLabel("Blend Mode", "AudioLink: How effects combine"));
                editor.ColorProperty(Tint, "Tint");
                editor.ShaderProperty(MinBrightness, MakeLabel("Min Brightness", "AudioLink: Limits how dim effects become"));

                if (target.GetFloat("_BlueChReactiveBand") > 4 || target.GetFloat("_BlueChReactiveMode") > 0 && target.GetFloat("_BlueChReactiveMode") != 5)
                {
                    if (target.GetFloat("_BlueChReactiveMode") < 2)
                    {
                        editor.ShaderProperty(PulseDir, MakeLabel("Pulse Dir", "AudioLink: Pulse mode animation direction"));
                    }
                    editor.ShaderProperty(PulseScale, MakeLabel("Pulse Scale", "AudioLink: Pulse mode animation scale"));
                    editor.ShaderProperty(PulseOffset, MakeLabel("Pulse Offset", "AudioLink: Pulse mode animation offset"));
                }

                if (target.GetFloat("_BlueChReactiveMode") == 2)
                {
                    editor.ShaderProperty(PulseCenter, MakeLabel("Radial Center", "AudioLink: Radial mode animation center"));
                }
            }
            EditorGUI.indentLevel -= 1;
        }
        else
        {
            target.SetFloat("_ShowBlueAL", 0);
        }
        EditorGUI.indentLevel -= 2;
    }    
}
#endif