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

with Faire_Action;

with Singleton_P;
with Singleton_P.Instance_P;
with Singleton_P.Protege_P;

procedure Client is
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
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern singleton");
   Ada.Text_IO.Put_Line (Item => "S1 et S2 sont deux variables différentes ");
   Ada.Text_IO.Put_Line (Item => "mais qui accèdent au même singleton.");
   Ada.Text_IO.Put_Line (Item => "Le second exemple avec Si_1 et Si_2 est");
   Ada.Text_IO.Put_Line (Item => "une version task safe. Les deux");
   Ada.Text_IO.Put_Line (Item => "objets modifie le même singleton.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Singleton_Access :
   declare
      S1 : constant Singleton_P.Accesseur_T :=
         Singleton_P.Instance_P.Recuperer_Singleton;
      S2 : constant Singleton_P.Accesseur_T :=
         Singleton_P.Instance_P.Recuperer_Singleton;
   begin
      Faire_Action
         (
            S1 => S1,
            S2 => S2
         );
   end Bloc_Singleton_Access;

   Ada.Text_IO.New_Line (Spacing => 2);
   Ada.Text_IO.Put_Line (Item => "===============================");
   Ada.Text_IO.Put_Line (Item => "====   Version task safe   ====");
   Ada.Text_IO.Put_Line (Item => "===============================");
   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Singleton_Protege :
   declare
      Si_1 : constant Singleton_P.Accesseur_T :=
         Singleton_P.Protege_P.Recuperer_Singleton;
      Si_2 : constant Singleton_P.Accesseur_T :=
         Singleton_P.Protege_P.Recuperer_Singleton;
   begin
      Faire_Action
         (
            S1 => Si_1,
            S2 => Si_2
         );
   end Bloc_Singleton_Protege;

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
