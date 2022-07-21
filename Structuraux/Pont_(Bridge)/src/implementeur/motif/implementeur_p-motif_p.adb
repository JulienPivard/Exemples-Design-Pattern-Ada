with Ada.Text_IO;

with GNAT.Source_Info;

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
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Enclosing_Entity);
   end Operation_1;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_2
      (This : in out Motif_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Enclosing_Entity);
   end Operation_2;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_3
      (This : in out Motif_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Enclosing_Entity);
   end Operation_3;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_4
      (This : in out Motif_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Enclosing_Entity);
   end Operation_4;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_5
      (This : in out Motif_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Enclosing_Entity);
   end Operation_5;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Implementeur_P.Motif_P;
