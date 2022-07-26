with Ada.Text_IO;

with GNAT.Source_Info;

package body Poids_Mouche_P.Concret_P
   with Spark_Mode => Off
is

   ---------------------------------
   protected type Objet_Protege_T is
      -------------------
      procedure Operation
         (
            Nom  : in     String := GNAT.Source_Info.Enclosing_Entity;
            Loc  : in     String := GNAT.Source_Info.Source_Location;
            Etat : in     Etat_P.Etat_Externe_T
         );
      --  Opération exécuté par le poids mouche.
      --  @param Etat
      --  L'état externe.
   end Objet_Protege_T;

   Objet_1 : Objet_Protege_T;
   Objet_2 : Objet_Protege_T;
   Objet_3 : Objet_Protege_T;

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
      Objet_1.Operation (Etat => Etat);
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
      Objet_2.Operation (Etat => Etat);
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
      Objet_3.Operation (Etat => Etat);
   end Operation;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   protected body Objet_Protege_T is
      -------------------
      procedure Operation
         (
            Nom  : in     String := GNAT.Source_Info.Enclosing_Entity;
            Loc  : in     String := GNAT.Source_Info.Source_Location;
            Etat : in     Etat_P.Etat_Externe_T
         )
      is
      begin
         Ada.Text_IO.Put_Line (Item => Nom);
         Ada.Text_IO.Put_Line (Item => Loc);
         Ada.Text_IO.Put_Line
            (Item => "Val : " & Etat_P.Valeur_T'Image (Etat.Lire_Val));
      end Operation;
      -------------------
   end Objet_Protege_T;
   ---------------------------------------------------------------------------

end Poids_Mouche_P.Concret_P;
