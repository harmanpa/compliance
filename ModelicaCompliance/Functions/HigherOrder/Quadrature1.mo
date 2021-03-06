within ModelicaCompliance.Functions.HigherOrder;

model Quadrature1
  extends Icons.TestCase;

  function quadrature "Integrate function y = integrand(x) from x1 to x2"
    input Real x1;
    input Real x2;
    input Integrand integrand; // Integrand is a partial function, see below
    output Real integral;
    algorithm
      integral := (x2 - x1) * (integrand(x1) + integrand(x2)) / 2;
    end quadrature;
  
  partial function Integrand
   input Real x;
   output Real y;
  end Integrand;
  
  function IdentityFunction
    input Real x;
    output Real y;
  algorithm
    y := x;
  end IdentityFunction;
  
  function Parabola
    extends Integrand;
  algorithm
    y := x * x;
  end Parabola;
  
  Integer area = integer(quadrature(1, 2.5, Parabola));
  Integer i = integer(quadrature(10, 20, IdentityFunction));

equation
  assert(area == 5, "are was not set via the function call correctly!");
  assert(i == 150, "i was not set via the function call correctly!");
  annotation (
    __ModelicaAssociation(TestCase(shouldPass = true, section = {"12.4.2"})),
    experiment(StopTime = 0.01),
    Documentation(info = "<html>Checks that function arguments to functions are working.</html>"));
end Quadrature1;
