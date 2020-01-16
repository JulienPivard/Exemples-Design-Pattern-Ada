with Ada.Strings.Wide_Wide_Unbounded;

--  @summary
--  Une abstraction d'un monteur.
--  @description
--  Version abstraite d'un builder général pour un objet de
--  formatage de texte.
--  @group Builder
package Builder_P is

   package Contenu_R renames Ada.Strings.Wide_Wide_Unbounded;

   type Monteur_T is abstract tagged private;
   --  Le monteur abstrait.

   procedure Ajouter_Titre
      (
         Monteur : in out Monteur_T;
         Texte   : in     Contenu_R.Unbounded_Wide_Wide_String
      )
   is null;
   --  Permet d'ajouter un titre au texte.
   --  @param Monteur
   --  Le monteur.
   --  @param Texte
   --  Le texte à ajouter dans l'objet.

   procedure Ajouter_Paragraphe
      (
         Monteur : in out Monteur_T;
         Texte   : in     Contenu_R.Unbounded_Wide_Wide_String
      )
   is null;
   --  Permet d'ajouter un paragraphe au texte.
   --  @param Monteur
   --  Le monteur.
   --  @param Texte
   --  Le texte à ajouter dans l'objet.

private

   type Monteur_T is abstract tagged null record;

end Builder_P;
