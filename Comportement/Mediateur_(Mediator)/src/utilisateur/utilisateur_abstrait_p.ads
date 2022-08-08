with Donnee_P;

--  @summary
--  Version abstraite de l'utilisateur.
--  @description
--  Version abstraite de l'utilisateur.
--  @group Utilisateur
package Utilisateur_Abstrait_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Utilisateur_T is interface;

   function Creer
      (Nom : in     Donnee_P.Contenu_T)
      return Utilisateur_T
   is abstract;
   --  Crée un utilisateur.
   --  @param Nom
   --  Le nom de l'utilisateur.
   --  @return L'utilisateur initialisé.

   procedure Envoyer
      (
         This    : in out Utilisateur_T;
         Message : in     Donnee_P.Contenu_T
      )
   is abstract;
   --  Envoie un message à un autre utilisateur.
   --  @param This
   --  L'utilisateur.
   --  @param Message
   --  Le contenu du message.

   function Lire_Nom
      (This : in     Utilisateur_T)
      return Donnee_P.Contenu_T
   is abstract;
   --  Lit le nom de l'utilisateur.
   --  @param This
   --  L'utilisateur.
   --  @return Le nom de l'utilisateur.

   function Lire_Msg
      (This : in     Utilisateur_T)
      return Donnee_P.Contenu_T
   is abstract;
   --  Lit le contenu du message à envoyer.
   --  @param This
   --  L'utilisateur.
   --  @return Le contenu du message.

   procedure Afficher
      (
         This : in     Utilisateur_T;
         Recu : in     Utilisateur_T'Class
      )
   is abstract;
   --  Affiche le message reçu d'un autre utilisateur.
   --  @param This
   --  L'utilisateur.
   --  @param Recu
   --  L'autre utilisateur qui veux communiquer avec nous.

end Utilisateur_Abstrait_P;
