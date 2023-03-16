package body Utilisateur_P.Collegue_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter
      (
         This      : in out Utilisateur_Collegue_T;
         Mediateur : in     Mediateur_P.Mediateur_T'Class;
         Id        : in     Mediateur_P.Id_T
      )
   is
      pragma Unreferenced (This);
      pragma Unreferenced (Mediateur);
      pragma Unreferenced (Id);
   begin
      null;
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
         (Creer_Parent (Nom => Nom) with null record);
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
   end Envoyer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Utilisateur_P.Collegue_P;
