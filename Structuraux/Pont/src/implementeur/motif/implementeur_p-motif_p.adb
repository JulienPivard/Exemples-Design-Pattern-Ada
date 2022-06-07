with Ada.Text_IO;

package body Implementeur_P.Motif_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_1
      (This : in out Motif_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Ope 1 de motif.");
   end Operation_1;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_2
      (This : in out Motif_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Ope 2 de motif.");
   end Operation_2;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_3
      (This : in out Motif_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Ope 3 de motif.");
   end Operation_3;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Implementeur_P.Motif_P;
