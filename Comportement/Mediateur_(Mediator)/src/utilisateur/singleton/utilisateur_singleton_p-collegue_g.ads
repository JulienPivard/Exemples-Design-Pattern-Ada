with Donnee_P;
with Mediateur_P;
with Utilisateur_Abstrait_P;

private with Mediateur_P.Holders_P;

generic

--  @summary
--  L'utilisateur qui sera pointé.
--  @description
--  L'utilisateur qui sera pointé.
--  @group Collegue
package Utilisateur_Singleton_P.Collegue_G is

   pragma Elaborate_Body;
   pragma Spark_Mode (Off);

   type Utilisateur_Collegue_T is new Utilisateur_T with private;

   overriding
   procedure Ajouter
      (
         This      : in out Utilisateur_Collegue_T;
         Mediateur : in     Mediateur_P.Mediateur_T'Class;
         ID        : in     Mediateur_P.ID_T
      );
   --  Le médiateur se signal à son collègue.
   --  @param This
   --  La classe qui a besoin de collaborer.
   --  @param Mediateur
   --  Le médiateur.
   --  @param ID
   --  L'identifiant unique connu du médiateur.

   overriding
   function Creer
      (Nom : in     Donnee_P.Contenu_T)
      return Utilisateur_Collegue_T;
   --  Crée un utilisateur.
   --  @param Nom
   --  Le nom de l'utilisateur.
   --  @return L'utilisateur initialisé.

   overriding
   procedure Envoyer
      (
         This    : in out Utilisateur_Collegue_T;
         Message : in     Donnee_P.Contenu_T
      );
   --  Envoie un message à un autre utilisateur.
   --  @param This
   --  L'utilisateur.
   --  @param Message
   --  Le contenu du message.

   overriding
   function Lire_Nom
      (This : in     Utilisateur_Collegue_T)
      return Donnee_P.Contenu_T;
   --  Lit le nom de l'utilisateur.
   --  @param This
   --  L'utilisateur.
   --  @return Le nom de l'utilisateur.

   overriding
   function Lire_Msg
      (This : in     Utilisateur_Collegue_T)
      return Donnee_P.Contenu_T;
   --  Lit le contenu du message à envoyer.
   --  @param This
   --  L'utilisateur.
   --  @return Le contenu du message.

   overriding
   procedure Afficher
      (
         This : in     Utilisateur_Collegue_T;
         Recu : in     Utilisateur_Abstrait_P.Utilisateur_T'Class
      );
   --  Affiche le message reçu d'un autre utilisateur.
   --  @param This
   --  L'utilisateur.
   --  @param Recu
   --  L'autre utilisateur qui veux communiquer avec nous.

private

   package Mediateur_Holder_P renames Mediateur_P.Holders_P;

   subtype Mediateur_T is Mediateur_P.Holders_P.Holder;

   Mediateur_Vide : Mediateur_T renames Mediateur_Holder_P.Empty_Holder;

   type Utilisateur_Collegue_T is new Utilisateur_T with null record;

   ------------------------
   protected Utilisateur is
      ---------
      procedure Ajouter
         (
            Mediateur : in     Mediateur_P.Mediateur_T'Class;
            ID        : in     Mediateur_P.ID_T
         );
      --  Le médiateur se signal à son collègue.
      --  @param Mediateur
      --  Le médiateur.
      --  @param ID
      --  L'identifiant unique connu du médiateur.

      procedure Changer_Nom
         (Nom : in     Donnee_P.Contenu_T);
      --  Change le nom de l'utilisateur
      --  @param Nom
      --  Le nom de l'utilisateur.

      procedure Changer_Contenu
         (Message : in     Donnee_P.Contenu_T);
      --  Change le message de l'utilisateur.
      --  @param Message
      --  Le message de l'utilisateur.

      function Lire_Nom
         return Donnee_P.Contenu_T;
      --  Lit le nom de l'utilisateur.
      --  @return Le nom de l'utilisateur.

      function Lire_Msg
         return Donnee_P.Contenu_T;
      --  Lit le contenu du message à envoyer.
      --  @return Le contenu du message.

      function Lire_Mediateur
         return Mediateur_T;
      --  Lit le médiateur.
      --  @return Le médiateur.

      function Lire_ID
         return Mediateur_P.ID_T;
      --  Lit l'identifiant que le médiateur à donné.
      --  @return L'identifiant du médiateur.
   private
      Nom_L        : Donnee_P.Contenu_T := Donnee_P.Vide;
      --  Le nom de l'utilisateur.
      Contenu      : Donnee_P.Contenu_T := Donnee_P.Vide;
      --  Le contenu du message écrit par l'utilisateur.
      Mediateur_H  : Mediateur_T        := Mediateur_Vide;
      --  Le médiateur à contacter.
      ID_Mediateur : Mediateur_P.ID_T   := Mediateur_P.Pas_D_ID;
      --  Identifiant assigné par le médiateur.
   end Utilisateur;

end Utilisateur_Singleton_P.Collegue_G;
