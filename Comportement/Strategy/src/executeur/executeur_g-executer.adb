with Ada.Text_IO;

with Distance_P;
with Strategie_P.Calcul_Distance_Washington_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   S : Strategie_P.Calcul_Distance_Washington_P.Strategie_T;
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

   P.Resoudre (Strategie => S);

   Ada.Text_IO.Put      (Item => "La distance entre les deux points est : ");
   Ada.Text_IO.Put_Line (Item => P.Lire_Distance'Img);
end Executer;
