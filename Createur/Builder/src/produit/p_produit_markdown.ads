with Ada.Strings.Wide_Wide_Unbounded;
use  Ada.Strings.Wide_Wide_Unbounded;

package P_Produit_Markdown is

    --  Permet de contenir du texte formaté en markdown.
    type T_Texte_Markdown is tagged private;

    --  Permet de créer un nouveau produit vide.
    function Creer_Produit_Markdown return T_Texte_Markdown;

    --  Ajoute du texte brut.
    procedure Ajouter_Texte
        (
            Texte : in out T_Texte_Markdown;
            Contenu : in Unbounded_Wide_Wide_String
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
            Contenu : Unbounded_Wide_Wide_String;
        end record;

end P_Produit_Markdown;
