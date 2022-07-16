with Observateur_P;
with Valeurs_P;

--  @summary
--  L'observateur concret qui affiche les valeurs chiffré.
--  @description
--  L'observateur concret qui affiche les valeurs chiffré.
--  @group Observateur
package Observateur_Chiffre_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Chiffre_T is new Observateur_P.Observateur_T with private;

   overriding
   procedure Mettre_A_Jour
      (
         This : in out Chiffre_T;
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
      return Chiffre_T;
   --  Crée un graphe qui va observer les valeurs.
   --  @return Un graphe de valeurs.

private

   not overriding
   procedure Dessiner
      (This : in out Chiffre_T);
   --  Dessine le graphe de valeurs.
   --  @param This
   --  L'observateur.

   type Chiffre_T is new Observateur_P.Observateur_T with
      record
         Etat : Valeurs_P.Table_Valeurs_T;
      end record;

end Observateur_Chiffre_P;
