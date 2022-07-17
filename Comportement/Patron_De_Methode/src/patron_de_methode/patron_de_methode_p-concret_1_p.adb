with Ada.Text_IO;

with GNAT.Source_Info;

package body Patron_De_Methode_P.Concret_1_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_1
      (This : in out Concret_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);
      Ada.Text_IO.Put_Line (Item => "Première première");
   end Operation_1;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_2
      (This : in out Concret_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);
      Ada.Text_IO.Put_Line (Item => "Première seconde");
   end Operation_2;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Patron_De_Methode_P.Concret_1_P;
