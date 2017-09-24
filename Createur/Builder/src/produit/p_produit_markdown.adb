with Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO;
use  Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO;

package body P_Produit_Markdown is

    ---------------------------------------------------------------------------
    function Creer_Produit_Markdown return T_Texte_Markdown is
        T : T_Texte_Markdown;
    begin
        T.Contenu := To_Unbounded_Wide_Wide_String ("");
        return T;
    end Creer_Produit_Markdown;

    ---------------------------------------------------------------------------
    procedure Ajouter_Texte
        (
            Texte : in out T_Texte_Markdown;
            Contenu : in Unbounded_Wide_Wide_String
        )
    is
    begin
        Append (Texte.Contenu, Contenu);
    end Ajouter_Texte;

    ---------------------------------------------------------------------------
    procedure Commencer_Titre (Texte : in out T_Texte_Markdown) is
    begin
        Append (Texte.Contenu, "# ");
    end Commencer_Titre;

    ---------------------------------------------------------------------------
    procedure Finir_Titre (Texte : in out T_Texte_Markdown) is
    begin
        Append (Texte.Contenu, Wide_Wide_Character'Val (10));
        Append (Texte.Contenu, Wide_Wide_Character'Val (10));
    end Finir_Titre;

    ---------------------------------------------------------------------------
    procedure Commencer_Paragraphe (Texte : in out T_Texte_Markdown) is
        pragma Unreferenced (Texte);
    begin
        null;
    end Commencer_Paragraphe;

    ---------------------------------------------------------------------------
    procedure Finir_Paragraphe (Texte : in out T_Texte_Markdown) is
    begin
        Append (Texte.Contenu, Wide_Wide_Character'Val (10));
        Append (Texte.Contenu, Wide_Wide_Character'Val (10));
    end Finir_Paragraphe;

    procedure Rendu (Texte : in T_Texte_Markdown) is
    begin
        Put_Line (Texte.Contenu);
    end Rendu;

end P_Produit_Markdown;
