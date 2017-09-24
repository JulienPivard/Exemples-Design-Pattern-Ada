with Ada.Text_IO;
with Ada.Wide_Wide_Text_IO; use Ada.Wide_Wide_Text_IO;

with Ada.Command_Line;
with Ada.Directories;

with Executeur;
with Fabrique_Abstraite.Fabrique_Concrete_Un;
with Fabrique_Abstraite.Fabrique_Concrete_Deux;

use  Fabrique_Abstraite.Fabrique_Concrete_Un;
use  Fabrique_Abstraite.Fabrique_Concrete_Deux;

procedure Client is

    Nb_Arguments : constant Natural := Ada.Command_Line.Argument_Count;
    fabrique_1 : constant access Fab_Conc_Un := new Fab_Conc_Un;
    fabrique_2 : constant access Fab_Conc_Deux := new Fab_Conc_Deux;

    procedure Afficher_Aide;

    procedure Afficher_Aide is
    begin
        Put_Line (Standard_Error, "Utilisation du programme :");
        Ada.Text_IO.Put
            (
                Ada.Text_IO.Standard_Error,
                Ada.Directories.Base_Name (Ada.Command_Line.Command_Name)
            );
        Put (Standard_Error, " [arguments]");
        Put_Line (Standard_Error, "");
    end Afficher_Aide;

begin

    if Nb_Arguments = 1 then

        Afficher_Aide;
        Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
        return;

    elsif Nb_Arguments > 1 then

        Afficher_Aide;
        Put (Standard_Error, "Trop d'arguments. ");
        Put_Line (Standard_Error, "Les arguments suivants sont invalide : ");
        for i in 1 .. Nb_Arguments loop
            Put (Standard_Error, "  - ");
            Ada.Text_IO.Put_Line
                (Ada.Text_IO.Standard_Error, Ada.Command_Line.Argument (i));
        end loop;
        Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
        return;

    end if;

    Ada.Text_IO.New_Line (1);
    Ada.Text_IO.Put_Line ("En markdown : ");
    Executeur.Construire (fabrique_1);
    Ada.Text_IO.New_Line (1);
    Ada.Text_IO.Put_Line ("En html : ");
    Executeur.Construire (fabrique_2);

    Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
    return;

end Client;
