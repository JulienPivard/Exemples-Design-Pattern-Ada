with Ada.Text_IO;

package body Etat_P.Remplacement_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_E
      (This : in out Remplacement_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Remplacement  : <E>");
   end Presse_E;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_I
      (This : in out Remplacement_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Remplacement  : <I>");
   end Presse_I;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_V
      (This : in out Remplacement_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Remplacement  : <V>");
   end Presse_V;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_R
      (This : in out Remplacement_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Remplacement  : <R>");
   end Presse_R;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_Esc
      (This : in out Remplacement_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Remplacement  : <ESC>");
   end Presse_Esc;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Etat_P.Remplacement_P;
