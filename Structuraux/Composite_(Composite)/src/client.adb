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

with Composant_P.Composite_P;
with Composant_P.Feuille_P;

with Valeur_P;

procedure Client is
   use type Valeur_P.Valeur_T;

   Resultat : Valeur_P.Valeur_T;

   C : Composant_P.Composite_P.Composite_T;
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
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern composite.");
   Ada.Text_IO.Put_Line (Item => "Sous forme d'arbre, avec deux feuilles");
   Ada.Text_IO.Put_Line (Item => "par noeuds.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Premier_Ajout :
   declare
      F : Composant_P.Feuille_P.Feuille_T;
   begin
      F := Composant_P.Feuille_P.Construire (Valeur => 5);
      C.Ajouter
         (
            Compoant => F,
            Position => 1
         );
      F := Composant_P.Feuille_P.Construire (Valeur => -20);
      C.Ajouter
         (
            Compoant => F,
            Position => 2
         );
   end Bloc_Premier_Ajout;

   Resultat := C.Faire;
   Ada.Text_IO.Put_Line (Item => C.Image);
   Ada.Text_IO.Put_Line (Item => "Résultat = " & Resultat'Image);
   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Second_Ajout :
   declare
      C_2 : Composant_P.Composite_P.Composite_T;
      C_3 : Composant_P.Composite_P.Composite_T;

      F : Composant_P.Feuille_P.Feuille_T;
   begin
      F := Composant_P.Feuille_P.Construire (Valeur => 9);
      C_2.Ajouter
         (
            Compoant => F,
            Position => 1
         );
      F := Composant_P.Feuille_P.Construire (Valeur => 33);
      C_2.Ajouter
         (
            Compoant => F,
            Position => 2
         );

      C_3.Ajouter
         (
            Compoant => C,
            Position => 1
         );
      C_3.Ajouter
         (
            Compoant => C_2,
            Position => 2
         );

      C := C_3;
   end Bloc_Second_Ajout;

   Resultat := C.Faire;
   Ada.Text_IO.Put_Line (Item => C.Image);
   Ada.Text_IO.Put_Line (Item => "Résultat = " & Resultat'Image);
   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Troisieme_Ajout :
   declare
      C_2 : Composant_P.Composite_P.Composite_T;
      C_3 : Composant_P.Composite_P.Composite_T;

      F : Composant_P.Feuille_P.Feuille_T;
   begin
      F := Composant_P.Feuille_P.Construire (Valeur => -13);
      C_2.Ajouter
         (
            Compoant => F,
            Position => 1
         );
      F := Composant_P.Feuille_P.Construire (Valeur => -1);
      C_2.Ajouter
         (
            Compoant => F,
            Position => 2
         );

      C_3.Ajouter
         (
            Compoant => C,
            Position => 1
         );
      C_3.Ajouter
         (
            Compoant => C_2,
            Position => 2
         );

      C := C_3;
   end Bloc_Troisieme_Ajout;

   Resultat := C.Faire;
   Ada.Text_IO.Put_Line (Item => C.Image);
   Ada.Text_IO.Put_Line (Item => "Résultat = " & Resultat'Image);
   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Quatrieme_Ajout :
   declare
      C_2 : Composant_P.Composite_P.Composite_T;
      C_3 : Composant_P.Composite_P.Composite_T;

      F : Composant_P.Feuille_P.Feuille_T;
   begin
      F := Composant_P.Feuille_P.Construire (Valeur => -99);
      C_2.Ajouter
         (
            Compoant => F,
            Position => 1
         );
      F := Composant_P.Feuille_P.Construire (Valeur => 27);
      C_2.Ajouter
         (
            Compoant => F,
            Position => 2
         );

      C_3.Ajouter
         (
            Compoant => C,
            Position => 1
         );
      C_3.Ajouter
         (
            Compoant => C_2,
            Position => 2
         );

      C := C_3;
   end Bloc_Quatrieme_Ajout;

   Resultat := C.Faire;
   Ada.Text_IO.Put_Line (Item => C.Image);
   Ada.Text_IO.Put_Line (Item => "Résultat = " & Resultat'Image);

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
