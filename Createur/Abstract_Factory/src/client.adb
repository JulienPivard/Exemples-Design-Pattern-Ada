with Ada.Text_IO;

with Executeur_P;
with Fabrique_P.Fabrique_Un_P;
with Fabrique_P.Fabrique_Deux_P;

procedure Client is

   package Fab_Un_P   renames Fabrique_P.Fabrique_Un_P;
   package Fab_Deux_P renames Fabrique_P.Fabrique_Deux_P;
   fabrique_1 : Fab_Un_P.Fabrique_Un_T;
   fabrique_2 : Fab_Deux_P.Fabrique_Deux_T;

begin

   Ada.Text_IO.New_Line (1);
   Ada.Text_IO.Put_Line ("En markdown : ");
   Executeur_P.Construire (fabrique_1);
   Ada.Text_IO.New_Line (1);
   Ada.Text_IO.Put_Line ("En html : ");
   Executeur_P.Construire (fabrique_2);

end Client;
