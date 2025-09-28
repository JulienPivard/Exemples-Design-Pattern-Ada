with Ada.Text_IO;

package body Composant_P.Feuille_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Construire
      (Valeur : in     Valeur_P.Valeur_T)
      return Feuille_T
   is
      Resultat : constant Feuille_T := Feuille_T'(Valeur => Valeur);
   begin
      return Resultat;
   end Construire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Faire
      (This : in     Feuille_T)
   is
   begin
      Ada.Text_IO.Put_Line
         (Item => "Enfant " & Valeur_P.Valeur_T'Image (This.Valeur));
   end Faire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter
      (
         This     : in out Feuille_T;
         Compoant : in     Composant_T'Class;
         Position : in     ID_T
      )
   is
   begin
      raise E_Ajout_Impossible with "Impossible d'ajouter à une feuille";
   end Ajouter;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Supprimer
      (
         This   : in out Feuille_T;
         Valeur : in     Valeur_P.Valeur_T
      )
   is
   begin
      raise E_Suppression_Impossible with "Impossible de supprimer";
   end Supprimer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Lire_Enfant
      (
         This     : in     Feuille_T;
         Position : in     ID_T
      )
      return Composant_T'Class
   is
      pragma Unreferenced (Position);
   begin
      return This;
   end Lire_Enfant;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Lire_Nb_Enfants
      (This : in     Feuille_T)
      return Nb_Enfants_T
   is
      pragma Unreferenced (This);
   begin
      return 0;
   end Lire_Nb_Enfants;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Composant_P.Feuille_P;
