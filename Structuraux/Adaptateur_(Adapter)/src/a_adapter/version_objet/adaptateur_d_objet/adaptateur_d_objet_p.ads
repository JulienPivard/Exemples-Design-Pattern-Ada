with Classe_Utilisee_P;

private with Objet_Adapte_P;

--  @summary
--  Un adaptateur d'objet.
--  @description
--  Adapte une instance d'un objet pour la rendre utilisable par
--  l'utilisateur.
--  @group Adaptateur
package Adaptateur_D_Objet_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Adaptateur_T is new Classe_Utilisee_P.Classe_Utilisee_T with private;

   overriding
   procedure Faire
      (This : in out Adaptateur_T);

private

   type Adaptateur_T is new Classe_Utilisee_P.Classe_Utilisee_T with
      record
         Objet : Objet_Adapte_P.Objet_Adapte_T;
      end record;

end Adaptateur_D_Objet_P;
