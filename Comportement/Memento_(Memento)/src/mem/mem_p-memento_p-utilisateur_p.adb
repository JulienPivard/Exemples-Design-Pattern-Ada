with Mem_P.Etat_P;
with Mem_P.Memento_P.Acces_P;

package body Mem_P.Memento_P.Utilisateur_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Modifier
      (
         This   : in out Utilisateur_T;
         Valeur : in     Valeur_T
      )
   is
   begin
      This.Valeur := Valeur;
   end Modifier;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Valeur
      (This : in     Utilisateur_T)
      return Valeur_T
   is
   begin
      return This.Valeur;
   end Lire_Valeur;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Memoriser
      (This : in     Utilisateur_T)
      return Memento_P.Memento_T
   is
      Etat : constant Etat_P.Etat_T :=
         Etat_P.Creer (Valeur => This.Valeur);
   begin
      return Memento_P.Acces_P.Creer (Etat => Etat);
   end Memoriser;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Retablir
      (
         This    : in out Utilisateur_T;
         Memento : in     Memento_P.Memento_T
      )
   is
      Etat : constant Etat_P.Etat_T :=
         Memento_P.Acces_P.Lire_Etat (Memento => Memento);
   begin
      This.Valeur := Etat_P.Lire_Valeur (Etat => Etat);
   end Retablir;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Mem_P.Memento_P.Utilisateur_P;
