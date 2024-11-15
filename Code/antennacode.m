
%% Antenna Properties
F0 = 2.4e9;
antennaObject = design(invertedFcoplanar, F0);
figure;
show(antennaObject)

%% Antenna Analysis

freqRange = linspace(2.2e9,2.6e9,21);
figure;
impedance(antennaObject,freqRange);
% sparameter
figure;
s= sparameters(antennaObject,freqRange,refImpedance);
rfplot(s)
% pattern
figure;
pattern(antennaObject, F0)


%% 
pcbAnt = pcbStack(antennaObject);
pcbAnt.BoardThickness = 1e-3;
d1 = dielectric('FR4');
d1.EpsilonR = 4.5;
d1.Thickness = 1e-3;
c1 = metal('Copper');
pcbAnt.Conductor = c1;
c1.Thickness = 35e-6;
pcbAnt.Layers{2} = d1;

pcbAnt.BoardShape = antenna.Rectangle('Length',antennaObject.GroundPlaneLength,'Width',antennaObject.GroundPlaneWidth+2*antennaObject.Height, 'Center',[0 antennaObject.Height]);
show(pcbAnt)
%%
freqRange = linspace(1.2e9,2.6e9,11);
figure;
impedance(pcbAnt, freqRange)

%%
antennaObject.RadiatorArmWidth = 0.0013879;
antennaObject.FeederArmWidth = 0.0013879;
