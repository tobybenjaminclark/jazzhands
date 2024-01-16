{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rmstage_techno",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_585E19D0","path":"rooms/rmstage_techno/rmstage_techno.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"ShakeLayer","depth":0,"effectEnabled":true,"effectType":"_filter_twist_blur","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_TwistBlurCenter","type":0,"value":"0.5",},
        {"name":"g_TwistBlurCenter","type":0,"value":"0.5",},
        {"name":"g_TwistBlurIntensity","type":0,"value":"0",},
        {"name":"g_TwistBlurTexture","type":2,"value":"_filter_twist_blur_texture",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"Vignette","depth":100,"effectEnabled":true,"effectType":"_filter_vignette","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_VignetteEdges","type":0,"value":"0.8",},
        {"name":"g_VignetteEdges","type":0,"value":"1.2",},
        {"name":"g_VignetteSharpness","type":0,"value":"2",},
        {"name":"g_VignetteTexture","type":2,"value":"_filter_vignette_texture",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_585E19D0","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oTechnoStage","path":"objects/oTechnoStage/oTechnoStage.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":704.0,"y":160.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"BlueSquares","depth":300,"effectEnabled":true,"effectType":"_filter_boxes","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_BoxesScale","type":0,"value":"90",},
        {"name":"g_BoxesSize","type":0,"value":"0.15",},
        {"name":"g_BoxesSize","type":0,"value":"0.6",},
        {"name":"g_BoxesDisplacement","type":0,"value":"0.775",},
        {"name":"g_BoxesSpeed","type":0,"value":"0.8",},
        {"name":"g_BoxesAngle","type":0,"value":"25",},
        {"name":"g_BoxesRotation","type":0,"value":"2.5",},
        {"name":"g_BoxesRotation","type":0,"value":"-2.25",},
        {"name":"g_BoxesRoundness","type":0,"value":"0.575",},
        {"name":"g_BoxesColourSpeed","type":0,"value":"0",},
        {"name":"g_BoxesColours","type":0,"value":"256",},
        {"name":"g_BoxesSharpness","type":0,"value":"0.617",},
        {"name":"g_BoxesPalette","type":2,"value":"sprTechnoPallette",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"Effect_2","depth":400,"effectEnabled":true,"effectType":"_filter_contrast","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_ContrastIntensity","type":0,"value":"0.75",},
        {"name":"g_ContrastBrightness","type":0,"value":"0.6",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"BigBlueSquares","depth":500,"effectEnabled":true,"effectType":"_filter_boxes","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_BoxesScale","type":0,"value":"134",},
        {"name":"g_BoxesSize","type":0,"value":"1",},
        {"name":"g_BoxesSize","type":0,"value":"1",},
        {"name":"g_BoxesDisplacement","type":0,"value":"1",},
        {"name":"g_BoxesSpeed","type":0,"value":"0.45",},
        {"name":"g_BoxesAngle","type":0,"value":"25",},
        {"name":"g_BoxesRotation","type":0,"value":"2.5",},
        {"name":"g_BoxesRotation","type":0,"value":"-2.25",},
        {"name":"g_BoxesRoundness","type":0,"value":"0.675",},
        {"name":"g_BoxesColourSpeed","type":0,"value":"0",},
        {"name":"g_BoxesColours","type":0,"value":"256",},
        {"name":"g_BoxesSharpness","type":0,"value":"0.617",},
        {"name":"g_BoxesPalette","type":2,"value":"sprTechnoPallette",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4289559828,"depth":600,"effectEnabled":true,"effectType":"none","gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "stages",
    "path": "folders/Rooms/stages.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 768,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 1366,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": false,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}