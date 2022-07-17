with Ada.Text_IO;

package body Etat_P.Commande_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_E
      (This : in out Commande_T)
   is
   begin
      Ada.Text_IO.Put_Line (Item => "<E>");
   end Presse_E;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_I
      (This : in out Commande_T)
   is
   begin
      Ada.Text_IO.Put_Line (Item => "<I>");
   end Presse_I;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_Esc
      (This : in out Commande_T)
   is
   begin
      Ada.Text_IO.Put_Line (Item => "<ESC>");
   end Presse_Esc;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Etat_P.Commande_P;
