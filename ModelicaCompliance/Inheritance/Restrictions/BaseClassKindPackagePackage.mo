within ModelicaCompliance.Inheritance.Restrictions;

model BaseClassKindPackagePackage
  extends Icons.TestCase;

  package Base
    constant Real x = 2.0;
  end Base;

  package Derived
    extends Base;
  end Derived;

  Real x = Derived.x;
equation
  annotation (
    __ModelicaAssociation(TestCase(shouldPass = true, section = {"7.1.3"})),
    experiment(StopTime = 0.01),
    Documentation(
    info = "<html>Checks that a class with specialization package is allowed to derive from another package.</html>"));
end BaseClassKindPackagePackage;
