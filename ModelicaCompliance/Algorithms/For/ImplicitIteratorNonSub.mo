within ModelicaCompliance.Algorithms.For;

model ImplicitIteratorNonSub
  extends Icons.TestCase;

  Real x[1];
algorithm
  for i loop
    x[1] := i;
  end for;

  annotation (
    __ModelicaAssociation(TestCase(shouldPass = false, section = {"11.2.2.1"})),
    experiment(StopTime = 0.01),
    Documentation(
    info = "<html>Checks that an iterator in an implicit range must appear as a
      subscript in at least one expression.</html>"));
end ImplicitIteratorNonSub;
