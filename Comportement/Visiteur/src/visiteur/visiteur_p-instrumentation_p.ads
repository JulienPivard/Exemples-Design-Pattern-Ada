--  @summary
--  Un visiteur concret.
--  @description
--  Un visiteur concret.
--  @group Visiteur
package Visiteur_P.Instrumentation_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Instrumentation_T is new Visiteur_P.Visiteur_T with private;

   --------------------------
   overriding
   procedure Visiter_Element_Nomme
      (
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Element_Nomme_T'Class
      );
   --  Permet de visiter l'élément parent.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

   --------------------------
   overriding
   procedure Visiter_Code_Class
      (
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Code_Class_T'Class
      );
   --  Permet de visiter un des fils de la classe Element_Nomme.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

   --------------------------
   overriding
   procedure Visiter_Verif_Package
      (
         This : in out Instrumentation_T;
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
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Operation_T'Class
      );
   --  Permet de visiter.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

   --------------------------
   procedure Afficher
      (This : in     Instrumentation_T);
   --  Affiche le résultat du visiteur.
   --  @param This
   --  Le visiteur.

private

   type Nb_Elements_T   is range 0 .. 1_000;
   type Nb_Classes_T    is range 0 .. 1_000;
   type Nb_Packages_T   is range 0 .. 1_000;
   type Nb_Operations_T is range 0 .. 1_000;

   type Instrumentation_T is new Visiteur_P.Visiteur_T with
      record
         Nb_Elements   : Nb_Elements_T   := Nb_Elements_T'First;
         Nb_Classes    : Nb_Classes_T    := Nb_Classes_T'First;
         Nb_Packages   : Nb_Packages_T   := Nb_Packages_T'First;
         Nb_Operations : Nb_Operations_T := Nb_Operations_T'First;
      end record;

end Visiteur_P.Instrumentation_P;
