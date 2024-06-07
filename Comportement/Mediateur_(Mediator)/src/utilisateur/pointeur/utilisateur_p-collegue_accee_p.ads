with Accee_P.Collegue_Abstrait_P;
with Mediateur_P;

--  @summary
--  Version collègue de l'utilisateur.
--  @description
--  Version collègue de l'utilisateur.
--  @group Mediateur
package Utilisateur_P.Collegue_Accee_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Utilisateur_Collegue_T is new Utilisateur_T and
      Accee_P.Collegue_Abstrait_P.Collegue_T with private;
   --  Version collègue de l'utilisateur.

   overriding
   procedure Ajouter
      (
         This      : in out Utilisateur_Collegue_T;
         Mediateur : in     Accee_P.Mediateur_A;
         Id        : in     Mediateur_P.ID_T
      );

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

   type Utilisateur_Collegue_A is access all Utilisateur_Collegue_T;
   --  Pointeur sur un utilisateur.

private

   function Creer_Parent
      (Nom : in     Donnee_P.Contenu_T)
      return Utilisateur_T
   renames Creer;

   type Utilisateur_Collegue_T is new Utilisateur_T and
      Accee_P.Collegue_Abstrait_P.Collegue_T with
      record
         Mediateur : Accee_P.Mediateur_A;
         --  Le médiateur.
         ID        : Mediateur_P.ID_T;
         --  L'identifiant associé.
      end record;

end Utilisateur_P.Collegue_Accee_P;
