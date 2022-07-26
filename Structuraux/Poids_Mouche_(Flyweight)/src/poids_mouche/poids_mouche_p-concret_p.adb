with Ada.Text_IO;

with GNAT.Source_Info;

package body Poids_Mouche_P.Concret_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Operation
      (
         This : in     Poids_Mouche_Concret_1_T;
         Etat : in     Etat_P.Etat_Externe_T
      )
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Enclosing_Entity);
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);
      Ada.Text_IO.Put_Line
         (Item => "Val : " & Etat_P.Valeur_T'Image (Etat.Lire_Val));
   end Operation;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation
      (
         This : in     Poids_Mouche_Concret_2_T;
         Etat : in     Etat_P.Etat_Externe_T
      )
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Enclosing_Entity);
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);
      Ada.Text_IO.Put_Line
         (Item => "Val : " & Etat_P.Valeur_T'Image (Etat.Lire_Val));
   end Operation;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation
      (
         This : in     Poids_Mouche_Concret_3_T;
         Etat : in     Etat_P.Etat_Externe_T
      )
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Enclosing_Entity);
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);
      Ada.Text_IO.Put_Line
         (Item => "Val : " & Etat_P.Valeur_T'Image (Etat.Lire_Val));
   end Operation;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Poids_Mouche_P.Concret_P;
