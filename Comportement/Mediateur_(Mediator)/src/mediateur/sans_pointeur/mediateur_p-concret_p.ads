with Donnee_P;
with Utilisateur_P.Collegue_P;

--  @summary
--  Version concrète du médiateur.
--  @description
--  Version concrète du médiateur.
--  @group Mediateur
package Mediateur_P.Concret_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   subtype Utilisateur_T is Utilisateur_P.Collegue_P.Utilisateur_Collegue_T;

   type Concret_T is new Mediateur_T with private;

   overriding
   procedure Signaler
      (
         This : in out Concret_T;
         ID   : in     ID_T
      );

   not overriding
   procedure Inscrire
      (
         This : in out Concret_T;
         Nom  : in     Donnee_P.Contenu_T;
         ID   :    out ID_T
      );
   --  Crée un utilisateur qui sera géré par le médiateur.
   --  @param This
   --  Le médiateur.
   --  @param Nom
   --  Le nom de l'utilisateur à ajouter.
   --  @param ID
   --  L'identifiant donné à l'utilisateur.

   not overriding
   procedure Envoyer
      (
         This         : in out Concret_T;
         Envoyeur     : in     ID_T;
         Destinataire : in     ID_T;
         Message      : in     Donnee_P.Contenu_T
      );
   --  Envoie un message à un autre utilisateur.
   --  @param This
   --  Le médiateur.
   --  @param Envoyeur
   --  L'envoyeur du message.
   --  @param Destinataire
   --  Le destinataire du message.
   --  @param Message
   --  Le contenu du message.

private

   type Collegue_T is
      record
         Utilisateur : Utilisateur_P.Collegue_P.Utilisateur_Collegue_T;
         Initialise  : Boolean := False;
      end record;

   procedure Envoyer
      (
         Collegue : in out Collegue_T;
         Message  : in     Donnee_P.Contenu_T
      );

   type Concret_T is new Mediateur_T with
      record
         U_1 : Collegue_T;
         --  Le premier utilisateur.
         U_2 : Collegue_T;
         --  Le deuxième utilisateur.
         Pos : ID_T := Pas_D_ID;
         --  Position mémorisé du dernier utilisateur libre.
      end record;

end Mediateur_P.Concret_P;
