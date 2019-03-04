with Ada.Text_IO;

with Directeur_P;
with Builder_P.Builder_Html_P;
with Produit_Html_P;
with Builder_P.Builder_Markdown_P;
with Produit_Markdown_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is

   package Html_B_R           renames Builder_P.Builder_Html_P;
   package Mark_B_R           renames Builder_P.Builder_Markdown_P;

   Dir   : Directeur_P.Directeur_T;
   Mon_H : Html_B_R.Monteur_Html_T;
   Tex_H : Produit_Html_P.Texte_Html_T;
   Mon_M : Mark_B_R.Monteur_Markdown_T;
   Tex_M : Produit_Markdown_P.Texte_Markdown_T;

begin

   Ada.Text_IO.Put_Line ("--------------");

   Dir.Construire (Mon_H);
   Tex_H := Mon_H.Recuperer_Resultat;
   Tex_H.Rendu;

   Ada.Text_IO.Put_Line ("--------------");

   Dir.Construire (Mon_M);
   Tex_M := Mon_M.Recuperer_Resultat;
   Tex_M.Rendu;

   Ada.Text_IO.Put_Line ("--------------");

end Executer;
