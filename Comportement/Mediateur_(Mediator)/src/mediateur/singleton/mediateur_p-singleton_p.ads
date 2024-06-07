with Utilisateur_Singleton_P;

private with Utilisateur_Holders_P;

--  @summary
--  Un médiateur dédié aux utilisations dans un contexte concurrent.
--  @description
--  Un médiateur dédié aux utilisations dans un contexte concurrent.
--  @group Mediateur
package Mediateur_P.Singleton_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Mediateur_Concret_T is new Mediateur_T with private;

   overriding
   procedure Signaler
      (
         This : in out Mediateur_Concret_T;
         ID   : in     ID_T
      );
   --  Permet à un des collègue de signaler au médiateur qu'il a été modifié.
   --  @param This
   --  Le médiateur.
   --  @param ID
   --  Identifiant unique du collègue.

   not overriding
   procedure Inscrire
      (
         This        : in out Mediateur_Concret_T;
         Utilisateur : in out Utilisateur_Singleton_P.Utilisateur_T'Class
      );
   --  Crée un utilisateur qui sera géré par le médiateur.
   --  @param This
   --  Le médiateur.
   --  @param Utilisateur
   --  L'utilisateur à ajouter.

private

   subtype Utilisateur_T is Utilisateur_Holders_P.Holder;

   Utilisateur_Vide : Utilisateur_T renames Utilisateur_Holders_P.Empty_Holder;

   type Mediateur_Concret_T is new Mediateur_T with null record;

   type Collegue_T is
      record
         Utilisateur : Utilisateur_T := Utilisateur_Vide;
         Initialise  : Boolean       := False;
      end record;

   ----------------------
   protected Mediateur is
      ---------
      procedure Signaler
         (ID : in     ID_T);
      --  Permet à un des collègue de signaler au
      --  médiateur qu'il a été modifié.
      --  @param ID
      --  Identifiant unique du collègue.

      ---------
      procedure Inscrire_Protege
         (
            Mediateur_V : in out Mediateur_Concret_T;
            Utilisateur : in out Utilisateur_Singleton_P.Utilisateur_T'Class
         );
      --  Inscrit l'utilisateur dans le médiateur.
      --  @param This
      --  Le médiateur.
      --  @param Utilisateur
      --  L'utilisateur à inscrire.
   private
      U_1 : Collegue_T;
      --  Le premier utilisateur.
      U_2 : Collegue_T;
      --  Le deuxième utilisateur.
      Pos : ID_T := Pas_D_ID;
      --  Position mémorisé du dernier utilisateur libre.
   end Mediateur;

end Mediateur_P.Singleton_P;
