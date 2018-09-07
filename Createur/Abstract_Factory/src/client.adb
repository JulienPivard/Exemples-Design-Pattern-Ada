with Ada.Text_IO;

with Executeur;
with Fabrique_Abstraite.Fabrique_Concrete_Un;
with Fabrique_Abstraite.Fabrique_Concrete_Deux;

procedure Client is

   package Fab_Un   renames Fabrique_Abstraite.Fabrique_Concrete_Un;
   package Fab_Deux renames Fabrique_Abstraite.Fabrique_Concrete_Deux;
   fabrique_1 : Fab_Un.Fab_Conc_Un;
   fabrique_2 : Fab_Deux.Fab_Conc_Deux;

begin

   Ada.Text_IO.New_Line (1);
   Ada.Text_IO.Put_Line ("En markdown : ");
   Executeur.Construire (fabrique_1);
   Ada.Text_IO.New_Line (1);
   Ada.Text_IO.Put_Line ("En html : ");
   Executeur.Construire (fabrique_2);

end Client;
