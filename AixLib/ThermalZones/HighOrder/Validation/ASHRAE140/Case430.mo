within AixLib.ThermalZones.HighOrder.Validation.ASHRAE140;
model Case430
  extends AixLib.ThermalZones.HighOrder.Validation.ASHRAE140.Case420(
                  Room(
      redeclare DataBase.WindowsDoors.Simple.WindowSimple_ASHRAE140 Type_Win(
          Emissivity=0.9),
      solar_absorptance_OW=0.6,
      outerWall_South(solar_absorptance=0.6),
      ceiling(solar_absorptance=0.6),
      outerWall_West(solar_absorptance=0.6),
      outerWall_North(solar_absorptance=0.6),
      outerWall_East(solar_absorptance=0.6)),
    ReferenceCoolingLoad(table=[430,-875,-422]),
    ReferenceHeatingLoad(table=[430,5429,7827]));
  annotation (Documentation(revisions="<html>
 <ul>
 <li><i>July 1, 2020</i> by Konstantina Xanthopoulou:<br/>Implemented</li>
 </ul>
 </html>", info="<html>
<p>As described in ASHRAE Standard 140.</p>
<p>Difference to case 420: </p>
<ul>
<li> Solar absorptance on exterior surface = 0.6</li>
</ul>
</ul>
</ul>
</html>
"));
end Case430;
