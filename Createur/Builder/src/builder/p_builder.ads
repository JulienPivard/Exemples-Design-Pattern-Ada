with Ada.Strings.Wide_Wide_Unbounded;
use  Ada.Strings.Wide_Wide_Unbounded;

package P_Builder is

    --  Le monteur abstrait.
    type T_Monteur is abstract tagged private;

    --  Permet d'ajouter un titre au texte
    procedure Ajouter_Titre
        (Monteur : in out T_Monteur; Texte : in Unbounded_Wide_Wide_String);

    --  Permet d'ajouter un paragraphe au texte
    procedure Ajouter_Paragraphe
        (Monteur : in out T_Monteur; Texte : in Unbounded_Wide_Wide_String);

private

    type T_Monteur is abstract tagged null record;

end P_Builder;
