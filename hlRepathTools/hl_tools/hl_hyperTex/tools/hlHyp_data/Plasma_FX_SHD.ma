//Maya ASCII 2018ff09 scene
//Name: Plasma_FX_SHD.ma
//Last modified: Thu, Jun 17, 2021 04:53:08 PM
//Codeset: 1252
requires maya "2018ff09";
requires -nodeType "floatConstant" -nodeType "colorConstant" "lookdevKit" "1.0";
requires -nodeType "aiNoise" -nodeType "aiStandardSurface" -nodeType "aiColorCorrect"
		 "mtoa" "4.1.0";
requires "stereoCamera" "10.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2018";
fileInfo "version" "2018";
fileInfo "cutIdentifier" "201903222215-65bada0e52";
fileInfo "osv" "Microsoft Windows 8 Enterprise Edition, 64-bit  (Build 9200)\n";
createNode aiStandardSurface -n "Plasma_FX_SHD";
	rename -uid "709A5A6E-45A0-B186-B710-5F8D0E4874DC";
	setAttr ".specular" 0;
	setAttr ".specular_IOR" 1.3300000429153442;
	setAttr ".transmission" 0.20000000298023224;
	setAttr ".subsurface" 1;
	setAttr ".subsurface_color" -type "float3" 0 1 1 ;
	setAttr ".subsurface_scale" 0.64935064315795898;
	setAttr ".coat" 1;
	setAttr ".emission_color" -type "float3" 0.12800002 0.53045702 1 ;
createNode blendColors -n "blendColors1";
	rename -uid "5589E2D0-46F7-1D8B-A671-79AEAF33E299";
createNode colorConstant -n "colorConstant1";
	rename -uid "D4AB5F1E-4EC3-9265-1FF5-26BBF5E7155B";
	setAttr "._c" -type "float3" 0.17299998 0.52288985 1 ;
createNode colorConstant -n "colorConstant2";
	rename -uid "40AD1825-4C84-85D4-36BC-E29295A23488";
	setAttr "._c" -type "float3" 0.12800002 0.53045702 1 ;
createNode aiColorCorrect -n "aiColorCorrect1";
	rename -uid "F0D1037F-46AE-6CCE-F7E8-3DAE57E92488";
	setAttr ".contrast" 50;
createNode aiNoise -n "aiNoise1";
	rename -uid "735D85D1-46A6-66FA-2A65-94A4247E36C4";
	setAttr ".octaves" 5;
	setAttr ".distortion" 2.2580645084381104;
	setAttr ".lacunarity" 4.1999998092651367;
	setAttr ".amplitude" 2.8387095928192139;
	setAttr ".scale" -type "float3" 0.2 0.2 0.2 ;
	setAttr ".P" -type "float3" 10 0 0 ;
	setAttr ".color1" -type "float3" 0.98064518 0.98064518 0.98064518 ;
	setAttr ".color2" -type "float3" 0.038709678 0.038709678 0.038709678 ;
createNode multiplyDivide -n "multiplyDivide1";
	rename -uid "D96E06FE-48E9-F367-3439-3782C55F0D8B";
createNode timeToUnitConversion -n "timeToUnitConversion2";
	rename -uid "DC0115F5-49DE-3C56-6876-078E7FB9479A";
	setAttr ".cf" 0.004;
createNode floatConstant -n "floatConstant1";
	rename -uid "28A904F9-451F-7871-A283-DEB4E6B74613";
	setAttr "._f" 0.0099999997764825821;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 3 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 6 ".u";
select -ne :defaultRenderingList1;
select -ne :defaultTextureList1;
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".ren" -type "string" "arnold";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "blendColors1.op" "Plasma_FX_SHD.base_color";
connectAttr "aiNoise1.outr" "Plasma_FX_SHD.emission";
connectAttr "colorConstant1.oc" "blendColors1.c1";
connectAttr "colorConstant2.oc" "blendColors1.c2";
connectAttr "aiColorCorrect1.outr" "blendColors1.b";
connectAttr "aiNoise1.out" "aiColorCorrect1.input";
connectAttr "multiplyDivide1.ox" "aiNoise1.time";
connectAttr "timeToUnitConversion2.o" "multiplyDivide1.i1x";
connectAttr "floatConstant1.of" "multiplyDivide1.i2x";
connectAttr ":time1.o" "timeToUnitConversion2.i";
connectAttr "Plasma_FX_SHD.msg" ":defaultShaderList1.s" -na;
connectAttr "colorConstant1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "colorConstant2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "blendColors1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "floatConstant1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "aiColorCorrect1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "aiNoise1.msg" ":defaultTextureList1.tx" -na;
// End of Plasma_FX_SHD.ma