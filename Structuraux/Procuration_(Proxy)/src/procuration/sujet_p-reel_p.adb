with Ada.Text_IO;

with GNAT.Source_Info;

package body Sujet_P.Reel_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Creer
      return Sujet_Reel_T
   is
      Resultat : Sujet_Reel_T;
   begin
      return Resultat;
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation
      (This : in out Sujet_Reel_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Enclosing_Entity);
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);
   end Operation;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Sujet_P.Reel_P;
