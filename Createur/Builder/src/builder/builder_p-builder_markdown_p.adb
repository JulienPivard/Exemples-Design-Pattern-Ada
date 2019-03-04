package body Builder_P.Builder_Markdown_P is

   ---------------------------------------------------------------------------
   procedure Nouveau_Texte_Markdown
      (Monteur : in out Monteur_Markdown_T)
   is
   begin
      Monteur.Texte_En_Construction :=
         Produit_Markdown_P.Creer_Produit_Markdown;
   end Nouveau_Texte_Markdown;

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter_Titre
      (
         Monteur : in out Monteur_Markdown_T;
         Texte : in Contenu_R.Unbounded_Wide_Wide_String
      )
   is
   begin
      Monteur.Texte_En_Construction.Commencer_Titre;
      Monteur.Texte_En_Construction.Ajouter_Texte (Texte);
      Monteur.Texte_En_Construction.Finir_Titre;
   end Ajouter_Titre;

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter_Paragraphe
      (
         Monteur : in out Monteur_Markdown_T;
         Texte : in Contenu_R.Unbounded_Wide_Wide_String
      )
   is
   begin
      Monteur.Texte_En_Construction.Commencer_Paragraphe;
      Monteur.Texte_En_Construction.Ajouter_Texte (Texte);
      Monteur.Texte_En_Construction.Finir_Paragraphe;
   end Ajouter_Paragraphe;

   ---------------------------------------------------------------------------
   function Recuperer_Resultat
      (Monteur : in Monteur_Markdown_T)
      return Produit_Markdown_P.Texte_Markdown_T
   is
   begin
      return Monteur.Texte_En_Construction;
   end Recuperer_Resultat;

end Builder_P.Builder_Markdown_P;
