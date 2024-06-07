package body Utilisateur_P.Collegue_Accee_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter
      (
         This      : in out Utilisateur_Collegue_T;
         Mediateur : in     Accee_P.Mediateur_A;
         ID        : in     Mediateur_P.ID_T
      )
   is
   begin
      This.Mediateur := Mediateur;
      This.ID        := ID;
   end Ajouter;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Creer
      (Nom : in     Donnee_P.Contenu_T)
      return Utilisateur_Collegue_T
   is
   begin
      return Utilisateur_Collegue_T'
         (
            Creer_Parent (Nom => Nom)
            with
            Mediateur => null,
            ID        => Mediateur_P.Pas_D_ID
         );
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Envoyer
      (
         This    : in out Utilisateur_Collegue_T;
         Message : in     Donnee_P.Contenu_T
      )
   is
   begin
      Utilisateur_T (This).Envoyer (Message => Message);
      This.Mediateur.all.Signaler (ID => This.ID);
   end Envoyer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Utilisateur_P.Collegue_Accee_P;
