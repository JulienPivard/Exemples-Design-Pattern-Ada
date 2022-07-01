--  @summary
--  Un visiteur concret.
--  @description
--  Un visiteur concret.
--  @group Visiteur
package Visiteur_P.Code_Generateur_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Code_Generateur_T is new Visiteur_P.Visiteur_T with private;
   --  Descendant d'un visiteur.

   ------------------------
   overriding
   procedure Visiter_Code_Class
      (
         This : in out Code_Generateur_T;
         Obj  : in out Uml_P.Code_Class_T'Class
      );
   --  Permet de visiter.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

private

   type Code_Generateur_T is new Visiteur_P.Visiteur_T with null record;

end Visiteur_P.Code_Generateur_P;
