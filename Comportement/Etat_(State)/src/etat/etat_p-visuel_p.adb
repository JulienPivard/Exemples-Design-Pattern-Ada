with Ada.Text_IO;

package body Etat_P.Visuel_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_E
      (This : in out Visuel_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Visuel : <E>");
   end Presse_E;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_I
      (This : in out Visuel_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Visuel : <I>");
   end Presse_I;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_V
      (This : in out Visuel_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Visuel : <V>");
   end Presse_V;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_R
      (This : in out Visuel_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Visuel : <R>");
   end Presse_R;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_Esc
      (This : in out Visuel_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Visuel : <ESC>");
   end Presse_Esc;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Etat_P.Visuel_P;
