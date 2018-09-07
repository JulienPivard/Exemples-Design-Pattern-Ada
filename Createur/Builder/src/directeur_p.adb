with Ada.Strings.Wide_Wide_Unbounded;

package body Directeur_P is

   package Text_P renames Ada.Strings.Wide_Wide_Unbounded;

   ---------------------------------------------------------------------------
   procedure Construire
      (
         Directeur : in Directeur_T;
         Monteur : in out Builder_P.Monteur_T'Class
      )
   is
      pragma Unreferenced (Directeur);
      titre : constant Text_P.Unbounded_Wide_Wide_String :=
         Text_P.To_Unbounded_Wide_Wide_String ("Titre bidon");
      deuxe : constant Text_P.Unbounded_Wide_Wide_String :=
         Text_P.To_Unbounded_Wide_Wide_String ("Titre section suivante");
      para1 : constant Text_P.Unbounded_Wide_Wide_String :=
         Text_P.To_Unbounded_Wide_Wide_String ("Et un bon gros pavé de texte"
         & " qui vas être bien gros ma gueule.");
      para2 : constant Text_P.Unbounded_Wide_Wide_String :=
         Text_P.To_Unbounded_Wide_Wide_String ("Un petit deuxième paragraphe");
      para3 : constant Text_P.Unbounded_Wide_Wide_String :=
         Text_P.To_Unbounded_Wide_Wide_String ("Et le troisième paragraphe "
         & "Qui vas être un peu plus long que le reste.");
   begin
      Monteur.Ajouter_Titre (titre);
      Monteur.Ajouter_Paragraphe (para1);
      Monteur.Ajouter_Paragraphe (para2);
      Monteur.Ajouter_Titre (deuxe);
      Monteur.Ajouter_Paragraphe (para3);
   end Construire;

end Directeur_P;
