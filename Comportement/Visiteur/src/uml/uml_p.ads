limited with Visiteur_P;

--  @summary
--  Un ensemble de classes pour l'exemple.
--  @description
--  Cette ensemble de classes représente les type que l'on aura
--  besoin de visiter. Pour chaque type il faut définir
--  l'opération visiter.
--  @group Classe à visiter
package Uml_P is

   type Element_Nomme_T is tagged null record;
   --  La classe mère des objets visitable. Tous autres objets
   --  qui doit pouvoir être visité devra hériter de cette classe.

   procedure Visiter
      (
         This        : in out Element_Nomme_T;
         Le_Visiteur : in out Visiteur_P.Visiteur_T'Class
      );
   --  Le point d'entré pour le visiteur.
   --  @param This
   --  L'objet à visiter.
   --  @param Le_Visiteur
   --  L'instance concrète du visiteur.

   type CClass_T is new Element_Nomme_T with null record;
   --  Un des fils de Element_Nomme.

   overriding
   procedure Visiter
      (
         This        : in out CClass_T;
         Le_Visiteur : in out Visiteur_P.Visiteur_T'Class
      );
   --  Le point d'entré pour le visiteur.
   --  @param This
   --  L'objet à visiter.
   --  @param Le_Visiteur
   --  L'instance concrète du visiteur.

   type PPackage_T is new Element_Nomme_T with null record;
   --  Un des fils de Element_Nomme.

   overriding
   procedure Visiter
      (
         This        : in out PPackage_T;
         Le_Visiteur : in out Visiteur_P.Visiteur_T'Class
      );
   --  Le point d'entré pour le visiteur.
   --  @param This
   --  L'objet à visiter.
   --  @param Le_Visiteur
   --  L'instance concrète du visiteur.

   type Operation_T is new Element_Nomme_T with null record;

   overriding
   procedure Visiter
      (
         This        : in out Operation_T;
         Le_Visiteur : in out Visiteur_P.Visiteur_T'Class
      );
   --  Le point d'entré pour le visiteur.
   --  @param This
   --  L'objet à visiter.
   --  @param Le_Visiteur
   --  L'instance concrète du visiteur.

end Uml_P;
