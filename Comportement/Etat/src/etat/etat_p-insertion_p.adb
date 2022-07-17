with Ada.Text_IO;

package body Etat_P.Insertion_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_E
      (This : in out Insertion_T)
   is
   begin
      Ada.Text_IO.Put_Line (Item => "e");
   end Presse_E;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_I
      (This : in out Insertion_T)
   is
   begin
      Ada.Text_IO.Put_Line (Item => "i");
   end Presse_I;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_Esc
      (This : in out Insertion_T)
   is
   begin
      Ada.Text_IO.Put_Line (Item => "<esc>");
   end Presse_Esc;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Etat_P.Insertion_P;
