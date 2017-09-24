with P_Produit_Html;
use  P_Produit_Html;

package P_Builder.P_Builder_Html is

    --  Un monteur pour du texte formaté en html
    type T_Monteur_Html is new T_Monteur with private;

    --  Permet d'initialiser un texte vide au format html.
    procedure Nouveau_Texte_Html (Monteur : in out T_Monteur_Html);

    --  Permet d'ajouter un titre au texte html
    overriding
    procedure Ajouter_Titre
        (
            Monteur : in out T_Monteur_Html;
            Texte : in Unbounded_Wide_Wide_String
        );

    --  Permet d'ajouter un paragraphe au texte html
    overriding
    procedure Ajouter_Paragraphe
        (
            Monteur : in out T_Monteur_Html;
            Texte : in Unbounded_Wide_Wide_String
        );

    --  Permet de récupérer le texte construit par le monteur.
    function Recuperer_Resultat (Monteur : in T_Monteur_Html)
        return T_Texte_Html;

private

    type T_Monteur_Html is new T_Monteur with
        record
            Texte_En_Construction : T_Texte_Html;
        end record;

end P_Builder.P_Builder_Html;
