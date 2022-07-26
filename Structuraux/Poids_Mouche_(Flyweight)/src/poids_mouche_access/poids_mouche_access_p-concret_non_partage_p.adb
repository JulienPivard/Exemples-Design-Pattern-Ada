with Ada.Text_IO;

with GNAT.Source_Info;

package body Poids_Mouche_Access_P.Concret_Non_Partage_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   not overriding
   function Creer
      (Nom : in     Nom_T)
      return Poids_Mouche_Concret_1_T
   is
   begin
      return Poids_Mouche_Concret_1_T'(Nom => Nom);
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation
      (
         This : in     Poids_Mouche_Concret_1_T;
         Etat : in     Etat_P.Etat_Externe_T
      )
   is
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Enclosing_Entity);
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);
      Ada.Text_IO.Put_Line
         (Item => "Val : " & Etat_P.Valeur_T'Image (Etat.Lire_Val));
      Ada.Text_IO.Put_Line
         (Item => "Nom : " & This.Nom);
   end Operation;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   not overriding
   function Creer
      (Nom : in     Nom_T)
      return Poids_Mouche_Concret_2_T
   is
   begin
      return Poids_Mouche_Concret_2_T'(Nom => Nom);
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Operation
      (
         This : in     Poids_Mouche_Concret_2_T;
         Etat : in     Etat_P.Etat_Externe_T
      )
   is
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Enclosing_Entity);
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);
      Ada.Text_IO.Put_Line
         (Item => "Val : " & Etat_P.Valeur_T'Image (Etat.Lire_Val));
      Ada.Text_IO.Put_Line
         (Item => "Nom : " & This.Nom);
   end Operation;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Poids_Mouche_Access_P.Concret_Non_Partage_P;
