with Ada.Text_IO;

with Prototype_P.Mur_P;
with Prototype_P.Porte_P;
with Prototype_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is

   procedure Test_De_L_Age
      (P : in Prototype_P.Prototype_T'Class);

   ---------------------------------------------------------------------------
   procedure Test_De_L_Age
      (P : in Prototype_P.Prototype_T'Class)
   is
      a : Prototype_P.Age_T := P.Lire_Age;
      p_test : Prototype_P.Prototype_T'Class := P.Clone;
      use type Prototype_P.Age_T;
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

   package Mur_P     renames Prototype_P.Mur_P;
   package Porte_P   renames Prototype_P.Porte_P;

   p1 : Mur_P.Mur_T;
   p2 : Mur_P.Mur_T;

   po1 : Porte_P.Porte_T;
   po2 : Porte_P.Porte_T;

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

end Executer;
