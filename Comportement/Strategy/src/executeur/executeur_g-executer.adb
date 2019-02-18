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

   P := Distance_P.Initialiser (3, 3, 6, 6);

   P.Resoudre (S);

   Ada.Text_IO.Put ("La distance entre les deux points est : ");
   Ada.Text_IO.Put_Line (P.Lire_Distance'Img);

end Executer;
