within AixLib.Systems.ModularAHU.Examples;
model AhuDcv "Example for air hanling unit with demand controlled ventilation"
  extends Modelica.Icons.Example;

  replaceable package MediumAir = AixLib.Media.Air (extraPropertiesNames={"CO2"})
    "Medium in air canal in the component";
  replaceable package MediumWater = AixLib.Media.Water
    "Medium in hydronic systems";

  AixLib.Systems.ModularAHU.GenericAHU genericAHU(
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    preheater(
      T_start=288.15,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      redeclare HydraulicModules.Admix hydraulicModule(
        pipeModel="PlugFlowPipe",
        parameterPipe=AixLib.DataBase.Pipes.Copper.Copper_28x1_5(),
        parameterIso=AixLib.DataBase.Pipes.Insulation.Iso25pc(),
        length=1,
        Kv=10,
        valveCharacteristic=AixLib.Fluid.Actuators.Valves.Data.LinearEqualPercentage(a_ab=AixLib.Fluid.Actuators.Valves.Data.Generic(y={0,0.13,0.205,0.566,0.813,0.88,0.91,0.95,1}, phi={0,0.001,0.002,0.176,0.60,0.75,0.97,0.98,1}), b_ab=AixLib.Fluid.Actuators.Valves.Data.Generic(y={0,0.1,0.2,0.25,0.52,0.8,0.9,0.95,1}, phi={0,0.001,0.002,0.022,0.53,0.96,0.98,0.99,1})),
        valve(use_inputFilter=true),
        pipe1(length=1.53),
        pipe2(length=0.54),
        pipe3(length=1.06),
        pipe4(parameterPipe=AixLib.DataBase.Pipes.Copper.Copper_35x1_5(), length=0.48),
        pipe5(length=1.44, fac=16),
        pipe6(length=0.52),
        redeclare HydraulicModules.BaseClasses.PumpInterface_PumpSpeedControlled PumpInterface(pumpParam=AixLib.DataBase.Pumps.PumpPolynomialBased.Pump_DN25_H1_8_V9(), calculatePower=true)),
      tau=90 + 70,
      T_amb=293.15,
      dynamicHX(
        dp1_nominal=66,
        dp2_nominal=6000 + 8000,
        nNodes=5,
        dT_nom=43.9,
        Q_nom=57700)),
    redeclare package Medium1 = MediumAir,
    redeclare package Medium2 = MediumWater,
    T_amb=293.15,
    m1_flow_nominal=1,
    m2_flow_nominal=0.5,
    usePreheater=true,
    useHumidifierRet=false,
    useHumidifier=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    cooler(
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      redeclare HydraulicModules.Admix hydraulicModule(
        pipeModel="PlugFlowPipe",
        parameterPipe=AixLib.DataBase.Pipes.Copper.Copper_35x1_5(),
        parameterIso=AixLib.DataBase.Pipes.Insulation.Iso25pc(),
        length=1,
        Kv=10,
        T_start=294.75,
        valveCharacteristic=AixLib.Fluid.Actuators.Valves.Data.LinearEqualPercentage(a_ab=AixLib.Fluid.Actuators.Valves.Data.Generic(y={0,0.07,0.12,0.45,0.65,0.89,0.93,0.96,1}, phi={0,0.001,0.002,0.08,0.29,0.75,0.94,0.98,1}), b_ab=AixLib.Fluid.Actuators.Valves.Data.Generic(y={0,0.1,0.2,0.26,0.52,0.8,0.9,0.95,1}, phi={0,0.001,0.002,0.05,0.45,0.96,0.98,0.99,1})),
        valve(use_inputFilter=true),
        pipe1(
          T_start=283.15,
          parameterPipe=AixLib.DataBase.Pipes.Copper.Copper_54x2(),
          length=4.5),
        pipe2(length=1.55),
        pipe3(length=0.9),
        pipe4(length=0.3),
        pipe5(length=2.95, fac=13),
        pipe6(parameterPipe=AixLib.DataBase.Pipes.Copper.Copper_22x1_1(), length=0.5),
        redeclare HydraulicModules.BaseClasses.PumpInterface_PumpSpeedControlled PumpInterface(pumpParam=AixLib.DataBase.Pumps.PumpPolynomialBased.Pump_DN32(), calculatePower=true)),
      T_start=293.65,
      tau=90,
      T_amb=296.65,
      dynamicHX(
        dp1_nominal(displayUnit="bar") = 138,
        dp2_nominal(displayUnit="bar") = 70600,
        nNodes=4,
        T1_start=305.15,
        dT_nom=22.16,
        Q_nom=53400)),
    heater(
      T_start=285.65,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      redeclare HydraulicModules.Admix hydraulicModule(
        pipeModel="PlugFlowPipe",
        parameterPipe=AixLib.DataBase.Pipes.Copper.Copper_22x1(),
        parameterIso=AixLib.DataBase.Pipes.Insulation.Iso25pc(),
        length=1,
        Kv=6.3,
        valveCharacteristic=AixLib.Fluid.Actuators.Valves.Data.LinearEqualPercentage(a_ab=AixLib.Fluid.Actuators.Valves.Data.Generic(y={0.0,0.14,0.24,0.43,0.68,0.81,0.93,0.96,1.0}, phi={0.0,0.001,0.002,0.02,0.1,0.25,0.76,0.98,1.0}), b_ab=AixLib.Fluid.Actuators.Valves.Data.Generic(y={0.0,0.02,0.05,0.08,0.27,0.6,0.95,1.0}, phi={0.0,0.001,0.002,0.01,0.3,0.9,0.97,1.0})),
        valve(use_inputFilter=false),
        pipe1(length=2.8, fac=9),
        pipe2(length=0.63, parameterPipe=AixLib.DataBase.Pipes.Copper.Copper_35x1_5()),
        pipe3(parameterPipe=AixLib.DataBase.Pipes.Copper.Copper_35x1_5(), length=1.85),
        pipe4(parameterPipe=AixLib.DataBase.Pipes.Copper.Copper_35x1_5(), length=0.4),
        pipe5(length=3.2, fac=10),
        pipe6(parameterPipe=AixLib.DataBase.Pipes.Copper.Copper_16x1(), length=0.82),
        redeclare HydraulicModules.BaseClasses.PumpInterface_PumpSpeedControlled PumpInterface(pumpParam=AixLib.DataBase.Pumps.PumpPolynomialBased.Pump_DN25_H1_8_V5(), calculatePower=true)),
      tau=90,
      T_amb=293.15,
      dynamicHX(
        dp1_nominal=33,
        dp2_nominal=4500 + 55000,
        nNodes=4,
        dT_nom=40.1,
        Q_nom=22300)),
    dynamicHX(
      dp1_nominal=220,
      dp2_nominal=220,
      dT_nom=1,
      Q_nom=1100),
    humidifier(
      dp_nominal=100,
      mWat_flow_nominal=1,
      TLiqWat_in=288.15),
    humidifierRet(
      dp_nominal=100,
      mWat_flow_nominal=0.5,
      TLiqWat_in=288.15))
    annotation (Placement(transformation(extent={{-80,-34},{40,32}})));
  ThermalZones.ReducedOrder.ThermalZone.ThermalZone thermalZone(
    redeclare package Medium = MediumAir,
    zoneParam=AixLib.DataBase.ThermalZones.OfficePassiveHouse.OPH_1_OfficeNoHeaterCooler(useConstantACHrate=true),
    use_C_flow=true,
    use_moisture_balance=true,
    internalGainsMode=3,
    use_NaturalAirExchange=true,
    nPorts=2)            annotation (Placement(transformation(extent={{64,56},{84,76}})));
  Fluid.Sources.Boundary_pT SourcePreheater(
    nPorts=1,
    redeclare package Medium = MediumWater,
    T=333.15) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=270,
        origin={-64,-80})));
  Fluid.Sources.Boundary_pT SinkPreheater(
    nPorts=1,
    redeclare package Medium = MediumWater,
    p=102000,
    T=283.15) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=270,
        origin={-44,-80})));
  Fluid.Sources.Boundary_pT SourceCooler(
    nPorts=1,
    redeclare package Medium = MediumWater,
    T=283.15) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=270,
        origin={-20,-80})));
  Fluid.Sources.Boundary_pT SinkCooler(
    nPorts=1,
    redeclare package Medium = MediumWater,
    T=283.15) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=270,
        origin={-4,-80})));
  Fluid.Sources.Boundary_pT SourceHeater(
    nPorts=1,
    redeclare package Medium = MediumWater,
    T=333.15) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=270,
        origin={14,-80})));
  Fluid.Sources.Boundary_pT SinkHeater(nPorts=1, redeclare package Medium = MediumWater)
                     annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=270,
        origin={30,-80})));
  Fluid.Sources.Outside out(nPorts=1, redeclare package Medium = MediumAir) annotation (Placement(transformation(extent={{-122,-20},{-102,0}})));
  Fluid.Sources.Boundary_pT boundaryExhaustAir(nPorts=1, redeclare package Medium = MediumAir)
                          annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-108,24})));
  BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=ModelicaServices.ExternalReferences.loadResource("modelica://AixLib/Resources/weatherdata/TRY2015_Jahr_City_Aachen.mos"), computeWetBulbTemperature=false) annotation (Placement(transformation(extent={{-124,58},{-104,78}})));
  Modelica.Blocks.Sources.CombiTimeTable internalGains(
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    tableName="UserProfiles",
    fileName=Modelica.Utilities.Files.loadResource("modelica://AixLib/Resources/LowOrder_ExampleData/UserProfiles_18599_SIA_Besprechung_Sitzung_Seminar.txt"),
    columns={2,3,4},
    tableOnFile=false,
    table=[0,0,0.1,0,0; 3540,0,0.1,0,0; 3600,0,0.1,0,0; 7140,0,0.1,0,0; 7200,0,0.1,0,0; 10740,0,0.1,0,0; 10800,0,0.1,0,0; 14340,0,0.1,0,0; 14400,0,0.1,0,0; 17940,0,0.1,0,0; 18000,0,0.1,0,0; 21540,0,0.1,0,0; 21600,0,0.1,0,0; 25140,0,0.1,0,0; 25200,0,0.1,0,0; 28740,0,0.1,0,0; 28800,0,0.1,0,0; 32340,0,0.1,0,0; 32400,0.6,0.6,1,1; 35940,0.6,0.6,1,1; 36000,1,1,1,1; 39540,1,1,1,1; 39600,0.4,0.4,1,1; 43140,0.4,0.4,1,1; 43200,0,0.1,0,0; 46740,0,0.1,0,0; 46800,0,0.1,0,0; 50340,0,0.1,0,0; 50400,0.6,0.6,1,1; 53940,0.6,0.6,1,1; 54000,1,1,1,1; 57540,1,1,1,1; 57600,0.4,0.4,1,1; 61140,0.4,0.4,1,1; 61200,0,0.1,0,0; 64740,0,0.1,0,0; 64800,0,0.1,0,0; 68340,0,0.1,0,0; 68400,0,0.1,0,0; 71940,0,0.1,0,0; 72000,0,0.1,0,0; 75540,0,0.1,0,0; 75600,0,0.1,0,0; 79140,0,0.1,0,0; 79200,0,0.1,0,0; 82740,0,0.1,0,0; 82800,0,0.1,0,0; 86340,0,0.1,0,0; 86400,0,0.1,0,0; 89940,0,0.1,0,0; 90000,0,0.1,0,0; 93540,0,0.1,0,0; 93600,0,0.1,0,0; 97140,0,0.1,0,0; 97200,0,0.1,0,0; 100740,0,0.1,0,0; 100800,0,0.1,0,0; 104340,0,0.1,0,0;
        104400,0,0.1,0,0; 107940,0,0.1,0,0; 108000,0,0.1,0,0; 111540,0,0.1,0,0; 111600,0,0.1,0,0; 115140,0,0.1,0,0; 115200,0,0.1,0,0; 118740,0,0.1,0,0; 118800,0.6,0.6,1,1; 122340,0.6,0.6,1,1; 122400,1,1,1,1; 125940,1,1,1,1; 126000,0.4,0.4,1,1; 129540,0.4,0.4,1,1; 129600,0,0.1,0,0; 133140,0,0.1,0,0; 133200,0,0.1,0,0; 136740,0,0.1,0,0; 136800,0.6,0.6,1,1; 140340,0.6,0.6,1,1; 140400,1,1,1,1; 143940,1,1,1,1; 144000,0.4,0.4,1,1; 147540,0.4,0.4,1,1; 147600,0,0.1,0,0; 151140,0,0.1,0,0; 151200,0,0.1,0,0; 154740,0,0.1,0,0; 154800,0,0.1,0,0; 158340,0,0.1,0,0; 158400,0,0.1,0,0; 161940,0,0.1,0,0; 162000,0,0.1,0,0; 165540,0,0.1,0,0; 165600,0,0.1,0,0; 169140,0,0.1,0,0; 169200,0,0.1,0,0; 172740,0,0.1,0,0; 172800,0,0.1,0,0; 176340,0,0.1,0,0; 176400,0,0.1,0,0; 179940,0,0.1,0,0; 180000,0,0.1,0,0; 183540,0,0.1,0,0; 183600,0,0.1,0,0; 187140,0,0.1,0,0; 187200,0,0.1,0,0; 190740,0,0.1,0,0; 190800,0,0.1,0,0; 194340,0,0.1,0,0; 194400,0,0.1,0,0; 197940,0,0.1,0,0; 198000,0,0.1,0,0; 201540,0,0.1,0,0; 201600,0,0.1,
        0,0; 205140,0,0.1,0,0; 205200,0.6,0.6,1,1; 208740,0.6,0.6,1,1; 208800,1,1,1,1; 212340,1,1,1,1; 212400,0.4,0.4,1,1; 215940,0.4,0.4,1,1; 216000,0,0.1,0,0; 219540,0,0.1,0,0; 219600,0,0.1,0,0; 223140,0,0.1,0,0; 223200,0.6,0.6,1,1; 226740,0.6,0.6,1,1; 226800,1,1,1,1; 230340,1,1,1,1; 230400,0.4,0.4,1,1; 233940,0.4,0.4,1,1; 234000,0,0.1,0,0; 237540,0,0.1,0,0; 237600,0,0.1,0,0; 241140,0,0.1,0,0; 241200,0,0.1,0,0; 244740,0,0.1,0,0; 244800,0,0.1,0,0; 248340,0,0.1,0,0; 248400,0,0.1,0,0; 251940,0,0.1,0,0; 252000,0,0.1,0,0; 255540,0,0.1,0,0; 255600,0,0.1,0,0; 259140,0,0.1,0,0; 259200,0,0.1,0,0; 262740,0,0.1,0,0; 262800,0,0.1,0,0; 266340,0,0.1,0,0; 266400,0,0.1,0,0; 269940,0,0.1,0,0; 270000,0,0.1,0,0; 273540,0,0.1,0,0; 273600,0,0.1,0,0; 277140,0,0.1,0,0; 277200,0,0.1,0,0; 280740,0,0.1,0,0; 280800,0,0.1,0,0; 284340,0,0.1,0,0; 284400,0,0.1,0,0; 287940,0,0.1,0,0; 288000,0,0.1,0,0; 291540,0,0.1,0,0; 291600,0.6,0.6,1,1; 295140,0.6,0.6,1,1; 295200,1,1,1,1; 298740,1,1,1,1; 298800,0.4,0.4,1,1; 302340,
        0.4,0.4,1,1; 302400,0,0.1,0,0; 305940,0,0.1,0,0; 306000,0,0.1,0,0; 309540,0,0.1,0,0; 309600,0.6,0.6,1,1; 313140,0.6,0.6,1,1; 313200,1,1,1,1; 316740,1,1,1,1; 316800,0.4,0.4,1,1; 320340,0.4,0.4,1,1; 320400,0,0.1,0,0; 323940,0,0.1,0,0; 324000,0,0.1,0,0; 327540,0,0.1,0,0; 327600,0,0.1,0,0; 331140,0,0.1,0,0; 331200,0,0.1,0,0; 334740,0,0.1,0,0; 334800,0,0.1,0,0; 338340,0,0.1,0,0; 338400,0,0.1,0,0; 341940,0,0.1,0,0; 342000,0,0.1,0,0; 345540,0,0.1,0,0; 345600,0,0.1,0,0; 349140,0,0.1,0,0; 349200,0,0.1,0,0; 352740,0,0.1,0,0; 352800,0,0.1,0,0; 356340,0,0.1,0,0; 356400,0,0.1,0,0; 359940,0,0.1,0,0; 360000,0,0.1,0,0; 363540,0,0.1,0,0; 363600,0,0.1,0,0; 367140,0,0.1,0,0; 367200,0,0.1,0,0; 370740,0,0.1,0,0; 370800,0,0.1,0,0; 374340,0,0.1,0,0; 374400,0,0.1,0,0; 377940,0,0.1,0,0; 378000,0.6,0.6,1,1; 381540,0.6,0.6,1,1; 381600,1,1,1,1; 385140,1,1,1,1; 385200,0.4,0.4,1,1; 388740,0.4,0.4,1,1; 388800,0,0.1,0,0; 392340,0,0.1,0,0; 392400,0,0.1,0,0; 395940,0,0.1,0,0; 396000,0.6,0.6,1,1; 399540,0.6,0.6,
        1,1; 399600,1,1,1,1; 403140,1,1,1,1; 403200,0.4,0.4,1,1; 406740,0.4,0.4,1,1; 406800,0,0.1,0,0; 410340,0,0.1,0,0; 410400,0,0.1,0,0; 413940,0,0.1,0,0; 414000,0,0.1,0,0; 417540,0,0.1,0,0; 417600,0,0.1,0,0; 421140,0,0.1,0,0; 421200,0,0.1,0,0; 424740,0,0.1,0,0; 424800,0,0.1,0,0; 428340,0,0.1,0,0; 428400,0,0.1,0,0; 431940,0,0.1,0,0; 432000,0,0,0,0; 435540,0,0,0,0; 435600,0,0,0,0; 439140,0,0,0,0; 439200,0,0,0,0; 442740,0,0,0,0; 442800,0,0,0,0; 446340,0,0,0,0; 446400,0,0,0,0; 449940,0,0,0,0; 450000,0,0,0,0; 453540,0,0,0,0; 453600,0,0,0,0; 457140,0,0,0,0; 457200,0,0,0,0; 460740,0,0,0,0; 460800,0,0,0,0; 464340,0,0,0,0; 464400,0,0,0,0; 467940,0,0,0,0; 468000,0,0,0,0; 471540,0,0,0,0; 471600,0,0,0,0; 475140,0,0,0,0; 475200,0,0,0,0; 478740,0,0,0,0; 478800,0,0,0,0; 482340,0,0,0,0; 482400,0,0,0,0; 485940,0,0,0,0; 486000,0,0,0,0; 489540,0,0,0,0; 489600,0,0,0,0; 493140,0,0,0,0; 493200,0,0,0,0; 496740,0,0,0,0; 496800,0,0,0,0; 500340,0,0,0,0; 500400,0,0,0,0; 503940,0,0,0,0; 504000,0,0,0,0; 507540,
        0,0,0,0; 507600,0,0,0,0; 511140,0,0,0,0; 511200,0,0,0,0; 514740,0,0,0,0; 514800,0,0,0,0; 518340,0,0,0,0; 518400,0,0,0,0; 521940,0,0,0,0; 522000,0,0,0,0; 525540,0,0,0,0; 525600,0,0,0,0; 529140,0,0,0,0; 529200,0,0,0,0; 532740,0,0,0,0; 532800,0,0,0,0; 536340,0,0,0,0; 536400,0,0,0,0; 539940,0,0,0,0; 540000,0,0,0,0; 543540,0,0,0,0; 543600,0,0,0,0; 547140,0,0,0,0; 547200,0,0,0,0; 550740,0,0,0,0; 550800,0,0,0,0; 554340,0,0,0,0; 554400,0,0,0,0; 557940,0,0,0,0; 558000,0,0,0,0; 561540,0,0,0,0; 561600,0,0,0,0; 565140,0,0,0,0; 565200,0,0,0,0; 568740,0,0,0,0; 568800,0,0,0,0; 572340,0,0,0,0; 572400,0,0,0,0; 575940,0,0,0,0; 576000,0,0,0,0; 579540,0,0,0,0; 579600,0,0,0,0; 583140,0,0,0,0; 583200,0,0,0,0; 586740,0,0,0,0; 586800,0,0,0,0; 590340,0,0,0,0; 590400,0,0,0,0; 593940,0,0,0,0; 594000,0,0,0,0; 597540,0,0,0,0; 597600,0,0,0,0; 601140,0,0,0,0; 601200,0,0,0,0; 604740,0,0,0,0])
    "Table with profiles for internal gains"
    annotation(Placement(transformation(extent={{100,23},{86,37}})));
  Controller.CtrAHUBasic ctrAHUBasic(
    TFlowSet=293.15,
    useExternalTset=false,
    useTwoFanCtr=true,
    initType=Modelica.Blocks.Types.Init.InitialState,
    ctrRh(k=0.01))
    annotation (Placement(transformation(extent={{-56,38},{-36,58}})));
