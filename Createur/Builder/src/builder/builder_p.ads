with Ada.Strings.Wide_Wide_Unbounded;

package Builder_P is

   package Contenu_R renames Ada.Strings.Wide_Wide_Unbounded;

   --  Le monteur abstrait.
   type Monteur_T is abstract tagged private;

   --  Permet d'ajouter un titre au texte
   procedure Ajouter_Titre
      (
         Monteur : in out Monteur_T;
         Texte : in Contenu_R.Unbounded_Wide_Wide_String
      )
   is null;

   --  Permet d'ajouter un paragraphe au texte
   procedure Ajouter_Paragraphe
      (
         Monteur : in out Monteur_T;
         Texte : in Contenu_R.Unbounded_Wide_Wide_String
      )
   is null;

private

   type Monteur_T is abstract tagged null record;

end Builder_P;
