with Ada.Text_IO;

with Directeur_P;
with Builder_P.Builder_Html_P;
with Produit_Html_P;
with Builder_P.Builder_Markdown_P;
with Produit_Markdown_P;

procedure Client is

   package Html_B_P           renames Builder_P.Builder_Html_P;
   package Mark_B_P           renames Builder_P.Builder_Markdown_P;

   dir  : Directeur_P.Directeur_T;
   monH : Html_B_P.Monteur_Html_T;
   texH : Produit_Html_P.Texte_Html_T;
   monM : Mark_B_P.Monteur_Markdown_T;
   texM : Produit_Markdown_P.Texte_Markdown_T;

begin

   --  Mettez votre code ici
   Ada.Text_IO.Put_Line ("--------------");

   dir.Construire (monH);
   texH := monH.Recuperer_Resultat;
   texH.Rendu;

   Ada.Text_IO.Put_Line ("--------------");

   dir.Construire (monM);
   texM := monM.Recuperer_Resultat;
   texM.Rendu;

   Ada.Text_IO.Put_Line ("--------------");

end Client;
