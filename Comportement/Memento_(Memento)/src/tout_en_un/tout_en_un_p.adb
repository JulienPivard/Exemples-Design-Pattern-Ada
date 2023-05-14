package body Tout_En_Un_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Modifier
      (
         This   : in out Auteur_T;
         Valeur : in     Valeur_P.Valeur_T
      )
   is
   begin
      This.Valeur := Valeur;
   end Modifier;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Valeur
      (This : in     Auteur_T)
      return Valeur_P.Valeur_T
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
   begin
      return Memento_T'(Valeur => This.Valeur);
   end Memoriser;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Retablir
      (
         This    : in out Auteur_T;
         Memento : in     Memento_T
      )
   is
   begin
      This.Valeur := Memento.Valeur;
   end Retablir;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Tout_En_Un_P;
