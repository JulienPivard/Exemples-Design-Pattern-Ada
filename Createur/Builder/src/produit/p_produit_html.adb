with Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO;
use  Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO;

package body P_Produit_Html is

    ---------------------------------------------------------------------------
    function Creer_Produit_Html return T_Texte_Html is
        T : T_Texte_Html;
    begin
        T.Contenu := To_Unbounded_Wide_Wide_String ("");
        return T;
    end Creer_Produit_Html;

    ---------------------------------------------------------------------------
    procedure Ajouter_Texte
        (Texte : in out T_Texte_Html; Contenu : in Unbounded_Wide_Wide_String)
    is
    begin
        Append (Texte.Contenu, Contenu);
    end Ajouter_Texte;

    ---------------------------------------------------------------------------
    procedure Commencer_Titre (Texte : in out T_Texte_Html) is
        balise_debut : constant Unbounded_Wide_Wide_String :=
            To_Unbounded_Wide_Wide_String ("<h1>");
    begin
        Append (Texte.Contenu, balise_debut);
    end Commencer_Titre;

    ---------------------------------------------------------------------------
    procedure Finir_Titre (Texte : in out T_Texte_Html) is
        balise_fin : constant Unbounded_Wide_Wide_String :=
            To_Unbounded_Wide_Wide_String ("</h1>");
    begin
        Append (Texte.Contenu, balise_fin);
        Append (Texte.Contenu, Wide_Wide_Character'Val (10));
    end Finir_Titre;

    ---------------------------------------------------------------------------
    procedure Commencer_Paragraphe (Texte : in out T_Texte_Html) is
        balise_debut : constant Unbounded_Wide_Wide_String :=
            To_Unbounded_Wide_Wide_String ("<p>");
    begin
        Append (Texte.Contenu, balise_debut);
    end Commencer_Paragraphe;

    ---------------------------------------------------------------------------
    procedure Finir_Paragraphe (Texte : in out T_Texte_Html) is
        balise_fin : constant Unbounded_Wide_Wide_String :=
            To_Unbounded_Wide_Wide_String ("</p>");
    begin
        Append (Texte.Contenu, balise_fin);
        Append (Texte.Contenu, Wide_Wide_Character'Val (10));
    end Finir_Paragraphe;

    ---------------------------------------------------------------------------
    procedure Rendu (Texte : in T_Texte_Html) is
    begin
        Put_Line (Texte.Contenu);
    end Rendu;

end P_Produit_Html;
