with Ada.Text_IO;

with Prototype_P.Mur_P;
with Prototype_P.Porte_P;
with Prototype_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is

   ---------------------------------------------------------------------------
   procedure Test_De_L_Age
      (P : in Prototype_P.Prototype_T'Class);
   --  @param P
   --  Un objet créé par la méthode des prototypes.

   -----------------------
   procedure Test_De_L_Age
      (P : in Prototype_P.Prototype_T'Class)
   is
      A        : Prototype_P.Age_T              := P.Lire_Age;
      P_Test   : Prototype_P.Prototype_T'Class  := P.Clone;

      use type Prototype_P.Age_T;
   begin
      Ages :
      loop
         P_Test := P.Clone;
         P_Test.Changer_Age (A);

         Ada.Text_IO.Put ("Test de l'age : ");
         Ada.Text_IO.Put (P_Test.Lire_Age'Image);
         Ada.Text_IO.New_Line (1);

         exit Ages when P_Test.Est_Trop_Vieux;

         A := A + 10;
      end loop Ages;

      Ada.Text_IO.Put ("L'age limite est : ");
      Ada.Text_IO.Put (A'Image);
      Ada.Text_IO.Put_Line (" ");
   end Test_De_L_Age;
   ---------------------------------------------------------------------------

   package Mur_R     renames Prototype_P.Mur_P;
   package Porte_R   renames Prototype_P.Porte_P;

   P1 : Mur_R.Mur_T;
   P2 : Mur_R.Mur_T;

   Po1 : Porte_R.Porte_T;
   Po2 : Porte_R.Porte_T;

begin

   Mur_R.Creer_Mur (P1);
   P2 := P1.Clone;
   P2.Changer_Age (20);

   Po1.Creer_Porte;
   Po2 := Po1.Clone;
   Po2.Changer_Age (30);

   Ada.Text_IO.Put_Line ("------------- Un Mur -------------");
   Test_De_L_Age (P1);
   Ada.Text_IO.New_Line (1);

   Ada.Text_IO.Put_Line ("------------- Un Mur -------------");
   Test_De_L_Age (P2);
   Ada.Text_IO.New_Line (1);

   Ada.Text_IO.Put_Line ("------------- Une Porte -------------");
   Test_De_L_Age (Po1);
   Ada.Text_IO.New_Line (1);

   Ada.Text_IO.Put_Line ("------------- Une Porte -------------");
   Test_De_L_Age (Po2);
   Ada.Text_IO.New_Line (1);

end Executer;
