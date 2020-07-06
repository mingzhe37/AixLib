within AixLib.ThermalZones.HighOrder.Validation.ASHRAE140;
model Case650
  extends Modelica.Icons.Example;
  parameter AixLib.DataBase.Profiles.ProfileBaseDataDefinition SetTempProfile = AixLib.DataBase.Profiles.ASHRAE140.SetTemp_caseX50();
  parameter AixLib.DataBase.Profiles.ProfileBaseDataDefinition AERProfile = AixLib.DataBase.Profiles.ASHRAE140.Ventilation_caseX50();

  AixLib.BoundaryConditions.WeatherData.Old.WeatherTRY.BaseClasses.Sun sun(
    TimeCorrection=0,
    Latitude=39.76,
    Longitude=-104.9,
    DiffWeatherDataTime=-7,
    Diff_localStandardTime_WeatherDataTime=0.5)
    annotation (Placement(transformation(extent={{-142,61},{-118,85}})));
  AixLib.BoundaryConditions.WeatherData.Old.WeatherTRY.RadiationOnTiltedSurface.RadOnTiltedSurf_Perez
    radOnTiltedSurf_Perez[5](
    Azimut={180,-90,0,90,0},
    Tilt={90,90,90,90,0},
    each GroundReflection= 0.2,
    each Latitude= 39.76,
    each h= 1609,
    each WeatherFormat=2) "N,E,S,W, Horz"
    annotation (Placement(transformation(extent={{-102,56},{-74,84}})));

  Modelica.Blocks.Sources.CombiTimeTable Solar_Radiation(
    tableOnFile=true,
    tableName="Table",
    columns={2,3},
    fileName=Modelica.Utilities.Files.loadResource("modelica://AixLib/Resources/WeatherData/Weatherdata_ASHARE140.mat"))
    annotation (Placement(transformation(extent={{-114,2},{-94,22}})));
  Modelica.Blocks.Sources.CombiTimeTable Source_Weather(
    tableOnFile=true,
    tableName="Table",
    columns={4,5,6,7},
    fileName=Modelica.Utilities.Files.loadResource("modelica://AixLib/Resources/WeatherData/Weatherdata_ASHARE140.mat"))
    annotation (Placement(transformation(extent={{-114,30},{-94,50}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature outsideTemp
    "ambient temperature"
    annotation (Placement(transformation(extent={{-70,41},{-59,52}})));
  Rooms.ASHRAE140.SouthFacingWindows Room(
    calcMethodIn=3,
    calcMethodOut=2,
    absInnerWallSurf=AixLib.ThermalZones.HighOrder.Components.Types.selectorCoefficients.abs06,
    outerWall_South(
      calcMethodIn=3,
      heatTransfer_Outside(calcMethod=2),
      windowSimple(redeclare model correctionSolarGain =
            Components.WindowsDoors.BaseClasses.CorrectionSolarGain.CorG_ASHRAE140),
      Wall(
        surfaceOrientation=1,
        calcMethod=3,
        heatConv(calcMethod=3, surfaceOrientation=1))),
    ceiling(
      ISOrientation=3,
      calcMethodIn=4,
      heatTransfer_Outside(calcMethod=2),
      Wall(
        surfaceOrientation=3,
        calcMethod=3,
        heatConv(calcMethod=3, surfaceOrientation=3))),
    outerWall_West(
      calcMethodIn=3,
      heatTransfer_Outside(calcMethod=2),
      Wall(
        surfaceOrientation=1,
        calcMethod=3,
        heatConv(calcMethod=3, surfaceOrientation=1))),
    outerWall_North(
      calcMethodIn=3,
      heatTransfer_Outside(calcMethod=2),
      Wall(
        surfaceOrientation=1,
        calcMethod=3,
        heatConv(calcMethod=3, surfaceOrientation=1))),
    outerWall_East(
      calcMethodIn=3,
      heatTransfer_Outside(calcMethod=2),
      Wall(
        surfaceOrientation=1,
        calcMethod=3,
        heatConv(calcMethod=3, surfaceOrientation=1))),
    floor(
      ISOrientation=2,
      calcMethodIn=3,
      Wall(
        surfaceOrientation=2,
        calcMethod=3,
        heatConv(calcMethod=3, surfaceOrientation=2))),
    redeclare Components.Types.CoeffTableSouthWindow partialCoeffTable)                         annotation (Placement(transformation(extent={{-4,36},
            {38,77}})));

  Utilities.Sources.HourOfDay hourOfDay
    annotation (Placement(transformation(extent={{104,78},{117,90}})));
  Modelica.Blocks.Interfaces.RealOutput AnnualCoolingLoad "in kWh"
    annotation (Placement(transformation(extent={{111,38},{131,58}})));
  Modelica.Blocks.Interfaces.RealOutput PowerLoad "in kW"
    annotation (Placement(transformation(extent={{111,22},{131,42}})));
  Modelica.Blocks.Interfaces.RealOutput IncidentSolarRadiationN "in kWh/m2"
    annotation (Placement(transformation(extent={{111,5},{131,25}})));
  Modelica.Blocks.Interfaces.RealOutput IncidentSolarRadiationE "in kWh/m2"
    annotation (Placement(transformation(extent={{112,-12},{132,8}})));
  Modelica.Blocks.Interfaces.RealOutput IncidentSolarRadiationW "in kWh/m2"
    annotation (Placement(transformation(extent={{111,-32},{131,-12}})));
  Modelica.Blocks.Interfaces.RealOutput IncidentSolarRadiationS "in kWh/m2"
    annotation (Placement(transformation(extent={{111,-51},{131,-31}})));
  Modelica.Blocks.Interfaces.RealOutput TransmittedSolarRadiation_room
    "in kWh/m2"
    annotation (Placement(transformation(extent={{111,-97},{131,-77}})));
  Modelica.Blocks.Sources.Constant Source_InternalGains(k=200)
    annotation (Placement(transformation(extent={{-146,-57},{-133,-44}})));
  Utilities.Sources.HeaterCooler.HeaterCoolerPI idealHeaterCooler(
    Heater_on=false,
    TN_heater=1,
    TN_cooler=1,
    h_heater=1e6,
    KR_heater=1000,
    l_cooler=-1e6,
    KR_cooler=1000,
    recOrSep=false)
    annotation (Placement(transformation(extent={{-16,-39},{4,-19}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow Ground(Q_flow=0)
    "adiabatic boundary"
    annotation (Placement(transformation(extent={{-99,-32},{-79,-12}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow
    InternalGains_convective
    annotation (Placement(transformation(extent={{-99,-54},{-79,-34}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow
    InternalGains_radiative
    annotation (Placement(transformation(extent={{-99,-79},{-79,-59}})));
  Modelica.Blocks.Continuous.Integrator integrator
    annotation (Placement(transformation(extent={{72,41.5},{83,52.5}})));
  Modelica.Blocks.Sources.RealExpression CoolingPower(y=idealHeaterCooler.coolingPower)
    annotation (Placement(transformation(extent={{44,37},{64,57}})));
  Modelica.Blocks.Math.UnitConversions.To_kWh to_kWh1
    annotation (Placement(transformation(extent={{90,42},{101,53}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=1)
    "Sum of heating and cooling power"
    annotation (Placement(transformation(extent={{83,27},{93,37}})));
  Modelica.Blocks.Math.Gain convectiveInternalGains(k=0.4) "Convective part"
    annotation (Placement(transformation(extent={{-123,-49},{-113,-39}})));
  Modelica.Blocks.Math.Gain radiativeInternalGains(k=0.6) "Radiative part"
    annotation (Placement(transformation(extent={{-122,-74},{-112,-64}})));
  Modelica.Blocks.Sources.RealExpression TransmittedRad(y=Room.outerWall_South.solarRadWinTrans)
    annotation (Placement(transformation(extent={{45,-82},{65,-62}})));
  Modelica.Blocks.Continuous.Integrator integrator2
    annotation (Placement(transformation(extent={{75,-77},{84,-67.5}})));
  Modelica.Blocks.Math.UnitConversions.To_kWh to_kWh2
    annotation (Placement(transformation(extent={{95,-76},{104,-67}})));
  Modelica.Blocks.Math.Gain gainIntHea(k=1/(Room.Win_Area))
    "Converts to MWh"
    annotation (Placement(transformation(extent={{76,-90},{83,-83}})));
  Modelica.Blocks.Sources.RealExpression SolarRadN(y=Room.outerWall_North.SolarRadiationPort.I)
    annotation (Placement(transformation(extent={{44,4},{64,24}})));
  Modelica.Blocks.Sources.RealExpression SolarRadS(y=Room.outerWall_South.SolarRadiationPort.I)
    annotation (Placement(transformation(extent={{44,-51},{64,-31}})));
  Modelica.Blocks.Sources.RealExpression SolarRadW(y=Room.outerWall_West.SolarRadiationPort.I)
    annotation (Placement(transformation(extent={{44,-32},{64,-12}})));
  Modelica.Blocks.Sources.RealExpression SolarRadE(y=Room.outerWall_East.SolarRadiationPort.I)
    annotation (Placement(transformation(extent={{44,-13},{64,7}})));
  Modelica.Blocks.Math.UnitConversions.To_kWh to_kWh6
    annotation (Placement(transformation(extent={{93,-45},{102,-36}})));
  Modelica.Blocks.Math.UnitConversions.To_kWh to_kWh3
    annotation (Placement(transformation(extent={{93,-26},{102,-17}})));
  Modelica.Blocks.Math.UnitConversions.To_kWh to_kWh4
    annotation (Placement(transformation(extent={{92,-7},{101,2}})));
  Modelica.Blocks.Math.UnitConversions.To_kWh to_kWh5
    annotation (Placement(transformation(extent={{91,10},{100,19}})));
  Modelica.Blocks.Continuous.Integrator integrator3
    annotation (Placement(transformation(extent={{74,-27.5},{85,-16.5}})));
  Modelica.Blocks.Continuous.Integrator integrator4
    annotation (Placement(transformation(extent={{73,-8.5},{84,2.5}})));
  Modelica.Blocks.Continuous.Integrator integrator5
    annotation (Placement(transformation(extent={{73,8.5},{84,19.5}})));
  Modelica.Blocks.Continuous.Integrator integrator6
    annotation (Placement(transformation(extent={{74,-46.5},{85,-35.5}})));
  Modelica.Blocks.Sources.RealExpression SolarRadCeiling(y=Room.ceiling.SolarRadiationPort.I)
    annotation (Placement(transformation(extent={{44,-66},{64,-46}})));
  Modelica.Blocks.Math.UnitConversions.To_kWh to_kWh7
    annotation (Placement(transformation(extent={{94,-61},{103,-52}})));
  Modelica.Blocks.Continuous.Integrator integrator8
    annotation (Placement(transformation(extent={{74,-61.5},{84,-52}})));
  Modelica.Blocks.Interfaces.RealOutput IncidentSolarRadiationHor "in kWh/m2"
    annotation (Placement(transformation(extent={{111,-66},{131,-46}})));
  Modelica.Blocks.Math.Gain gain(k=1/1000) "Converts to kW"
    annotation (Placement(transformation(extent={{99,28},{106,35}})));
  Modelica.Blocks.Sources.CombiTimeTable AirExchangeRate(
    columns={2},
    tableOnFile=false,
    table=AERProfile.Profile,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    annotation (Placement(transformation(extent={{-42,-31},{-29,-18}})));
  Modelica.Blocks.Sources.CombiTimeTable Source_TsetCool(
    columns={2},
    tableOnFile=false,
    table=SetTempProfile.Profile,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    annotation (Placement(transformation(extent={{-36,-71},{-23,-58}})));
  Modelica.Blocks.Sources.CombiTimeTable ReferenceCoolingLoad(tableOnFile=false,
      table=[650,-6545,-4816])
    "AnnualCoolingLoad according to ASHRAE140 at t=31536000s,  {2}=lowerLimit AnnualCoolingLoad, {3}=upperLimit AnnualCoolingLoad"
    annotation (Placement(transformation(extent={{32,133},{52,153}})));
  BaseClasses.checkResultsAccordingToASHRAE
    checkResultsAccordingToASHRAECooling(endTime=31536000)
    annotation (Placement(transformation(extent={{93,132},{113,152}})));
equation
    //Connections for input solar model
  for i in 1:5 loop
    connect(sun.OutDayAngleSun, radOnTiltedSurf_Perez[i].InDayAngleSun);
    connect(sun.OutHourAngleSun, radOnTiltedSurf_Perez[i].InHourAngleSun);
    connect(sun.OutDeclinationSun, radOnTiltedSurf_Perez[i].InDeclinationSun);
    connect(Solar_Radiation.y[1], radOnTiltedSurf_Perez[i].solarInput1);
    connect(Solar_Radiation.y[2], radOnTiltedSurf_Perez[i].solarInput2);
  end for;

  connect(Source_Weather.y[1], outsideTemp.T) annotation (Line(
      points={{-93,40},{-80,40},{-80,46.5},{-71.1,46.5}},
      color={0,0,127}));
  connect(radOnTiltedSurf_Perez.OutTotalRadTilted, Room.SolarRadiationPort)
    annotation (Line(
      points={{-75.4,75.6},{-46,75.6},{-46,69},{-26,69},{-26,68.8},{-6.1,68.8}},
      color={255,128,0}));

  connect(Source_Weather.y[2], Room.WindSpeedPort) annotation (Line(
      points={{-93,40},{-6.1,40},{-6.1,62.65}},
      color={0,0,127}));
  connect(Room.thermRoom,idealHeaterCooler.heatCoolRoom)  annotation (Line(
      points={{14.06,56.5},{14.06,-16},{10,-16},{10,-33},{3,-33}},
      color={191,0,0}));
  connect(Ground.port, Room.Therm_ground) annotation (Line(
      points={{-79,-22},{-48,-22},{-48,-10},{10.28,-10},{10.28,36.82}},
      color={191,0,0}));

  connect(InternalGains_convective.port, Room.thermRoom) annotation (Line(
      points={{-79,-44},{-48,-44},{-48,-10},{6,-10},{6,56.5},{14.06,56.5}},
      color={191,0,0}));
  connect(InternalGains_radiative.port, Room.starRoom) annotation (Line(
      points={{-79,-69},{-48,-69},{-48,-10},{20.36,-10},{20.36,56.5}},
      color={191,0,0}));
  connect(outsideTemp.port, Room.thermOutside) annotation (Line(points={{-59,46.5},
          {-46,46.5},{-46,76.59},{-4,76.59}}, color={191,0,0}));
  connect(integrator.u, CoolingPower.y)
    annotation (Line(points={{70.9,47},{65,47}}, color={0,0,127}));
  connect(integrator.y, to_kWh1.u) annotation (Line(points={{83.55,47},{82,47},
          {82,47.5},{88.9,47.5}},color={0,0,127}));
  connect(PowerLoad, PowerLoad)
    annotation (Line(points={{121,32},{121,32}}, color={0,0,127}));
  connect(Source_InternalGains.y, convectiveInternalGains.u) annotation (Line(
        points={{-132.35,-50.5},{-128,-50.5},{-128,-44},{-124,-44}}, color={0,0,
          127}));
  connect(convectiveInternalGains.y, InternalGains_convective.Q_flow)
    annotation (Line(points={{-112.5,-44},{-99,-44}}, color={0,0,127}));
  connect(Source_InternalGains.y, radiativeInternalGains.u) annotation (Line(
        points={{-132.35,-50.5},{-128,-50.5},{-128,-69},{-123,-69}}, color={0,0,
          127}));
  connect(radiativeInternalGains.y, InternalGains_radiative.Q_flow)
    annotation (Line(points={{-111.5,-69},{-99,-69}}, color={0,0,127}));
  connect(TransmittedRad.y, integrator2.u) annotation (Line(points={{66,-72},{
          68,-72},{68,-72.25},{74.1,-72.25}}, color={0,0,127}));
  connect(CoolingPower.y, multiSum.u[1]) annotation (Line(points={{65,47},{66,
          47},{66,32},{83,32}},       color={0,0,127}));
  connect(IncidentSolarRadiationE, IncidentSolarRadiationE)
    annotation (Line(points={{122,-2},{122,-2}}, color={0,0,127}));
  connect(to_kWh5.y, IncidentSolarRadiationN) annotation (Line(points={{100.45,
          14.5},{101.225,14.5},{101.225,15},{121,15}},
                                            color={0,0,127}));
  connect(to_kWh3.y, IncidentSolarRadiationW) annotation (Line(points={{102.45,
          -21.5},{102.725,-21.5},{102.725,-22},{121,-22}},
                                                    color={0,0,127}));
  connect(to_kWh6.y, IncidentSolarRadiationS) annotation (Line(points={{102.45,
          -40.5},{102.725,-40.5},{102.725,-41},{121,-41}},
                                                    color={0,0,127}));
  connect(SolarRadN.y, integrator5.u)
    annotation (Line(points={{65,14},{71.9,14}}, color={0,0,127}));
  connect(integrator5.y, to_kWh5.u) annotation (Line(points={{84.55,14},{89,14},
          {89,14.5},{90.1,14.5}}, color={0,0,127}));
  connect(SolarRadE.y, integrator4.u)
    annotation (Line(points={{65,-3},{71.9,-3}}, color={0,0,127}));
  connect(integrator4.y, to_kWh4.u) annotation (Line(points={{84.55,-3},{90,-3},
          {90,-2.5},{91.1,-2.5}}, color={0,0,127}));
  connect(SolarRadW.y, integrator3.u)
    annotation (Line(points={{65,-22},{72.9,-22}}, color={0,0,127}));
  connect(integrator3.y, to_kWh3.u) annotation (Line(points={{85.55,-22},{92.1,
          -22},{92.1,-21.5}}, color={0,0,127}));
  connect(SolarRadS.y, integrator6.u)
    annotation (Line(points={{65,-41},{72.9,-41}}, color={0,0,127}));
  connect(to_kWh2.y, gainIntHea.u) annotation (Line(points={{104.45,-71.5},{106,
          -71.5},{106,-90},{43,-90},{43,-86.5},{75.3,-86.5}}, color={0,0,127}));
  connect(to_kWh1.y, AnnualCoolingLoad) annotation (Line(points={{101.55,47.5},
          {121,47.5},{121,48}}, color={0,0,127}));
  connect(to_kWh4.y, IncidentSolarRadiationE) annotation (Line(points={{101.45,
          -2.5},{122,-2.5},{122,-2}}, color={0,0,127}));
  connect(integrator6.y, to_kWh6.u) annotation (Line(points={{85.55,-41},{92.1,
          -41},{92.1,-40.5}}, color={0,0,127}));
  connect(to_kWh7.y, IncidentSolarRadiationHor) annotation (Line(points={{
          103.45,-56.5},{102.725,-56.5},{102.725,-56},{121,-56}}, color={0,0,
          127}));
  connect(SolarRadCeiling.y, integrator8.u) annotation (Line(points={{65,-56},{
          68,-56},{68,-56.75},{73,-56.75}}, color={0,0,127}));
  connect(integrator8.y, to_kWh7.u) annotation (Line(points={{84.5,-56.75},{
          93.1,-56.75},{93.1,-56.5}}, color={0,0,127}));
  connect(integrator2.y, to_kWh2.u) annotation (Line(points={{84.45,-72.25},{
          94.1,-72.25},{94.1,-71.5}}, color={0,0,127}));
  connect(gainIntHea.y, TransmittedSolarRadiation_room) annotation (Line(points=
         {{83.35,-86.5},{121,-86.5},{121,-87}}, color={0,0,127}));
  connect(multiSum.y, gain.u) annotation (Line(points={{93.85,32},{97,32},{97,
          31.5},{98.3,31.5}}, color={0,0,127}));
  connect(gain.y, PowerLoad) annotation (Line(points={{106.35,31.5},{112.675,
          31.5},{112.675,32},{121,32}}, color={0,0,127}));
  connect(IncidentSolarRadiationHor, IncidentSolarRadiationHor) annotation (
      Line(points={{121,-56},{118.5,-56},{118.5,-56},{121,-56}}, color={0,0,127}));
  connect(Room.AirExchangePort, AirExchangeRate.y[1]) annotation (Line(points={{
          -6.1,70.7475},{-21,70.7475},{-21,-24.5},{-28.35,-24.5}}, color={0,0,127}));
  connect(idealHeaterCooler.setPointCool, Source_TsetCool.y[1]) annotation (
      Line(points={{-8.4,-36.2},{-8.4,-64.5},{-22.35,-64.5}}, color={0,0,127}));
  connect(ReferenceCoolingLoad.y[1], checkResultsAccordingToASHRAECooling.lowerLimit)
    annotation (Line(points={{53,143},{72.5,143},{72.5,149},{93,149}}, color={0,
          0,127}));
  connect(ReferenceCoolingLoad.y[2], checkResultsAccordingToASHRAECooling.upperLimit)
    annotation (Line(points={{53,143},{73,143},{73,147},{93,147}}, color={0,0,
          127}));
  connect(AnnualCoolingLoad, checkResultsAccordingToASHRAECooling.modelResults)
    annotation (Line(points={{121,48},{124,48},{124,117},{83,117},{83,135.6},{
          93,135.6}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(
        extent={{-150,-100},{120,90}},
        preserveAspectRatio=false,
        grid={1,1}), graphics={
        Text(
          extent={{-56,-2},{12,-10}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="Building physics"),
        Rectangle(
          extent={{-47,90},{41,-11}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-150,-11},{-48,-99}},
          lineColor={0,0,127},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{41,90},{120,-99}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-150,90},{-47,-11}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),Text(
          extent={{-146,17},{-118,1}},
          lineColor={0,0,255},
          textString="1 - Direct normal
     irradiance [W/m2]
2 - global horizontal 
     radiance in [W/m2]
"),     Text(
          extent={{-147,-2},{-79,-10}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="Weather boundary conditions"),
                                         Text(
          extent={{-148,48},{-116,30}},
          lineColor={0,0,255},
          textString="1 - Air Temp [K]
2 - Wind Speed [m/s]
3- Dew Point Temp [K]
4- Cloud Cover"),
        Text(
          extent={{26,-91},{87,-99}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="Outputs"),
        Rectangle(
          extent={{-48,-11},{41,-99}},
          lineColor={0,0,127},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-55,-90},{6,-98}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="HVAC system"),
        Text(
          extent={{-157,-90},{-100,-97}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="Internal gains"),
        Text(
          extent={{-53,-1},{15,-9}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="Building physics")}),
                  Icon(coordinateSystem(
        extent={{-150,-100},{120,90}},
        preserveAspectRatio=false,
        grid={1,1})),
    experiment(StopTime=3.1536e+007, Interval=3600),
    __Dymola_experimentSetupOutput(events=false),
    Documentation(revisions="<html>
 <ul>
<li>
  July 1, 2020, by Konstantina Xanthopoulou:<br/>
  updated
  </li>
 <li><i>March 9, 2015</i> by Ana Constantin:<br/>Implemented</li>
 </ul>
 </html>",
         info="<html>
<p>As described in ASHRAE Standard 140.</p>
<p>Difference to case 600:</p>
<ul>
<li>From 1800 hours to 0700 hours, vent fan = ON</li>
<li>From 0700 hours to 1800 hours, vent fan = OFF</li>
<li>Heating = always OFF</li>
<li>From 1800 hours to 0700 hours, cool = OFF</li>
<li>From 0700 hours to 1800 hours, cool = ON if temperature &gt; 27 degC; otherwise, cool = OFF</li>
</ul>
</html>"));
end Case650;
