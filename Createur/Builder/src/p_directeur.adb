with Ada.Strings.Wide_Wide_Unbounded;
use  Ada.Strings.Wide_Wide_Unbounded;

package body P_Directeur is

    ---------------------------------------------------------------------------
    procedure Construire
        (
            Directeur : in T_Directeur;
            Monteur : in out P_Builder.T_Monteur'Class
        )
    is
        pragma Unreferenced (Directeur);
        titre : constant Unbounded_Wide_Wide_String :=
            To_Unbounded_Wide_Wide_String ("Titre bidon");
        deuxe : constant Unbounded_Wide_Wide_String :=
            To_Unbounded_Wide_Wide_String ("Titre section suivante");
        para1 : constant Unbounded_Wide_Wide_String :=
            To_Unbounded_Wide_Wide_String ("Et un bon gros pavé de texte"
            & " qui vas être bien gros ma gueule.");
        para2 : constant Unbounded_Wide_Wide_String :=
            To_Unbounded_Wide_Wide_String ("Un petit deuxième paragraphe");
        para3 : constant Unbounded_Wide_Wide_String :=
            To_Unbounded_Wide_Wide_String ("Et le troisième paragraphe "
            & "Qui vas être un peu plus long que le reste.");
    begin
        Monteur.Ajouter_Titre (titre);
        Monteur.Ajouter_Paragraphe (para1);
        Monteur.Ajouter_Paragraphe (para2);
        Monteur.Ajouter_Titre (deuxe);
        Monteur.Ajouter_Paragraphe (para3);
    end Construire;

end P_Directeur;