equation
  connect(genericAHU.port_a2, thermalZone.ports[1]) annotation (Line(points={{40.5455,20},{72,20},{72,40},{71.65,40},{71.65,58.8}}, color={0,127,255}));
  connect(genericAHU.port_b1, thermalZone.ports[2]) annotation (Line(points={{40.5455,-4},{76.35,-4},{76.35,58.8}}, color={0,127,255}));
  connect(SourcePreheater.ports[1], genericAHU.port_a3) annotation (Line(points={{-64,-72},{-64,-34},{-63.6364,-34}},
                                               color={0,127,255}));
  connect(SinkPreheater.ports[1], genericAHU.port_b3) annotation (Line(points={{-44,-72},{-44,-34},{-52.7273,-34}},
                                              color={0,127,255}));
  connect(SourceCooler.ports[1], genericAHU.port_a4) annotation (Line(points={{-20,-72},{-20,-34}},
                                             color={0,127,255}));
  connect(SinkCooler.ports[1], genericAHU.port_b4) annotation (Line(points={{-4,-72},{-8,-72},{-8,-34},{-9.09091,-34}},
                                                 color={0,127,255}));
  connect(SourceHeater.ports[1], genericAHU.port_a5) annotation (Line(points={{14,-72},{12,-72},{12,-62},{2,-62},{2,-34},{1.81818,-34}},
                                                                   color={0,127,
          255}));
  connect(SinkHeater.ports[1], genericAHU.port_b5) annotation (Line(points={{30,-72},{30,-66},{12.1818,-66},{12.1818,-34}},
                                                      color={0,127,255}));
  connect(out.ports[1], genericAHU.port_a1) annotation (Line(points={{-102,-10},{-86,-10},{-86,-4},{-80,-4}}, color={0,127,255}));
  connect(genericAHU.port_b2, boundaryExhaustAir.ports[1]) annotation (Line(points={{-80,20},{-90,20},{-90,24},{-98,24}}, color={0,127,255}));
  connect(weaDat.weaBus, out.weaBus) annotation (Line(
      points={{-104,68},{-98,68},{-98,42},{-132,42},{-132,-9.8},{-122,-9.8}},
      color={255,204,51},
      thickness=0.5));
  connect(weaDat.weaBus, thermalZone.weaBus) annotation (Line(
      points={{-104,68},{56,68},{56,72},{64,72}},
      color={255,204,51},
      thickness=0.5));
  connect(internalGains.y, thermalZone.intGains) annotation (Line(points={{85.3,30},{82,30},{82,57.6}}, color={0,0,127}));
  connect(ctrAHUBasic.genericAHUBus, genericAHU.genericAHUBus) annotation (Line(
      points={{-36,48.1},{-20,48.1},{-20,32.3}},
      color={255,204,51},
      thickness=0.5));
end AhuDcv;
