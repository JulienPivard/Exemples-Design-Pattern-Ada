with Ada.Text_IO;
with Ada.Wide_Wide_Text_IO; use Ada.Wide_Wide_Text_IO;

with Ada.Command_Line;
with Ada.Directories;

with P_Prototype.Mur;   use P_Prototype.Mur;
with P_Prototype.P_Porte;   use P_Prototype.P_Porte;
with P_Prototype;   use P_Prototype;

procedure Client is

   Nb_Arguments : constant Natural := Ada.Command_Line.Argument_Count;

   procedure Afficher_Aide;

   ---------------------------------------------------------------------------
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
   ---------------------------------------------------------------------------

   procedure Test_De_L_Age (P : in T_Prototype'Class);

   ---------------------------------------------------------------------------
   procedure Test_De_L_Age (P : in T_Prototype'Class) is
      a : Integer := P.Lire_Age;
      p_test : T_Prototype'Class := P.Clone;
   begin
      Ages :
      loop
         p_test := P.Clone;
         p_test.Changer_Age (a);
         Ada.Text_IO.Put ("Test de l'age : ");
         Ada.Text_IO.Put (p_test.Lire_Age'Image);
         Ada.Text_IO.New_Line (1);
         exit Ages when p_test.Est_Trop_Vieux;
         a := a + 10;
      end loop Ages;

      Ada.Text_IO.Put ("L'age limite est : ");
      Ada.Text_IO.Put (a'Image);
      Ada.Text_IO.Put_Line (" ");
   end Test_De_L_Age;
   ---------------------------------------------------------------------------

   p1 : T_Mur;
   p2 : T_Mur;

   po1 : T_Porte;
   po2 : T_Porte;

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

   --  Mettez votre code ici
   Creer_Mur (p1);
   p2 := p1.Clone;
   p2.Changer_Age (20);

   po1.Creer_Porte;
   po2 := po1.Clone;
   po2.Changer_Age (30);

   Ada.Text_IO.Put_Line ("------------- Un Mur -------------");
   Test_De_L_Age (p1);
   Ada.Text_IO.New_Line (1);

   Ada.Text_IO.Put_Line ("------------- Un Mur -------------");
   Test_De_L_Age (p2);
   Ada.Text_IO.New_Line (1);

   Ada.Text_IO.Put_Line ("------------- Une Porte -------------");
   Test_De_L_Age (po1);
   Ada.Text_IO.New_Line (1);

   Ada.Text_IO.Put_Line ("------------- Une Porte -------------");
   Test_De_L_Age (po2);
   Ada.Text_IO.New_Line (1);

   Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
   return;

end Client;
