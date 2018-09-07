with Ada.Text_IO;

with P_Directeur;
with P_Builder.P_Builder_Html;
with P_Produit_Html;
with P_Builder.P_Builder_Markdown;
with P_Produit_Markdown;

procedure Client is

   package Directeur_P        renames P_Directeur;
   package Html_B_P           renames P_Builder.P_Builder_Html;
   package Produit_Html_P     renames P_Produit_Html;
   package Mark_B_P           renames P_Builder.P_Builder_Markdown;
   package Produit_Markdown_P renames P_Produit_Markdown;

   dir  : Directeur_P.T_Directeur;
   monH : Html_B_P.T_Monteur_Html;
   texH : Produit_Html_P.T_Texte_Html;
   monM : Mark_B_P.T_Monteur_Markdown;
   texM : Produit_Markdown_P.T_Texte_Markdown;

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
