with Uml_P;

--  @summary
--  Le visiteur qui va se charger d'aller visiter la cible.
--  @description
--  Pour chaque type il faut définir une opération spécifique
--  pour le visiteur.
--  @group Visiteur
package Visiteur_P is

   type Visiteur_T is abstract tagged null record;
   --  Un visiteur abstrait. Les classes qui en hérite pourront
   --  faire des opérations spécifique sur les objets visité.
   --  Par exemple un visiteur pourra faire de la génération de code
   --  tandis qu'un autre pourra servir à vérifier des propriété.

   procedure Visiter_Element_Nomme
      (
         This : in out Visiteur_T;
         Obj  : in out Uml_P.Element_Nomme_T'Class
      );
   --  Permet de visiter l'élément parent.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

   procedure Visiter_CClass
      (
         This : in out Visiteur_T;
         Obj  : in out Uml_P.CClass_T'Class
      );
   --  Permet de visiter un des fils de la classe Element_Nomme.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

   procedure Visiter_PPackage
      (
         This : in out Visiteur_T;
         Obj  : in out Uml_P.PPackage_T'Class
      );
   --  Permet de visiter un des fils de la classe Element_Nomme.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

   procedure Visiter_Operation
      (
         This : in out Visiteur_T;
         Obj  : in out Uml_P.Operation_T'Class
      );
   --  Permet de visiter un des fils de la classe Element_Nomme.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

end Visiteur_P;
