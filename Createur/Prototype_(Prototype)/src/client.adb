------------------------------------------------------------------------------
--                                                                          --
--                          Auteur : PIVARD Julien                          --
--           Dernière modification : Lundi 29 septembre[09] 2025
--                                                                          --
------------------------------------------------------------------------------
with Ada.Command_Line;
with Ada.Exceptions;
with Ada.Text_IO;

with GNAT.Source_Info;

with Version_Compilateur_P;

with Prototype_P.Mur_P;
with Prototype_P.Porte_P;
with Prototype_P;

procedure Client is
   ---------------------------------------------------------------------------
   procedure Test_De_L_Age
      (P : in     Prototype_P.Prototype_T'Class);
   --  @param P
   --  Un objet créé par la méthode des prototypes.

   -----------------------
   procedure Test_De_L_Age
      (P : in     Prototype_P.Prototype_T'Class)
   is
      A      : Prototype_P.Age_T             := P.Lire_Age;
      P_Test : Prototype_P.Prototype_T'Class := P.Clone;

      use type Prototype_P.Age_T;
   begin
      Boucle_Ages :
      loop
         P_Test := P.Clone;
         P_Test.Changer_Age (Age => A);

         Ada.Text_IO.Put      (Item    => "Test de l'age : ");
         Ada.Text_IO.Put      (Item    => P_Test.Lire_Age'Image);
         Ada.Text_IO.New_Line (Spacing => 1);

         exit Boucle_Ages when P_Test.Est_Trop_Vieux;

         A := A + 10;
      end loop Boucle_Ages;

      Ada.Text_IO.Put      (Item => "L'age limite est : ");
      Ada.Text_IO.Put      (Item => A'Image);
      Ada.Text_IO.Put_Line (Item => " ");
   end Test_De_L_Age;
   ---------------------------------------------------------------------------

   package Mur_R     renames Prototype_P.Mur_P;
   package Porte_R   renames Prototype_P.Porte_P;

   P1 : Mur_R.Mur_T;
   P2 : Mur_R.Mur_T;

   Po1 : Porte_R.Porte_T;
   Po2 : Porte_R.Porte_T;
begin
   Ada.Command_Line.Set_Exit_Status
      (Code => Ada.Command_Line.Success);

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

   --  Ada.Text_IO.Put      (Item => "Procédure : [");
   --  Ada.Text_IO.Put      (Item => GNAT.Source_Info.Enclosing_Entity);
   --  Ada.Text_IO.Put      (Item => "], une instance de : ");
   --  Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);

   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern Prototype.");
   Ada.Text_IO.Put_Line (Item => "Création d'un premier objet par une");
   Ada.Text_IO.Put_Line (Item => "fonction, puis toutes les autres par");
   Ada.Text_IO.Put_Line (Item => "clonage. Une porte et un mur.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Mur_R.Creer_Mur (Le_Mur => P1);
   P2 := P1.Clone;
   P2.Changer_Age (Age => 20);

   Po1.Creer_Porte;
   Po2 := Po1.Clone;
   Po2.Changer_Age (Age => 30);

   Ada.Text_IO.Put_Line (Item    => "------------- Un Mur -------------");
   Test_De_L_Age        (P       => P1);
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item    => "------------- Un Mur -------------");
   Test_De_L_Age        (P       => P2);
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item    => "------------- Une Porte -------------");
   Test_De_L_Age        (P       => Po1);
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item    => "------------- Une Porte -------------");
   Test_De_L_Age        (P       => Po2);

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
