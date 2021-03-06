-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License as
-- published by the Free Software Foundation; either version 2 of the
-- License, or (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
-- 02111-1307, USA.

-- As a special exception, if other files instantiate generics from
-- this unit, or you link this unit with other files to produce an
-- executable, this unit does not by itself cause the resulting
-- executable to be covered by the GNU General Public License. This
-- exception does not however invalidate any other reasons why the
-- executable file might be covered by the GNU Public License.


package body Crypto.Symmetric.Algorithm.SHA512.Oneway is

   procedure Prepare_Key(Key       : in  DW_Block256;
                         Cipherkey : out Cipherkey_SHA512) is
   begin
      Cipherkey.Left_Key  := Key;
      Cipherkey.Right_Key := Key;
   end Prepare_Key;

   ---------------------------------------------------------------------------

   procedure Encrypt(Cipherkey  : in  Cipherkey_SHA512;
                     Plaintext  : in  DW_Block512;
                     Ciphertext : out DW_Block512) is
      M : Dwords(DW_Block1024'Range);
   begin
      Init(Ciphertext);
      M( 0.. 3) := DWords(Cipherkey.Left_Key);
      M( 4..11) := DWords(Plaintext);
      M(12..15) := DWords(Cipherkey.Right_Key);
      Round(DW_Block1024(M), Ciphertext);
   end Encrypt;

end  Crypto.Symmetric.Algorithm.SHA512.Oneway;
