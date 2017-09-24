package body P_Builder.P_Builder_Markdown is

    ---------------------------------------------------------------------------
    procedure Nouveau_Texte_Markdown
        (Monteur : in out T_Monteur_Markdown)
    is
    begin
        Monteur.Texte_En_Construction :=
            P_Produit_Markdown.Creer_Produit_Markdown;
    end Nouveau_Texte_Markdown;

    ---------------------------------------------------------------------------
    overriding
    procedure Ajouter_Titre
        (
            Monteur : in out T_Monteur_Markdown;
            Texte : in Unbounded_Wide_Wide_String
        )
    is
    begin
        Monteur.Texte_En_Construction.Commencer_Titre;
        Monteur.Texte_En_Construction.Ajouter_Texte (Texte);
        Monteur.Texte_En_Construction.Finir_Titre;
    end Ajouter_Titre;

    ---------------------------------------------------------------------------
    overriding
    procedure Ajouter_Paragraphe
        (
            Monteur : in out T_Monteur_Markdown;
            Texte : in Unbounded_Wide_Wide_String
        )
    is
    begin
        Monteur.Texte_En_Construction.Commencer_Paragraphe;
        Monteur.Texte_En_Construction.Ajouter_Texte (Texte);
        Monteur.Texte_En_Construction.Finir_Paragraphe;
    end Ajouter_Paragraphe;

    ---------------------------------------------------------------------------
    function Recuperer_Resultat (Monteur : in T_Monteur_Markdown)
        return T_Texte_Markdown
    is
    begin
        return Monteur.Texte_En_Construction;
    end Recuperer_Resultat;

end P_Builder.P_Builder_Markdown;
