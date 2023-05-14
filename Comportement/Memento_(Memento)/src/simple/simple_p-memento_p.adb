package body Simple_P.Memento_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Creer
      (Utilisateur : in     Utilisateur_T)
      return Memento_T
   is
   begin
      return Memento_T'(Etat => Utilisateur);
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Retablir
      (
         This        : in     Memento_T;
         Utilisateur : in out Utilisateur_T
      )
   is
   begin
      Utilisateur.Valeur := This.Etat.Valeur;
   end Retablir;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Simple_P.Memento_P;
