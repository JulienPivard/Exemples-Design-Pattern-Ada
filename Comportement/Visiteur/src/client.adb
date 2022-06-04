------------------------------------------------------------------------------
--                                                                          --
--                          Auteur : PIVARD Julien                          --
--           Dernière modification : Dimanche 05 juin[06] 2022
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;

with GNAT.Compiler_Version;
with GNAT.Source_Info;

with Comptage_P;
with Executeur_G;

procedure Client is

   package Version_Compilateur_P is new GNAT.Compiler_Version;
   package Executeur_P is new Executeur_G
      (
         Nombre_D_Arguments_Min => 0,
         Nombre_D_Arguments_Max => 0
      );

begin

   Ada.Text_IO.Put      (Item => "+---------------------+");
   Ada.Text_IO.Put_Line (Item => " - - - - - - - - - - - ");
   Ada.Text_IO.Put      (Item => "| Date de compilation :");
   Ada.Text_IO.Put      (Item => "  ");
   Ada.Text_IO.Put      (Item => GNAT.Source_Info.Compilation_ISO_Date);
   Ada.Text_IO.Put      (Item => " ");
   Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Compilation_Time);
   Ada.Text_IO.Put      (Item => "+---------------------+");
   Ada.Text_IO.Put_Line (Item => " - - - - - - - - - - - ");

   Ada.Text_IO.Put      (Item => "Version du compilateur : ");
   Ada.Text_IO.Put_Line (Item => "[" & Version_Compilateur_P.Version & "]");

   Ada.Text_IO.New_Line (Spacing => 1);

   Executeur_P.Verifier_Nombre_D_Arguments;
   Executeur_P.Executer;

   Comptage_P.Compteur := Comptage_P.Compteur + 1;
   Ada.Text_IO.Put_Line
      (
         Item => "Le programme à été lancé : " &
            Comptage_P.Compteur'Img & " fois"
      );
exception
   when Executeur_P.Trop_D_Arguments_E =>
      null;
   when Executeur_P.Pas_Assez_D_Arguments_E =>
      null;
   when Executeur_P.Option_Incorrect_E =>
      null;
   when Executeur_P.Valeur_Option_Incorrect_E =>
      null;

end Client;
