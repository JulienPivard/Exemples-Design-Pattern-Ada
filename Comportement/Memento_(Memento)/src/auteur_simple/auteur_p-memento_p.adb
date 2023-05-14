package body Auteur_P.Memento_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Memoriser
      (Auteur : in     Auteur_T)
      return Memento_T
   is
   begin
      return Memento_T'(Valeur => Auteur.Valeur);
   end Memoriser;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Restaurer
      (
         This   : in     Memento_T;
         Auteur : in out Auteur_T
      )
   is
   begin
      Auteur.Valeur := This.Valeur;
   end Restaurer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Auteur_P.Memento_P;
