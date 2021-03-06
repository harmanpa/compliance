within ModelicaCompliance.Equations.Reinit;

model ReinitInvalidType1
  extends Icons.TestCase;

  Boolean b(start = false);
equation
  when b then
    reinit(b, true);
  end when;

  annotation (
    __ModelicaAssociation(TestCase(shouldPass = false, section = {"8.3.6"})),
    experiment(StopTime = 0.01),
    Documentation(
    info = "<html>Tests the first argument to reinit in the body of when equation must be a subtype of Real, but b has type Boolean.</html>"));
end ReinitInvalidType1;
