{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rmstage_harmonica",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_66C727E","path":"rooms/rmstage_harmonica/rmstage_harmonica.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"ShakeLayer","depth":0,"effectEnabled":true,"effectType":"_filter_twist_blur","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_TwistBlurCenter","type":0,"value":"0.5",},
        {"name":"g_TwistBlurCenter","type":0,"value":"0.5",},
        {"name":"g_TwistBlurIntensity","type":0,"value":"0",},
        {"name":"g_TwistBlurTexture","type":2,"value":"_filter_twist_blur_texture",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_66C727E","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oStageSpawnerBase","path":"objects/oStageSpawnerBase/oStageSpawnerBase.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oStageSpawnerBase","path":"objects/oStageSpawnerBase/oStageSpawnerBase.yy",},"propertyId":{"name":"beatmap_path","path":"objects/oStageSpawnerBase/oStageSpawnerBase.yy",},"value":"levelbank/world_harmonius/level_bazaar/beatmap.json",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":640.0,"y":256.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Mountains","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_679517EE","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":0.7101013,"scaleY":0.71010137,"spriteId":{"name":"sprMountains","path":"sprites/sprMountains/sprMountains.yy",},"x":2.9276733,"y":2.1504517,},
      ],"depth":200,"effectEnabled":true,"effectType":"_filter_tintfilter","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_TintCol","type":1,"value":"#FF664250",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"MoonImage","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_2F53AC03","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":0.43549997,"scaleY":0.43549997,"spriteId":{"name":"sprMoon","path":"sprites/sprMoon/sprMoon.yy",},"x":1087.5247,"y":56.750015,},
      ],"depth":300,"effectEnabled":true,"effectType":"_filter_hue","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_HueShift","type":0,"value":"0.4",},
        {"name":"g_HueSaturation","type":0,"value":"1.25",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"Twist","depth":400,"effectEnabled":true,"effectType":"_filter_twist_blur","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_TwistBlurCenter","type":0,"value":"0.875",},
        {"name":"g_TwistBlurCenter","type":0,"value":"0.22",},
        {"name":"g_TwistBlurIntensity","type":0,"value":"0.015",},
        {"name":"g_TwistBlurTexture","type":2,"value":"_filter_twist_blur_texture",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"MoonGlow","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_166AB0D1","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":0.42249998,"scaleY":0.42249998,"spriteId":{"name":"sprMoon","path":"sprites/sprMoon/sprMoon.yy",},"x":1087.0,"y":58.0,},
      ],"depth":500,"effectEnabled":true,"effectType":"_effect_glow","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_GlowRadius","type":0,"value":"796",},
        {"name":"g_GlowQuality","type":0,"value":"6.22",},
        {"name":"g_GlowIntensity","type":0,"value":"0.4",},
        {"name":"g_GlowGamma","type":0,"value":"1.45",},
        {"name":"g_GlowAlpha","type":0,"value":"1",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"Dots","depth":600,"effectEnabled":true,"effectType":"_filter_dots","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_DotsScale","type":0,"value":"24",},
        {"name":"g_DotsSize","type":0,"value":"0.25",},
        {"name":"g_DotsSize","type":0,"value":"0.425",},
        {"name":"g_DotsOffset","type":0,"value":"0",},
        {"name":"g_DotsOffset","type":0,"value":"0",},
        {"name":"g_DotsDisplacement","type":0,"value":"1",},
        {"name":"g_DotsSpeed","type":0,"value":"2",},
        {"name":"g_DotsColourSpeed","type":0,"value":"0",},
        {"name":"g_DotsColours","type":0,"value":"256",},
        {"name":"g_DotsSharpness","type":0,"value":"2",},
        {"name":"g_DotsPalette","type":2,"value":"logo_pallette",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":700,"effectEnabled":true,"effectType":"_filter_gradient","gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_GradientColour1","type":1,"value":"#FF110601",},
        {"name":"g_GradientColour2","type":1,"value":"#FF630E30",},
        {"name":"g_GradientPosition1","type":0,"value":"1",},
        {"name":"g_GradientPosition1","type":0,"value":"0",},
        {"name":"g_GradientPosition2","type":0,"value":"0",},
        {"name":"g_GradientPosition2","type":0,"value":"1",},
        {"name":"g_GradientMode","type":0,"value":"1",},
      ],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
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
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1920,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
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
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}