within ModelicaCompliance.Connections.Declarations;

model ConnectParamSubscript
  extends Icons.TestCase;

  connector C
    Real e;
    flow Real f;
  end C;

  model M
    C c[2];
  equation
    c[1].e = 1.0;
    c[1].f = 2.0;
  end M;

  parameter Integer n = 2;
  M m;
equation 
  connect(m.c[1], m.c[n]);

  annotation (
    __ModelicaAssociation(TestCase(shouldPass = true, section = {"9.1"})),
    experiment(StopTime = 0.01),
    Documentation(
      info = "<html>Tests that connector references in connect may have
        parameter expressions as subscript.</html>"));
end ConnectParamSubscript;
