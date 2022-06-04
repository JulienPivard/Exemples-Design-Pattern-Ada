with Ada.Text_IO;

with Calcul_Distance_P.Strategie_P;
with Distance_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   package Strat_R renames Calcul_Distance_P.Strategie_P;

   S : Strat_R.Strategie_T;
   P : Distance_P.Probleme_T;
begin
   P := Distance_P.Initialiser (X1 => 3, Y1 => 3, X2 => 6, Y2 => 6);

   P.Resoudre (Strategie => S);

   Ada.Text_IO.Put      (Item => "La distance entre les deux points est : ");
   Ada.Text_IO.Put_Line (Item => P.Lire_Distance'Img);
end Executer;
