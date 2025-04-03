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
   --  Crée un gestionnaire de transitions.
   --  @return Le gestionnaire de transitions.

   function Etat_Initial
      (This : in out Transition_T)
      return Etat_P.Etat_T'Class;
   --  Génère l'état initial.
   --  @param This
   --  L'objet qui gère les transitions.
   --  @return L'état initial avant toute transition.

   function Changer_D_Etat
      (
         This   : in out Transition_T;
         Etat   : in     Etat_P.Etat_T'Class;
         Touche : in     Lettre_P.ID_Touche_T
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
   --  @return Le nouvel état.

   function Il_Faut_Changer_D_Etat
      (
         This   : in out Transition_T;
         Etat   : in     Etat_P.Etat_T'Class;
         Touche : in     Lettre_P.ID_Touche_T
      )
      return Boolean;
   --  Tests si l'état va changer en fonction de
   --  la touche pressée et de l'état en cours.
   --  @param This
   --  L'objet qui gère les transitions.
   --  @param Etat
   --  L'état actuel.
   --  @param Touche
   --  La touche pressée.
   --  @return Il faut changer d'état.

private

   type Prochain_Etat_T is
      (
         Pas_De_Changement_E,
         --  Pas de changement de l'état en cours.
         Commande_E,
         --  On passe d'un état vers l'état commande.
         Insertion_E,
         --  On passe d'un état vers l'état insertion.
         Remplacement_E,
         --  On passe d'un état vers l'état remplacement.
         Visuel_E
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
      (Etat_P.ID_Etat_T, Lettre_P.ID_Touche_T) of Prochain_Etat_T;
   --  La table des transitions d'un état actuel en fonction de
   --  la touche pressée.

end Transition_P;
