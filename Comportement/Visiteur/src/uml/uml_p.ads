limited with Visiteur_P;

--  @summary
--  Un ensemble de classes pour l'exemple.
--  @description
--  Cette ensemble de classes représente les type que l'on aura
--  besoin de visiter. Pour chaque type il faut définir
--  l'opération visiter.
--  @group Classe à visiter
package Uml_P is

   type Element_Nomme_T is tagged private;
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

   type Code_Class_T is new Element_Nomme_T with private;
   --  Un des fils de Element_Nomme.

   overriding
   procedure Visiter
      (
         This        : in out Code_Class_T;
         Le_Visiteur : in out Visiteur_P.Visiteur_T'Class
      );
   --  Le point d'entré pour le visiteur.
   --  @param This
   --  L'objet à visiter.
   --  @param Le_Visiteur
   --  L'instance concrète du visiteur.

   type Verif_Package_T is new Element_Nomme_T with private;
   --  Un des fils de Element_Nomme.

   overriding
   procedure Visiter
      (
         This        : in out Verif_Package_T;
         Le_Visiteur : in out Visiteur_P.Visiteur_T'Class
      );
   --  Le point d'entré pour le visiteur.
   --  @param This
   --  L'objet à visiter.
   --  @param Le_Visiteur
   --  L'instance concrète du visiteur.

   type Operation_T is new Element_Nomme_T with private;
   --  Un des fils de Element_Nomme.

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

private

   type Element_Nomme_T is tagged null record;

   type Code_Class_T is new Element_Nomme_T with null record;

   type Verif_Package_T is new Element_Nomme_T with null record;

   type Operation_T is new Element_Nomme_T with null record;

end Uml_P;
