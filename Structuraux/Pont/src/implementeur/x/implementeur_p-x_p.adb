with Ada.Text_IO;

package body Implementeur_P.X_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_1
      (This : in out X_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Ope 1 de X.");
   end Operation_1;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_2
      (This : in out X_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Ope 2 de X.");
   end Operation_2;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_3
      (This : in out X_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Ope 3 de X.");
   end Operation_3;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_4
      (This : in out X_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Ope 4 de X.");
   end Operation_4;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation_5
      (This : in out X_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Ope 5 de X.");
   end Operation_5;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Implementeur_P.X_P;
