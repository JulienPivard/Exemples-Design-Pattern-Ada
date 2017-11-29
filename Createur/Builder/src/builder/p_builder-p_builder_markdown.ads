with P_Produit_Markdown;
use  P_Produit_Markdown;

package P_Builder.P_Builder_Markdown is

   --  Un monteur pour du texte formaté en markdown.
   type T_Monteur_Markdown is new T_Monteur with private;

   --  Permet d'initialiser un texte vide au format markdown.
   procedure Nouveau_Texte_Markdown (Monteur : in out T_Monteur_Markdown);

   --  Permet d'ajouter un titre au texte markdown
   overriding
   procedure Ajouter_Titre
   (
      Monteur : in out T_Monteur_Markdown;
      Texte : in Unbounded_Wide_Wide_String
   );

   --  Permet d'ajouter un paragraphe au texte markdown
   overriding
   procedure Ajouter_Paragraphe
   (
      Monteur : in out T_Monteur_Markdown;
      Texte : in Unbounded_Wide_Wide_String
   );

   --  Permet de récupérer le texte construit par le monteur.
   function Recuperer_Resultat (Monteur : in T_Monteur_Markdown)
      return T_Texte_Markdown;

private

   type T_Monteur_Markdown is new T_Monteur with
      record
         Texte_En_Construction : T_Texte_Markdown;
      end record;

end P_Builder.P_Builder_Markdown;
