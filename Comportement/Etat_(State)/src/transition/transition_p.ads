with Etat_P;
with Lettre_P;

--  @summary
--  Une petite explication
--  @description
--  Une description plus longue
--  @group Etat
package Transition_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Transition_T is tagged private;

   function Creer
      return Transition_T;

   function Etat_Initial
      (This : in out Transition_T)
      return Etat_P.Etat_T'Class;

   function Changer_D_Etat
      (
         This   : in out Transition_T;
         Etat   : in     Etat_P.Etat_T'Class;
         Touche : in     Lettre_P.Id_Touche_T
      )
      return Etat_P.Etat_T'Class;

private

   type Prochain_Etat_T is
      (
         Pas_De_Changement,
         Commande,
         Insertion,
         Remplacement,
         Visuel
      );

   type Transition_T is tagged
      record
         null;
      end record;

   function Creer
      return Transition_T
   is (Transition_T'(null record));

   type Table_De_Transition_T is array
      (Etat_P.Id_Etat_T, Lettre_P.Id_Touche_T) of Prochain_Etat_T;

end Transition_P;
