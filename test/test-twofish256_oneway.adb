with AUnit.Assertions;
with Crypto.Symmetric.Oneway_Blockcipher_Twofish256;
with Crypto.Types;

package body Test.Twofish256_Oneway is
   use Crypto.Types;

   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   ---------------------------- Type - Declaration -----------------------------
   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------

   Plaintext: B_Block128 := (others => 0);
   Key: Bytes(B_Block256'Range) := (others => 0);
   Ciphertext: B_Block128 := (16#37#, 16#FE#, 16#26#, 16#FF#, 16#1C#,
                              16#F6#, 16#61#, 16#75#, 16#F5#, 16#DD#,
                              16#F4#, 16#C3#, 16#3B#, 16#97#, 16#A2#,
                              16#05#);
   PT: B_Block128 := Plaintext;
   CT: B_Block128;

   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   ------------------------- Register Twofish256 Test 1 ------------------------
   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------

   procedure Register_Tests(T : in out Twofish_Test) is
      use Test_Cases.Registration;
   begin
      Register_Routine(T, Twofish256_Oneway_Test1'Access,"Twofish256 Known Answer Test");
   end Register_Tests;

   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   ------------------------- Name Twofish256 Test ------------------------------
   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------

   function Name(T : Twofish_Test) return Test_String is
   begin
      return new String'("Twofish256 Test");
   end Name;

   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   -------------------------------- Start Tests --------------------------------
   -----------------------------------------------------------------------------
   ---------------------------------- Test 1 -----------------------------------
   -----------------------------------------------------------------------------

   procedure Twofish256_Oneway_Test1(T : in out Test_Cases.Test_Case'Class) is
      use AUnit.Assertions;
      use Crypto.Symmetric.Oneway_Blockcipher_Twofish256;
   begin
      for I in 1 .. 49 loop
	 Prepare_Key(B_Block256(Key));
	 Encrypt(PT, CT);
	 Key(16 .. 31) := Key(0 .. 15);
	 Key(0 .. 15) := Bytes(PT);
	 PT := CT;
      end loop;

      for I in CT'Range loop
	 Assert(CT(I) = Ciphertext(I), "Twofish256 Known Answer Test failed.");
      end loop;
   end Twofish256_Oneway_Test1;


   -----------------------------------------------------------------------------

end Test.Twofish256_Oneway;