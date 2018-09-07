with Ada.Strings.Wide_Wide_Unbounded;

package Produit_Markdown_P is

   package Contenu_P renames Ada.Strings.Wide_Wide_Unbounded;

   --  Permet de contenir du texte formaté en markdown.
   type T_Texte_Markdown is tagged private;

   --  Permet de créer un nouveau produit vide.
   function Creer_Produit_Markdown return T_Texte_Markdown;

   --  Ajoute du texte brut.
   procedure Ajouter_Texte
   (
      Texte : in out T_Texte_Markdown;
      Contenu : in Contenu_P.Unbounded_Wide_Wide_String
   );

   --  Ajout d'un début de titre.
   procedure Commencer_Titre (Texte : in out T_Texte_Markdown);

   --  Ajout d'une fin de titre.
   procedure Finir_Titre (Texte : in out T_Texte_Markdown);

   --  Ajout un début de paragraphe.
   procedure Commencer_Paragraphe (Texte : in out T_Texte_Markdown);

   --  Ajoute une fin de paragraphe.
   procedure Finir_Paragraphe (Texte : in out T_Texte_Markdown);

   --  Affiche le contenu formaté.
   procedure Rendu (Texte : in T_Texte_Markdown);

private

   type T_Texte_Markdown is tagged
      record
         Contenu : Contenu_P.Unbounded_Wide_Wide_String;
      end record;

end Produit_Markdown_P;
