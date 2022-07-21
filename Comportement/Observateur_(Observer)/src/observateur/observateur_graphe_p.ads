with Observateur_P;
with Valeurs_P;

--  @summary
--  L'observateur concret qui affiche un graphe.
--  @description
--  L'observateur concret qui affiche un graphe.
--  @group Observateur
package Observateur_Graphe_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Graphe_T is new Observateur_P.Observateur_T with private;
   --  Observateur concret qui affiche un graphe des données.

   overriding
   procedure Mettre_A_Jour
      (
         This : in out Graphe_T;
         Etat : in     Valeurs_P.Table_Valeurs_T
      );
   --  Interface pour que le sujet puisse demander à l'observateur
   --  de se mettre à jour.
   --  @param This
   --  L'observateur.
   --  @param Etat
   --  Le nouvel état du sujet.

   not overriding
   function Creer
      return Graphe_T;
   --  Crée un graphe qui va observer les valeurs.
   --  @return Un graphe de valeurs.

private

   not overriding
   procedure Dessiner
      (This : in out Graphe_T);
   --  Dessine le graphe de valeurs.
   --  @param This
   --  L'observateur.

   type Graphe_T is new Observateur_P.Observateur_T with
      record
         Etat : Valeurs_P.Table_Valeurs_T;
      end record;

   type Table_Caracteres_T is array (Valeurs_P.Indice_T) of Character;

   Caracteres : constant Table_Caracteres_T :=
      Table_Caracteres_T'(1 => '#', 2 => '@', 3 => '"', 4 => '=', 5 => '*');

end Observateur_Graphe_P;
