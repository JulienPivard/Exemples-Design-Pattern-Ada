with Produit_Markdown_P;

package Builder_P.Builder_Markdown_P is

   --  Un monteur pour du texte formaté en markdown.
   type Monteur_Markdown_T is new Monteur_T with private;

   --  Permet d'initialiser un texte vide au format markdown.
   procedure Nouveau_Texte_Markdown (Monteur : in out Monteur_Markdown_T);

   --  Permet d'ajouter un titre au texte markdown
   overriding
   procedure Ajouter_Titre
   (
      Monteur : in out Monteur_Markdown_T;
      Texte : in Contenu_P.Unbounded_Wide_Wide_String
   );

   --  Permet d'ajouter un paragraphe au texte markdown
   overriding
   procedure Ajouter_Paragraphe
   (
      Monteur : in out Monteur_Markdown_T;
      Texte : in Contenu_P.Unbounded_Wide_Wide_String
   );

   --  Permet de récupérer le texte construit par le monteur.
   function Recuperer_Resultat
      (Monteur : in Monteur_Markdown_T)
      return Produit_Markdown_P.Texte_Markdown_T;

private

   type Monteur_Markdown_T is new Monteur_T with
      record
         Texte_En_Construction : Produit_Markdown_P.Texte_Markdown_T;
      end record;

end Builder_P.Builder_Markdown_P;
