with AUnit;
with AUnit.Test_Cases;
with Ada.Strings.Unbounded;

package Test.Skein is
	use AUnit;
	use Ada.Strings.Unbounded;

	type Skein_Test is new Test_Cases.Test_Case with null record;

	procedure Register_Tests(T: in out Skein_Test);

	function Name(T: Skein_Test) return Test_String;

	procedure Skein_Test1(T: in out Test_Cases.Test_Case'Class);


end Test.Skein;