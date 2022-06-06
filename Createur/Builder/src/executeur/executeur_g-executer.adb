with Ada.Text_IO;

with Directeur_P;
with Builder_P.Html_P;
with Produit_Html_P;
with Builder_P.Markdown_P;
with Produit_Markdown_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   package Html_B_R  renames Builder_P.Html_P;
   package Mark_B_R  renames Builder_P.Markdown_P;

   Dir          : Directeur_P.Directeur_T;
   Monteur_Html : Html_B_R.Monteur_Html_T;
   Texte_Html   : Produit_Html_P.Texte_Html_T;
   Monteur_Mark : Mark_B_R.Monteur_Markdown_T;
   Texte_Mark    : Produit_Markdown_P.Texte_Markdown_T;
begin
   Ada.Text_IO.Put_Line (Item => "--------------");

   Dir.Construire (Monteur => Monteur_Html);
   Texte_Html := Monteur_Html.Recuperer_Resultat;
   Texte_Html.Rendu;

   Ada.Text_IO.Put_Line (Item => "--------------");

   Dir.Construire (Monteur => Monteur_Mark);
   Texte_Mark := Monteur_Mark.Recuperer_Resultat;
   Texte_Mark.Rendu;

   Ada.Text_IO.Put_Line (Item => "--------------");
end Executer;
