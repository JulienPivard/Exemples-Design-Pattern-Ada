package body Mem_P.Auteur_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Modifier
      (
         This   : in out Auteur_T;
         Valeur : in     Valeur_T
      )
   is
   begin
      This.Valeur := Valeur;
   end Modifier;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Valeur
      (This : in     Auteur_T)
      return Valeur_T
   is
   begin
      return This.Valeur;
   end Lire_Valeur;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Memoriser
      (This : in     Auteur_T)
      return Memento_T
   is
      Etat : constant Etat_P.Etat_T := Etat_P.Creer (Valeur => This.Valeur);
   begin
      return Memento_T'(Etat => Etat);
   end Memoriser;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Retablir
      (
         This    : in out Auteur_T;
         Memento : in     Memento_T
      )
   is
      Etat : constant Etat_P.Etat_T := Memento.Etat;
   begin
      This.Valeur := Etat_P.Lire_Valeur (Etat => Etat);
   end Retablir;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Mem_P.Auteur_P;
