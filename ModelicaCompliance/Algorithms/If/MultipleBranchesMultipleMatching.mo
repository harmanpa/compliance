within ModelicaCompliance.Algorithms.If;

model MultipleBranchesMultipleMatching
  extends Icons.TestCase;

  Real x = 2.0;
  parameter Integer i = 4;
algorithm
  if i == 4 then
    x := 3.0;
  elseif i < 5 then
    x := 4.0;
  elseif i <> 5 then
    x := 5.0;
  end if;

  assert(abs(x - 2.0) < 1e-10, "x was not set correctly.");

  annotation (
    __ModelicaAssociation(TestCase(shouldPass = true)),
    experiment(StopTime = 0.01),
    Documentation(
      info = "<html>Tests an if-statement with multiple branches, where multiple
        conditions evaluate to true but only the first branch should be selected.</html>"));
end MultipleBranchesMultipleMatching;
