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
   function Faire
      (This : in     Feuille_T)
      return Valeur_P.Valeur_T
   is
   begin
      return This.Valeur;
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
         This     : in out Feuille_T;
         Position : in     ID_T
      )
   is
   begin
      null;
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
   function Lire_NB_Enfants
      (This : in     Feuille_T)
      return NB_Enfants_T
   is
      pragma Unreferenced (This);
   begin
      return 0;
   end Lire_NB_Enfants;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Image
      (This : in     Feuille_T)
      return String
   is
   begin
      return This.Valeur'Image;
   end Image;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Composant_P.Feuille_P;
