package body Directeur_P is

   ---------------------------------------------------------------------------
   procedure Construire
      (
         Directeur : in     Directeur_T;
         Monteur   : in out Builder_P.Monteur_T'Class
      )
   is
      pragma Unreferenced (Directeur);

      Titre : constant Wide_Wide_String := "Titre bidon";

      Deuxe : constant Wide_Wide_String := "Titre section suivante";
      Para1 : constant Wide_Wide_String := "Et un bon gros pavé de " &
         "texte qui vas être bien gros ma gueule.";

      Para2 : constant Wide_Wide_String := "Un petit deuxième paragraphe";
      Para3 : constant Wide_Wide_String := "Et le troisième paragraphe " &
         "Qui vas être un peu plus long que le reste.";
   begin
      Monteur.Ajouter_Titre      (Texte => Titre);
      Monteur.Ajouter_Paragraphe (Texte => Para1);
      Monteur.Ajouter_Paragraphe (Texte => Para2);
      Monteur.Ajouter_Titre      (Texte => Deuxe);
      Monteur.Ajouter_Paragraphe (Texte => Para3);
   end Construire;
   ---------------------------------------------------------------------------

end Directeur_P;
