within AixLib.DataBase.Media.Refrigerants.R134a;
record BDSP_IIR_P1_395_T233_370
  "Record with fitting coefficients calculated for first implementation"
  extends AixLib.DataBase.Media.Refrigerants.BubbleDewStatePropertiesBaseDataDefinition(
    name="Coefficients taken from Engelpracht",
    psat_Nt=5,
    psat_N={-5.29535582243675, -5.15024230998653,
            -3.13553371894143, 3.81009392578704,
            -10.0339381768489},
    psat_E={0.927890501793078, 0.927889861253321,
            3.24457658937591, 0.866053953377016,
            7.91909121618172},
    Tsat_Nt=46,
    Tsat_N={1.54078824620738e-07, -2.51410678214919e-06,
            1.45676923487723e-05, -2.34880154091625e-05,
            -8.8004505404823e-05, 0.000263544471499524,
            0.000812655495029447, -0.00387216171551954,
            0.00144605394607974, 0.0132879323848205,
            -0.0224369802824247, 0.0285800338394785,
            -0.0221624492210123, -0.203868199876426,
            0.350873407219832, -0.56578842983819,
            12.0552196723002, -67.2418238751773,
            192.835068220202, -292.332077985936,
            -66.889680648556, 1354.35656921788,
            -2373.87104764859, -153.61878036749,
            5736.13316518914, -5643.63993911996,
            -4453.93622361223, 10945.3908704179,
            -1564.02920810349, -9868.33934727912,
            5640.99015202781, 4762.95378316372,
            -4812.32805012381, -1053.97842181797,
            2199.05007804956, -55.2137430573454,
            -591.55848346164, 83.7642169620632,
            95.5617640252349, -20.8432510011223,
            -4.89010119898524, -2.89915392364256,
            7.26052113404336, -12.7560329244594,
            36.1617450994282, 318.322815465239},
    Tsat_IO={1173800.40711465,
             1099321.32004152, 0, 1},
    dl_Nt=51,
    dl_N={-0.00352419814120293, -0.0051580379775832,
          0.0965814503072823, 0.144857990589315,
          -1.16726237424692, -1.82395288996062,
          7.97544046479868, 13.4009909278429,
          -31.7450644002113, -61.8153512769025,
          56.8020521069703, 171.535249548539,
          100.352770722198, -181.683550900637,
          -859.48468801174, -610.226996198121,
          1761.84707403932, 3146.45218750924,
          2353.3594353821, -5996.13044335048,
          -25581.0559142409, 1308.41019778136,
          85905.3178848696, 23570.9797554869,
          -184363.294029955, -72757.9476832706,
          285747.546166906, 127830.260345799,
          -333529.603869706, -155973.130039214,
          297641.54611928, 139542.906755691,
          -203413.444060992, -92974.0053711724,
          105653.494874395, 46017.3538315087,
          -41045.0235439939, -16664.3675714077,
          11627.7646496055, 4294.75635803336,
          -2313.40684857554, -754.303131177625,
          305.562374521598, 84.2002201352372,
          -25.0453395096642, -6.45648421752394,
          -1.69200599769564, -7.63593969610268,
          -23.3610969355503, -159.727367002064,
          1196.56605282943},
    dl_IO={303.15, 40.457817538765,
           0, 1},
    dv_Nt=51,
    dv_N={0.00366375716685372, 0.0053538769982365,
          -0.100436390057465, -0.150363600886821,
          1.21437618965309, 1.8933138763485,
          -8.30322148217756, -13.9104041772412,
          33.0986104378207, 64.1589511321415,
          -59.5651148209404, -177.972153492235,
          -102.486577824078, 187.987443782542,
          889.436057503728, 636.298667648207,
          -1828.93235899714, -3275.90468897169,
          -2428.03282530501, 6249.17042512684,
          26505.848889568, -1406.59981060971,
          -89079.8043571255, -24396.147383262,
          191251.949508916, 75446.4637710722,
          -296500.979192201, -132629.575901049,
          346146.181681826, 161873.719238785,
          -308945.463671975, -144845.545577487,
          211163.498509716, 96517.4282752838,
          -109689.578460464, -47774.8025384588,
          42616.5117812756, 17301.75826985,
          -12073.8168754595, -4459.21050037244,
          2402.29470924636, 783.202988492362,
          -317.322783612849, -87.4191158401829,
          26.0367018503651, 6.71078750827968,
          1.54774937069529, 7.45650506262154,
          22.8841379731046, 44.9601731987046,
          37.7920259477397},
    dv_IO={303.15, 40.457817538765,
           0, 1},
    hl_Nt=46,
    hl_N={0.000184961183468728, -0.0030179158953129,
          0.0174899646269803, -0.0282560159402985,
          -0.105207275191974, 0.315194701935429,
          0.974770473817121, -4.63930659057721,
          1.7383261464603, 15.8672736904888,
          -26.8117923739426, 34.4573923119077,
          -27.0840074954698, -243.891647476847,
          418.633103433743, -675.810930446719,
          14451.1767301123, -80546.6165653585,
          230931.822047154, -350354.845541073,
          -79149.6184000711, 1621602.99991981,
          -2846012.05183644, -179385.075668919,
          6871922.20419042, -6768870.58089433,
          -5330455.34053076, 13118286.5709535,
          -1881959.25885099, -11823004.0525545,
          6763949.30238296, 5704097.14300617,
          -5767487.65638426, -1261137.45165689,
          2634880.09022467, -66756.3566692043,
          -708605.95775703, 100403.959019043,
          114542.458212433, -25097.6059600101,
          -5668.24234828214, -3713.55063995873,
          9323.02142560806, -15530.9613962048,
          55045.0924054574, 264165.769863097},
    hl_IO={1173800.40711509, 1099321.32004199,
           0, 1},
    hv_Nt=20,
    hv_N={0.000146114755723916, -0.0019919160005003,
          0.0109988406358016, -0.0311947330620793,
          0.0499552429639684, -0.0665601068588061,
          0.147469798302808, -0.277432585048023,
          0.191088567972776, 0.165337515949091,
          -0.308799991735697, 0.0767890190523656,
          0.096151215082195, -0.130568776308635,
          0.206740480104201, -0.245243281452568,
          0.246372277496221, -0.550946254566628,
          0.847986730088046, 0.716885920461567},
    hv_IO={1173800.40711465, 1099321.32004152,
           409576.287023374, 16957.9188539679},
    sl_Nt=46,
    sl_N={9.28755787765749e-07, -1.5150913803503e-05,
          8.77316967122217e-05, -0.000140844251958289,
          -0.000533996613727705, 0.00159622206078928,
          0.00490073872961946, -0.023370265008107,
          0.00863828261595032, 0.0805687876822656,
          -0.135254807011812, 0.168969874580144,
          -0.128293354719008, -1.22607691354417,
          2.10119705402605, -3.38412616555908,
          72.6461571722029, -405.466030416176,
          1161.67231329233, -1754.92919607002,
          -420.688351064553, 8167.35604991928,
          -14253.0603537498, -1011.92405629391,
          34546.516132289, -33831.6703317772,
          -26951.4046285962, 65805.1780388705,
          -9213.65456150566, -59432.1771053041,
          33811.7330015974, 28745.7895776656,
          -28912.1120633901, -6394.80667362487,
          13226.7122676853, -313.368646868979,
          -3562.0724687124, 501.449619305607,
          574.322894904955, -123.098484249474,
          -32.2623996097734, -13.0844367240743,
          36.7035466683415, -58.7522396485261,
          169.757060451784, 1214.3997345905},
    sl_IO={1173800.40711509, 1099321.32004199,
           0, 1},
    sv_Nt=46,
    sv_N={-4.54727474435905e-07, 7.41017757537388e-06,
          -4.27648894607494e-05, 6.70715032108244e-05,
          0.000270926474744898, -0.000802286705973783,
          -0.00241040447476498, 0.0115494481330778,
          -0.00405980844377531, -0.0407765869650566,
          0.0666478893759725, -0.0749446096999996,
          0.049805775690857, 0.596694219851247,
          -1.00920319342854, 1.6208955320976,
          -35.6318873943596, 199.561613366245,
          -569.493750614901, 846.143321140556,
          247.736627905861, -4022.96989824516,
          6873.61207413149, 697.553504737119,
          -16906.205356694, 16191.4119093199,
          13480.1370544075, -31938.750447298,
          4039.97184361304, 29080.9454888102,
          -16180.5286901209, -14203.8869477235,
          13990.5043701977, 3235.84611771843,
          -6435.0171344795, 110.433794468402,
          1741.94692574345, -238.319982484079,
          -278.8342183201, 55.3988893994062,
          21.1056166847968, -1.4710810714657,
          -5.50913731662347, 0.564362494967034,
          -13.7886033447905, 1709.22837116714},
    sv_IO={1173800.40711465, 1099321.32004152,
           0, 1});

  annotation (Documentation(revisions="<html><ul>
  <li>June 14, 2017, by Mirko Engelpracht, Christian Vering:<br/>
    First implementation (see <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/408\">issue 408</a>).
  </li>
</ul>
</html>", info="<html>
<p>
  In this record, fitting coefficients are provided for thermodynamic
  properties at bubble and dew line. For detailed information of these
  thermodynamic properties as well as the fitting coefficients in
  general, please checkout <a href=
  \"modelica://AixLib.DataBase.Media.Refrigerants.BubbleDewStatePropertiesBaseDataDefinition\">
  AixLib.DataBase.Media.Refrigerants.BubbleDewStatePropertiesBaseDataDefinition</a>
  . The fitting coefficients are used in a hybrid refrigerant model
  provided in <a href=
  \"modelica://AixLib.Media.Refrigerants\">AixLib.Media.Refrigerants</a>.
  For detailed information, please checkout <a href=
  \"modelica://AixLib.Media.Refrigerants.Interfaces.TemplateHybridTwoPhaseMediumRecord\">
  AixLib.Media.Refrigerants.Interfaces.TemplateHybridTwoPhaseMediumRecord</a>.
</p>
<h4>
  Assumptions and limitations
</h4>
<p>
  The provided coefficients are fitted to external data by Engelpracht
  and are valid within the following range<br/>
</p>
<table>
  <caption>
    \"Range of validiry\" cellspacing=\"0\" cellpadding=\"2\" border=\"1\"
    width=\"30%\" style=\"border-collapse:collapse;\"&gt;
    <table>
      <tr>
        <td>
          <p>
            Parameter
          </p>
        </td>
        <td>
          <p>
            Minimum Value
          </p>
        </td>
        <td>
          <p>
            Maximum Value
          </p>
        </td>
      </tr>
      <tr>
        <td>
          <p>
            Pressure (p) in bar
          </p>
        </td>
        <td>
          <p>
            1
          </p>
        </td>
        <td>
          <p>
            39.5
          </p>
        </td>
      </tr>
      <tr>
        <td>
          <p>
            Temperature (T) in K
          </p>
        </td>
        <td>
          <p>
            233.15
          </p>
        </td>
        <td>
          <p>
            370.15
          </p>
        </td>
      </tr>
    </table>
    <p>
      The reference point is defined as 200 kJ/kg and 1 kJ/kg/K,
      respectively, for enthalpy and entropy for the saturated liquid
      at 273.15 K.
    </p>
    <h4>
      References
    </h4>
    <p>
      Engelpracht, Mirko (2017): Development of modular and scalable
      simulation models for heat pumps and chillers considering various
      refrigerants. <i>Master Thesis</i>
    </p>
  </caption>
</table>
</html>"));
end BDSP_IIR_P1_395_T233_370;
