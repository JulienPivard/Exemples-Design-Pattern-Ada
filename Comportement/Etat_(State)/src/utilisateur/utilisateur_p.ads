with Lettre_P;

private with Ada.Containers.Indefinite_Holders;

private with Etat_P;
private with Transition_P;

--  @summary
--  L'utilisateur avec ses états internes.
--  @description
--  L'utilisateur avec ses états internes.
--  @group Etat
package Utilisateur_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Utilisateur_T is tagged private;

   function Creer
      return Utilisateur_T;

   procedure Presser
      (
         This   : in out Utilisateur_T;
         Lettre : in     Lettre_P.ID_Touche_T
      );

private

   procedure Changer_D_Etat
      (
         This   : in out Utilisateur_T;
         Touche : in     Lettre_P.ID_Touche_T
      );

   package Etat_Holder_P is new Ada.Containers.Indefinite_Holders
      (
         Element_Type => Etat_P.Etat_T'Class,
         "="          => Etat_P."="
      );

   subtype Etat_T is Etat_Holder_P.Holder;

   type Utilisateur_T is tagged
      record
         Etat       : Etat_T := Etat_Holder_P.Empty_Holder;
         Transition : Transition_P.Transition_T;
      end record;

end Utilisateur_P;
