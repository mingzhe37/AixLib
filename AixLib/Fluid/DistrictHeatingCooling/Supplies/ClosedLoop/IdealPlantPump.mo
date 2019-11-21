within AixLib.Fluid.DistrictHeatingCooling.Supplies.ClosedLoop;
model IdealPlantPump
  "Supply node model with ideal heater and cooler for heat and cold supply of bidirectional networks"

      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium model for water"
      annotation (choicesAllMatching = true);

      parameter Modelica.SIunits.Pressure dp_nominal(displayUnit="Pa")=30000
      "Nominal pressure drop";
      parameter Modelica.SIunits.MassFlowRate m_flow_nominal "Nominal mass flow rate";

  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
        Medium)
    "Fluid connector for connecting the ideal plant to the cold line of the network"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
        Medium)
    "Fluid connector for connecting the ideal plant to the warm line of the network"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  AixLib.Fluid.HeatExchangers.PrescribedOutlet heater(redeclare package Medium =
        Medium, use_X_wSet=false,
    dp_nominal=dp_nominal,
    m_flow_nominal=m_flow_nominal,
    use_TSet=true)
    annotation (Placement(transformation(extent={{14,-10},{34,10}})));
  AixLib.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
        Medium, m_flow_nominal=2)
    annotation (Placement(transformation(extent={{66,-10},{86,10}})));
  Modelica.Blocks.Interfaces.RealInput T_Set(unit="K")
    "Minimum supply temperature of the hot line of the bidirectional low-temperature network"
    annotation (Placement(transformation(extent={{-126,22},{-86,62}})));
  Sources.Boundary_pT bou(redeclare package Medium = Medium, nPorts=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-54,-42})));
  Sensors.TemperatureTwoPort senTemReturn(redeclare package Medium = Medium,
      m_flow_nominal=2)
    annotation (Placement(transformation(extent={{-86,-10},{-66,10}})));
  Movers.FlowControlled_dp fan(redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
      addPowerToMedium=false,
    dp_nominal=dp_nominal)
    annotation (Placement(transformation(extent={{-40,10},{-20,-10}})));
  Modelica.Blocks.Interfaces.RealInput dpIn(unit="Pa")
    "Input of pressure head for the pump"
    annotation (Placement(transformation(extent={{-126,-100},{-86,-60}})));
equation
  connect(T_Set, heater.TSet)
    annotation (Line(points={{-106,42},{12,42},{12,8}}, color={0,0,127}));
  connect(port_a, senTemReturn.port_a)
    annotation (Line(points={{-100,0},{-86,0}}, color={0,127,255}));
  connect(port_b, senTem.port_b)
    annotation (Line(points={{100,0},{86,0}}, color={0,127,255}));
  connect(dpIn, fan.dp_in)
    annotation (Line(points={{-106,-80},{-30,-80},{-30,-12}},
                                                          color={0,0,127}));
  connect(heater.port_b, senTem.port_a)
    annotation (Line(points={{34,0},{66,0}}, color={0,127,255}));
  connect(fan.port_b, heater.port_a)
    annotation (Line(points={{-20,0},{14,0}}, color={0,127,255}));
  connect(senTemReturn.port_b, fan.port_a)
    annotation (Line(points={{-66,0},{-40,0}}, color={0,127,255}));
  connect(bou.ports[1], fan.port_a) annotation (Line(points={{-54,-32},{-56,-32},
          {-56,0},{-40,0}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-80,80},{80,0}},
          lineColor={28,108,200},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-80,-80},{80,0}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.None)}),                       Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(revisions="<html>
<ul>
<li><i>August 09, 2018</i> ,by Tobias Blacha:<br/>
Implemented </li>
</ul>
</html>", info="<html>
This model represents the supply node of a bidirectional network with indeal heater and ideal cooler. The operation mode of the depends on the flow direction.
In the case that port_b is the outlet, heating operation takes place. In the case that port_a is the outlet, cooling operation takes place.
</html>"));
end IdealPlantPump;
