with Ada.Text_IO;

with GNAT.Source_Info;

package body Etat_P.Commande_P
   with Spark_Mode => Off
is

   Nom : constant String := "  Commande  ";

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_E
      (This : in out Commande_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put      (Item => Nom & " :  <E>  ");
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);
   end Presse_E;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_I
      (This : in out Commande_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put      (Item => Nom & " :  <I>  ");
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);
   end Presse_I;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_V
      (This : in out Commande_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put      (Item => Nom & " :  <V>  ");
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);
   end Presse_V;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_R
      (This : in out Commande_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put      (Item => Nom & " :  <R>  ");
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);
   end Presse_R;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Presse_Esc
      (This : in out Commande_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put      (Item => Nom & " : <ESC> ");
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);
   end Presse_Esc;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Etat_P.Commande_P;
