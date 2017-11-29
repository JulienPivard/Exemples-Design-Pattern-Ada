package body P_Builder.P_Builder_Html is

   ---------------------------------------------------------------------------
   procedure Nouveau_Texte_Html
      (Monteur : in out T_Monteur_Html)
   is
   begin
      Monteur.Texte_En_Construction := P_Produit_Html.Creer_Produit_Html;
   end Nouveau_Texte_Html;

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter_Titre
      (
         Monteur : in out T_Monteur_Html;
         Texte : in Unbounded_Wide_Wide_String
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
         Monteur : in out T_Monteur_Html;
         Texte : in Unbounded_Wide_Wide_String
      )
   is
   begin
      Monteur.Texte_En_Construction.Commencer_Paragraphe;
      Monteur.Texte_En_Construction.Ajouter_Texte (Texte);
      Monteur.Texte_En_Construction.Finir_Paragraphe;
   end Ajouter_Paragraphe;

   ---------------------------------------------------------------------------
   function Recuperer_Resultat (Monteur : in T_Monteur_Html)
      return T_Texte_Html
   is
   begin
      return Monteur.Texte_En_Construction;
   end Recuperer_Resultat;

end P_Builder.P_Builder_Html;
