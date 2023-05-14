with Simple_P.Memento_P;

package body Simple_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Modifier
      (
         This   : in out Utilisateur_T;
         Valeur : in     Valeur_P.Valeur_T
      )
   is
   begin
      This.Valeur := Valeur;
   end Modifier;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Valeur
      (This : in     Utilisateur_T)
      return Valeur_P.Valeur_T
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
   begin
      return Memento_P.Creer (Utilisateur => This);
   end Memoriser;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Retablir
      (
         This    : in out Utilisateur_T;
         Memento : in     Memento_P.Memento_T
      )
   is
   begin
      Memento.Retablir (Utilisateur => This);
   end Retablir;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Simple_P;
