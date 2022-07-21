with Produit_Markdown_P;

--  @summary
--  Un monteur de fichier markdown.
--  @description
--  Un monteur qui construit au format markdown.
--  @group Builder Markdown
package Builder_P.Markdown_P is

   type Monteur_Markdown_T is new Monteur_T with private;
   --  Un monteur pour du texte formaté en markdown.

   procedure Nouveau_Texte_Markdown
      (Monteur : in out Monteur_Markdown_T);
   --  Permet d'initialiser un texte vide au format markdown.
   --  @param Monteur
   --  Le monteur.

   overriding
   procedure Ajouter_Titre
      (
         Monteur : in out Monteur_Markdown_T;
         Texte   : in     Wide_Wide_String
      );
   --  Permet d'ajouter un titre au texte markdown.
   --  @param Monteur
   --  Le monteur.
   --  @param Texte
   --  Le texte à ajouter dans l'objet.

   overriding
   procedure Ajouter_Paragraphe
      (
         Monteur : in out Monteur_Markdown_T;
         Texte   : in     Wide_Wide_String
      );
   --  Permet d'ajouter un paragraphe au texte markdown.
   --  @param Monteur
   --  Le monteur.
   --  @param Texte
   --  Le texte à ajouter dans l'objet.

   function Recuperer_Resultat
      (Monteur : in Monteur_Markdown_T)
      return Produit_Markdown_P.Texte_Markdown_T;
   --  Permet de récupérer le texte construit par le monteur.
   --  @param Monteur
   --  Le monteur.
   --  @return Le markdown formaté.

private

   type Monteur_Markdown_T is new Monteur_T with
      record
         Texte_En_Construction : Produit_Markdown_P.Texte_Markdown_T;
      end record;

end Builder_P.Markdown_P;
