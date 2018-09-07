with Ada.Strings.Wide_Wide_Unbounded;

package Builder_P is

   package Contenu_P renames Ada.Strings.Wide_Wide_Unbounded;

   --  Le monteur abstrait.
   type T_Monteur is abstract tagged private;

   --  Permet d'ajouter un titre au texte
   procedure Ajouter_Titre
      (
         Monteur : in out T_Monteur;
         Texte : in Contenu_P.Unbounded_Wide_Wide_String
      )
   is null;

   --  Permet d'ajouter un paragraphe au texte
   procedure Ajouter_Paragraphe
      (
         Monteur : in out T_Monteur;
         Texte : in Contenu_P.Unbounded_Wide_Wide_String
      )
   is null;

private

   type T_Monteur is abstract tagged null record;

end Builder_P;
