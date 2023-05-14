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
   --  Les transitions d'un état vers un autre en fonction des
   --  touches pressées.

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
   --  Le nouvel état après avoir pressé une touche
   --  en fonction de l'état actuel.
   --  @param This
   --  L'objet qui gère les transitions.
   --  @param Etat
   --  L'état actuel.
   --  @param Touche
   --  La touche pressée.

private

   type Prochain_Etat_T is
      (
         Pas_De_Changement,
         --  Pas de changement de l'état en cours.
         Commande,
         --  On passe d'un état vers l'état commande.
         Insertion,
         --  On passe d'un état vers l'état insertion.
         Remplacement,
         --  On passe d'un état vers l'état remplacement.
         Visuel
         --  On passe d'un état vers l'état visuel.
      );
   --  Indique quel sera le prochain état à la fin de l'exécution.

   type Transition_T is tagged
      record
         null;
      end record;

   function Creer
      return Transition_T
   is (Transition_T'(null record));

   type Table_De_Transition_T is array
      (Etat_P.Id_Etat_T, Lettre_P.Id_Touche_T) of Prochain_Etat_T;
   --  La table des transitions d'un état actuel en fonction de
   --  la touche pressée.

end Transition_P;
