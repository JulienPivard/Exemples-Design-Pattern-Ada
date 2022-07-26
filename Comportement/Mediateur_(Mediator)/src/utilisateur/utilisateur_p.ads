with Donnee_P;

--  @summary
--  Un utilisateur de chat.
--  @description
--  Un utilisateur de chat.
--  @group Utilisateur
package Utilisateur_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Utilisateur_T is tagged private;

   function Creer
      (Nom : in     Donnee_P.Contenu_T)
      return Utilisateur_T;
   --  Crée un utilisateur.
   --  @param Nom
   --  Le nom de l'utilisateur.
   --  @return L'utilisateur initialisé.

   procedure Envoyer
      (
         This    : in out Utilisateur_T;
         Message : in     Donnee_P.Contenu_T
      );
   --  Envoie un message à un autre utilisateur.
   --  @param This
   --  L'utilisateur.
   --  @param Message
   --  Le contenu du message.

   function Lire_Nom
      (This : in     Utilisateur_T)
      return Donnee_P.Contenu_T;
   --  Lit le nom de l'utilisateur.
   --  @param This
   --  L'utilisateur.
   --  @return Le nom de l'utilisateur.

   function Lire_Msg
      (This : in     Utilisateur_T)
      return Donnee_P.Contenu_T;
   --  Lit le contenu du message à envoyer.
   --  @param This
   --  L'utilisateur.
   --  @return Le contenu du message.

private

   Nom_Vide : constant Donnee_P.Contenu_T :=
      Donnee_P.Contenu_T'(others => ' ');

   Msg_Vide : constant Donnee_P.Contenu_T :=
      Donnee_P.Contenu_T'(others => ' ');

   type Utilisateur_T is tagged
      record
         Nom : Donnee_P.Contenu_T := Nom_Vide;
         --  Le nom de l'utilisateur.
         Msg : Donnee_P.Contenu_T := Msg_Vide;
         --  Le message à envoyer.
      end record;

end Utilisateur_P;
