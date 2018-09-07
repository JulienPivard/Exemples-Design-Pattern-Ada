with Ada.Text_IO;

with P_Produit;
with P_Fabrique.Concret;
use  P_Fabrique.Concret;

procedure Client is

   f : P_Fabrique.Concret.T_Fab_Conc;
   p : P_Produit.T_Pointeur_Prod;

begin

   Ada.Text_IO.New_Line (1);

   p := f.Fabriquer;
   p.all.Creer_Produit;
   p.all.Afficher;

end Client;
