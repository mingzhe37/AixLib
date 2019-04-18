within AixLib.PlugNHarvest.Components.EnergySystem.IdealHeaterCooler.BaseClasses;
partial model PartialHeaterCoolerPI
  extends AixLib.Utilities.Sources.HeaterCooler.PartialHeaterCooler;
  parameter Real h_heater = 0 "Upper limit controller output of the heater" annotation(Dialog(tab = "Heater", group = "Controller",enable=not recOrSep));
  parameter Real l_heater = 0 "Lower limit controller output of the heater" annotation(Dialog(tab = "Heater", group = "Controller",enable=not recOrSep));
  parameter Real KR_heater = 1000 "Gain of the heating controller" annotation(Dialog(tab = "Heater", group = "Controller",enable=not recOrSep));
  parameter Modelica.SIunits.Time TN_heater = 1
    "Time constant of the heating controller" annotation(Dialog(tab = "Heater", group = "Controller",enable=not recOrSep));
  parameter Real h_cooler = 0 "Upper limit controller output of the cooler"
                                                                           annotation(Dialog(tab = "Cooler", group = "Controller",enable=not recOrSep));
  parameter Real l_cooler = 0 "Lower limit controller output of the cooler"          annotation(Dialog(tab = "Cooler", group = "Controller",enable=not recOrSep));
  parameter Real KR_cooler = 1000 "Gain of the cooling controller"
                                                                  annotation(Dialog(tab = "Cooler", group = "Controller",enable=not recOrSep));
  parameter Modelica.SIunits.Time TN_cooler = 1
    "Time constant of the cooling controller" annotation(Dialog(tab = "Cooler", group = "Controller",enable=not recOrSep));
  parameter Boolean useRecord = true "Use record or individual parameters";
  parameter A4_30.DataBase.ThermalZones.ZoneBaseRecord zoneParam
    "Zone definition"
    annotation (choicesAllMatching=true, Dialog(enable=recOrSep));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Cooling annotation(Placement(transformation(extent={{26,-23},
            {6,-2}})));
  AixLib.Controls.Continuous.PITemp pITempCool(
    rangeSwitch=false,
    h=if useRecord then zoneParam.hCool else h_cooler,
    l=if useRecord then zoneParam.lCool else l_cooler,
    KR=if useRecord then zoneParam.KRCool else KR_cooler,
    TN=if useRecord then zoneParam.TNCool else TN_cooler)
    "PI control for cooler"
    annotation (Placement(transformation(extent={{-20,-10},{0,-30}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Heating annotation(Placement(transformation(extent={{26,22},
            {6,2}})));
  AixLib.Controls.Continuous.PITemp pITempHeat(
    rangeSwitch=false,
    h=if useRecord then zoneParam.hHeat else h_heater,
    l=if useRecord then zoneParam.lHeat else l_heater,
    KR=if useRecord then zoneParam.KRHeat else KR_heater,
    TN=if useRecord then zoneParam.TNHeat else TN_heater)
    "PI control for heater"
    annotation (Placement(transformation(extent={{-20,10},{0,30}})));
  Modelica.Blocks.Interfaces.RealOutput heatingPower(
   final quantity="HeatFlowRate",
   final unit="W") "Power for heating"
    annotation (Placement(transformation(extent={{80,20},{120,60}}),
        iconTransformation(extent={{80,20},{100,40}})));
  Modelica.Blocks.Interfaces.RealOutput coolingPower(
   final quantity="HeatFlowRate",
   final unit="W") "Power for cooling"
    annotation (Placement(transformation(extent={{80,-26},{120,14}}),
        iconTransformation(extent={{80,-2},{100,18}})));
equation
  connect(Heating.port, heatCoolRoom) annotation (Line(
        points={{6,12},{2,12},{2,-40},{90,-40}},
        color={191,0,0},
        smooth=Smooth.None));
  connect(pITempHeat.heatPort, heatCoolRoom) annotation (Line(
      points={{-16,11},{-16,-40},{90,-40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(pITempCool.y, Cooling.Q_flow) annotation (Line(
        points={{-1,-20},{26,-20},{26,-12.5}},
        color={0,0,127},
        smooth=Smooth.None));
  connect(Cooling.port, heatCoolRoom) annotation (Line(
        points={{6,-12.5},{2.4,-12.5},{2.4,-40},{90,-40}},
        color={191,0,0},
        smooth=Smooth.None));
  connect(pITempCool.heatPort, heatCoolRoom) annotation (Line(
      points={{-16,-11},{-16,-40},{90,-40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Heating.Q_flow, pITempHeat.y) annotation (Line(points={{26,12},{26,20},{-1,20}}, color={0,0,127}));
  connect(Heating.Q_flow,heatingPower)
    annotation (Line(points={{26,12},{26,40},{100,40}}, color={0,0,127}));
  connect(Cooling.Q_flow,coolingPower)  annotation (Line(points={{26,-12.5},{56,
          -12.5},{56,-6},{100,-6}}, color={0,0,127}));
  annotation (Documentation(info = "<html>
 <h4><span style=\"color:#008000\">Overview</span></h4>
 <p>This is the base class of an ideal heater and/or cooler. It is used in full ideal heater/cooler models as an extension. It extends another base class and adds some basic elements.</p>
 </html>", revisions="<html>
 <ul>
 <li><i>October, 2015&nbsp;</i> by Moritz Lauster:<br/>Adapted to Annex60 and restructuring, implementing new functionalities</li>
 </ul>
 <ul>
 <li><i>June, 2014&nbsp;</i> by Moritz Lauster:<br/>Added some basic documentation</li>
 </ul>
 </html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end PartialHeaterCoolerPI;
