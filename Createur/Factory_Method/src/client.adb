with Ada.Text_IO;

with Produit_P;
with Fabrique_P.Concret_P;
use  Fabrique_P.Concret_P;

procedure Client is

   f : Fabrique_P.Concret_P.T_Fab_Conc;
   p : Produit_P.T_Pointeur_Prod;

begin

   Ada.Text_IO.New_Line (1);

   p := f.Fabriquer;
   p.all.Creer_Produit;
   p.all.Afficher;

end Client;
