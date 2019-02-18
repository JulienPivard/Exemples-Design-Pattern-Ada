with Ada.Text_IO;

with Calcul_Distance_P.Strategie_P;
with Distance_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   package Strat_R renames Calcul_Distance_P.Strategie_P;

   S : constant access Strat_R.Strategie_T := new Strat_R.Strategie_T;
   P : Distance_P.Probleme_T;
begin

   P := Distance_P.Initialiser (3, 3, 6, 6, S);

   P.Resoudre;

   Ada.Text_IO.Put ("La distance entre les deux points est : ");
   Ada.Text_IO.Put_Line (P.Lire_Distance'Img);

end Executer;
