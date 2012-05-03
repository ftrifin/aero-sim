%% global_init %%
%%%%%%%%%%%%%%%%%

if PlanetId == 1 % Earth
    Global.Planet.EquatorialRadius = 6378137.0;
    Global.Planet.Oblateness = 1/298.257223563;
    Global.Planet.PolarRadius = Global.Planet.EquatorialRadius*(1-Global.Planet.EquatorialRadius);
    Global.Planet.Mu = 3986004.418e8;
    Global.Planet.RotationalRate = 7292115.0e-11;
end