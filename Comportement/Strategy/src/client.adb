------------------------------------------------------------------------------
--                                                                          --
--                          Auteur : PIVARD Julien                          --
--           Dernière modification : Vendredi 07 septembre[09] 2018
--                                                                          --
------------------------------------------------------------------------------

with Ada.Text_IO;

with Calcul_Distance_P.Strategie_P;
with Distance_P;

procedure Client is

   s : constant access Calcul_Distance_P.Strategie_P.Strategie_T :=
      new Calcul_Distance_P.Strategie_P.Strategie_T;
   p : Distance_P.Probleme_T;

begin

   p.Initialiser (3, 3, 6, 6, s);

   p.Resoudre;

   Ada.Text_IO.Put ("La distance entre les deux points est : ");
   Ada.Text_IO.Put_Line (p.Lire_Distance'Img);

end Client;
