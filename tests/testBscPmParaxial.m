function tests = bscpmparaxial
  tests = functiontests(localfunctions);
end

function setupOnce(testCase)
  addpath('../');
end

function testConstruct(testCase)


  [xx,yy] = meshgrid(linspace(-1, 1, 512), linspace(-1, 1, 512));
  incident_mode = ott.utils.lgmode(0,0, ...
    sqrt(xx.^2+yy.^2), atan2(yy,xx));

  beam = ott.BscPmParaxial(1.0, incident_mode);

end

function testCoefficients(testCase)

  import matlab.unittest.constraints.IsEqualTo;
  import matlab.unittest.constraints.AbsoluteTolerance;
  tol = 1.0e-8;

  [xx,yy] = meshgrid(linspace(-1, 1, 512), linspace(-1, 1, 512));
  incident_mode = ott.utils.lgmode(0,0, ...
    sqrt(xx.^2+yy.^2), atan2(yy,xx));

  % Create the first beam
  beam1 = ott.BscPmParaxial(1.0, incident_mode, ...
    'keep_coefficient_matrix', true, ...
    'invert_coefficient_matrix', false);

  % Create the second beam (reuse data)
  beam2 = ott.BscPmParaxial(1.0, incident_mode, 'beamData', beam1);

  % Create the second beam (reuse pass coefficient matrix)
  beam3 = ott.BscPmParaxial(1.0, incident_mode, ...
    'beamData', beam1.inv_coefficient_matrix);

  testCase.verifyThat(beam2.getCoefficients(), ...
      IsEqualTo(beam1.getCoefficients(), ...
      'Within', AbsoluteTolerance(tol)), ...
      'beam2 does not match original beam');

  testCase.verifyThat(beam3.getCoefficients(), ...
      IsEqualTo(beam1.getCoefficients(), ...
      'Within', AbsoluteTolerance(tol)), ...
      'beam2 does not match original beam');

end
