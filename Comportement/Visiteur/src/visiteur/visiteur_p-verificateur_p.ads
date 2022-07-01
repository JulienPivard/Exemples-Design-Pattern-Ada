--  @summary
--  Un visiteur concret.
--  @description
--  Un visiteur concret.
--  @group Visiteur
package Visiteur_P.Verificateur_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Verificateur_T is new Visiteur_P.Visiteur_T with private;

   --------------------------
   overriding
   procedure Visiter_Verif_Package
      (
         This : in out Verificateur_T;
         Obj  : in out Uml_P.Verif_Package_T'Class
      );
   --  Permet de visiter.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

   --------------------------
   overriding
   procedure Visiter_Operation
      (
         This : in out Verificateur_T;
         Obj  : in out Uml_P.Operation_T'Class
      );
   --  Permet de visiter.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

private

   type Verificateur_T is new Visiteur_P.Visiteur_T with null record;

end Visiteur_P.Verificateur_P;
