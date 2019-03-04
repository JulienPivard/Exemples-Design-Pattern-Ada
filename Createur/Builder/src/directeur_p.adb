with Ada.Strings.Wide_Wide_Unbounded;

package body Directeur_P is

   package Text_R renames Ada.Strings.Wide_Wide_Unbounded;

   ---------------------------------------------------------------------------
   procedure Construire
      (
         Directeur : in Directeur_T;
         Monteur : in out Builder_P.Monteur_T'Class
      )
   is
      pragma Unreferenced (Directeur);
      Titre : constant Text_R.Unbounded_Wide_Wide_String :=
         Text_R.To_Unbounded_Wide_Wide_String ("Titre bidon");
      Deuxe : constant Text_R.Unbounded_Wide_Wide_String :=
         Text_R.To_Unbounded_Wide_Wide_String ("Titre section suivante");
      Para1 : constant Text_R.Unbounded_Wide_Wide_String :=
         Text_R.To_Unbounded_Wide_Wide_String ("Et un bon gros pavé de texte"
         & " qui vas être bien gros ma gueule.");
      Para2 : constant Text_R.Unbounded_Wide_Wide_String :=
         Text_R.To_Unbounded_Wide_Wide_String ("Un petit deuxième paragraphe");
      Para3 : constant Text_R.Unbounded_Wide_Wide_String :=
         Text_R.To_Unbounded_Wide_Wide_String ("Et le troisième paragraphe "
         & "Qui vas être un peu plus long que le reste.");
   begin
      Monteur.Ajouter_Titre (Titre);
      Monteur.Ajouter_Paragraphe (Para1);
      Monteur.Ajouter_Paragraphe (Para2);
      Monteur.Ajouter_Titre (Deuxe);
      Monteur.Ajouter_Paragraphe (Para3);
   end Construire;

end Directeur_P;
