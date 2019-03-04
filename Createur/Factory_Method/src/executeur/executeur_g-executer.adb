with Ada.Text_IO;

with Produit_P;
with Fabrique_P.Concret_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is

   f : Fabrique_P.Concret_P.Concret_T;
   p : Produit_P.Produit_T'Class := f.Fabriquer;

begin

   Ada.Text_IO.New_Line (1);

   p.Creer_Produit;
   p.Afficher;

end Executer;
