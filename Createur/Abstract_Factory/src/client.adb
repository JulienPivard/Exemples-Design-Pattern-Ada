with Ada.Text_IO;

with Executeur_P;
with Fabrique_P.Fabrique_Un_P;
with Fabrique_P.Fabrique_Deux_P;

procedure Client is

   package Fab_Un   renames Fabrique_P.Fabrique_Un_P;
   package Fab_Deux renames Fabrique_P.Fabrique_Deux_P;
   fabrique_1 : Fab_Un.Fab_Conc_Un;
   fabrique_2 : Fab_Deux.Fab_Conc_Deux;

begin

   Ada.Text_IO.New_Line (1);
   Ada.Text_IO.Put_Line ("En markdown : ");
   Executeur_P.Construire (fabrique_1);
   Ada.Text_IO.New_Line (1);
   Ada.Text_IO.Put_Line ("En html : ");
   Executeur_P.Construire (fabrique_2);

end Client;
