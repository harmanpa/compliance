within ModelicaCompliance.Inheritance.Restrictions;

model BaseClassKindBlockModel
  extends Icons.TestCase;

  model Base
    Real y = 6.0;
  end Base;

  block Derived
    extends Base;
  end Derived;

  Derived d;
equation
  annotation (
    __ModelicaAssociation(TestCase(shouldPass = false, section = {"7.1.3"})),
    experiment(StopTime = 0.01),
    Documentation(
    info = "<html>Checks that a class with specialization block is not allowed to derive from model.</html>"));
end BaseClassKindBlockModel;
