within ModelicaCompliance.Inheritance.Restrictions;

model BaseClassKindConnectorFunction
  extends Icons.TestCase;

  function Base
    input Real x = 1.0;
    output Real y = 2.0;
  algorithm
  end Base;

  connector Derived
    extends Base;
  end Derived;

  Derived d;
equation
  annotation (
    __ModelicaAssociation(TestCase(shouldPass = false, section = {"7.1.3"})),
    experiment(StopTime = 0.01),
    Documentation(
    info = "<html>Checks that a class with specialization connector is not allowed to derive from function.</html>"));
end BaseClassKindConnectorFunction;
