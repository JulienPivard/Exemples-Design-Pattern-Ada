with Ada.Text_IO;

with P_Prototype.Mur;
with P_Prototype.P_Porte;
with P_Prototype;

procedure Client is

   package Prototype_P renames P_Prototype;

   procedure Test_De_L_Age (P : in Prototype_P.T_Prototype'Class);

   ---------------------------------------------------------------------------
   procedure Test_De_L_Age (P : in Prototype_P.T_Prototype'Class) is
      a : Integer := P.Lire_Age;
      p_test : Prototype_P.T_Prototype'Class := P.Clone;
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

   package Mur_P     renames P_Prototype.Mur;
   package Porte_P   renames P_Prototype.P_Porte;

   p1 : Mur_P.T_Mur;
   p2 : Mur_P.T_Mur;

   po1 : Porte_P.T_Porte;
   po2 : Porte_P.T_Porte;

begin

   Mur_P.Creer_Mur (p1);
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

end Client;
