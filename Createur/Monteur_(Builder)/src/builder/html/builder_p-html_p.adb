package body Builder_P.Html_P is

   ---------------------------------------------------------------------------
   procedure Nouveau_Texte_Html
      (Monteur : in out Monteur_Html_T)
   is
   begin
      Monteur.Texte_En_Construction := Produit_Html_P.Creer_Produit_Html;
   end Nouveau_Texte_Html;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter_Titre
      (
         Monteur : in out Monteur_Html_T;
         Texte   : in     Wide_Wide_String
      )
   is
   begin
      Monteur.Texte_En_Construction.Commencer_Titre;
      Monteur.Texte_En_Construction.Ajouter_Texte (Contenu => Texte);
      Monteur.Texte_En_Construction.Finir_Titre;
   end Ajouter_Titre;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter_Paragraphe
      (
         Monteur : in out Monteur_Html_T;
         Texte   : in     Wide_Wide_String
      )
   is
   begin
      Monteur.Texte_En_Construction.Commencer_Paragraphe;
      Monteur.Texte_En_Construction.Ajouter_Texte (Contenu => Texte);
      Monteur.Texte_En_Construction.Finir_Paragraphe;
   end Ajouter_Paragraphe;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Recuperer_Resultat
      (Monteur : in     Monteur_Html_T)
      return Produit_Html_P.Texte_Html_T
   is
   begin
      return Monteur.Texte_En_Construction;
   end Recuperer_Resultat;
   ---------------------------------------------------------------------------

end Builder_P.Html_P;
