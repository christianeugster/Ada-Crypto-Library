with Crypto.Types.Random_Source.Provider;
with Test.Suite_Oneway_Blockciphers;
with Test.Suite_Blockciphers;
with Crypto.Types.Random;
with AUnit.Reporter.Text;
with Test.Suite_AE;
with Test.Suite_Nonces;
with AUnit.Run;


procedure Test.Symmetric_Ciphers is
   procedure Run_Nonce is new AUnit.Run.Test_Runner(Test.Suite_Nonces.Suite);
   
   procedure Run_BC  is new
     AUnit.Run.Test_Runner(Test.Suite_Blockciphers.Suite);
   procedure Run_OBC is new
     AUnit.Run.Test_Runner(Test.Suite_Oneway_Blockciphers.Suite);
   procedure Run_AE is new AUnit.Run.Test_Runner(Test.Suite_AE.Suite);
   
   Reporter : AUnit.Reporter.Text.Text_Reporter;

   use Crypto.Types.Random_Source.Provider;
   Dev_U_Rand : Random_Source_Provider;
begin
   Dev_U_Rand.Initialize("/dev/urandom");
   Crypto.Types.Random.Set(Dev_U_Rand);
   Run_Nonce(Reporter);
   Run_BC(Reporter);
   Run_OBC(Reporter);
   Run_AE(Reporter);
end Test.Symmetric_Ciphers;
