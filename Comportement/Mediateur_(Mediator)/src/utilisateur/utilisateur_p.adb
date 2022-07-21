package body Utilisateur_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Creer
      (Nom : in     Donnee_P.Contenu_T)
      return Utilisateur_T
   is
   begin
      return Utilisateur_T'(Nom => Nom, Msg => Msg_Vide);
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Envoyer
      (
         This    : in out Utilisateur_T;
         Message : in     Donnee_P.Contenu_T
      )
   is
   begin
      This.Msg := Message;
   end Envoyer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Nom
      (This : in     Utilisateur_T)
      return Donnee_P.Contenu_T
   is
   begin
      return This.Nom;
   end Lire_Nom;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Msg
      (This : in     Utilisateur_T)
      return Donnee_P.Contenu_T
   is
   begin
      return This.Msg;
   end Lire_Msg;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Utilisateur_P;
