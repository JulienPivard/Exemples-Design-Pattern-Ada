with Ada.Text_IO;

with Distance_P;
with Strategie_P.Calcul_Distance_Pythagore_P;
with Strategie_P.Calcul_Distance_Washington_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   Washington : Strategie_P.Calcul_Distance_Washington_P.Washington_T;
   Pythagore  : Strategie_P.Calcul_Distance_Pythagore_P.Pythagore_T;

   P : Distance_P.Probleme_T;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern stratégie.");
   Ada.Text_IO.Put_Line (Item => "Calcul de la distance entre deux points.");
   Ada.Text_IO.Put_Line (Item => "Le problème : deux points dont on veux");
   Ada.Text_IO.Put_Line (Item => "              connaitre la distance");
   Ada.Text_IO.Put_Line (Item => "La stratégie : Le calcul de la distance.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   P := Distance_P.Initialiser (X1 => 3, Y1 => 3, X2 => 6, Y2 => 6);

   P.Resoudre (Strategie => Washington);
   Ada.Text_IO.Put
      (Item => "La distance de Washington entre les deux points est : ");
   Ada.Text_IO.Put_Line (Item => P.Lire_Distance'Img);

   P.Resoudre (Strategie => Pythagore);
   Ada.Text_IO.Put
      (Item => "La distance de Pythagore  entre les deux points est : ");
   Ada.Text_IO.Put_Line (Item => P.Lire_Distance'Img);

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
