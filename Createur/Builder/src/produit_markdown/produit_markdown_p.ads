with Ada.Strings.Wide_Wide_Unbounded;

--  @summary
--  Un produit au format Markdown.
--  @description
--  Un produit au format Markdown.
--  @group Produits
package Produit_Markdown_P is

   package Contenu_R renames Ada.Strings.Wide_Wide_Unbounded;

   type Texte_Markdown_T is tagged private;
   --  Permet de contenir du texte formaté en markdown.

   function Creer_Produit_Markdown
      return Texte_Markdown_T;
   --  Permet de créer un nouveau produit vide.
   --  @return Un markdown vide.

   procedure Ajouter_Texte
      (
         Texte   : in out Texte_Markdown_T;
         Contenu : in     Contenu_R.Unbounded_Wide_Wide_String
      );
   --  Ajoute du texte brut.
   --  @param Texte
   --  Le markdown en cours.
   --  @param Contenu
   --  Le contenu à ajouter.

   procedure Commencer_Titre
      (Texte : in out Texte_Markdown_T);
   --  Ajout d'un début de titre.
   --  @param Texte
   --  Le markdown en cours.

   procedure Finir_Titre
      (Texte : in out Texte_Markdown_T);
   --  Ajout d'une fin de titre.
   --  @param Texte
   --  Le markdown en cours.

   procedure Commencer_Paragraphe
      (Texte : in out Texte_Markdown_T);
   --  Ajout un début de paragraphe.
   --  @param Texte
   --  Le markdown en cours.

   procedure Finir_Paragraphe
      (Texte : in out Texte_Markdown_T);
   --  Ajoute une fin de paragraphe.
   --  @param Texte
   --  Le markdown en cours.

   procedure Rendu
      (Texte : in Texte_Markdown_T);
   --  Affiche le contenu formaté.
   --  @param Texte
   --  Le markdown en cours.

private

   type Texte_Markdown_T is tagged
      record
         Contenu : Contenu_R.Unbounded_Wide_Wide_String;
      end record;

end Produit_Markdown_P;
