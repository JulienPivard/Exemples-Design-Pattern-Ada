------------------------------------------------------------------------------
--                                                                          --
--                          Auteur : PIVARD Julien                          --
--           Dernière modification : Vendredi 07 septembre[09] 2018
--                                                                          --
------------------------------------------------------------------------------

with Ada.Text_IO;

with Singleton_P;
with Ada.Strings.Unbounded;

procedure Client is

   s1 : constant Singleton_P.Singleton_Access_T :=
      Singleton_P.Recuperer_Singleton;
   s2 : constant Singleton_P.Singleton_Access_T :=
      Singleton_P.Recuperer_Singleton;

begin

   Ada.Text_IO.New_Line (1);
   Ada.Text_IO.Put_Line ("====  Après modification de S1  ====");
   Ada.Text_IO.New_Line (1);

   s1.all.Changer_Nom
      (Ada.Strings.Unbounded.To_Unbounded_String ("Roulecouele"));
   Ada.Text_IO.Put ("S1 : ");
   s1.all.Afficher;
   Ada.Text_IO.Put ("S2 : ");
   s2.all.Afficher;

   Ada.Text_IO.New_Line (1);
   Ada.Text_IO.Put_Line ("====  Après modification de S2  ====");
   Ada.Text_IO.New_Line (1);

   s2.all.Changer_Nom
      (Ada.Strings.Unbounded.To_Unbounded_String ("Hey poivros"));
   Ada.Text_IO.Put ("S1 : ");
   s1.all.Afficher;
   Ada.Text_IO.Put ("S2 : ");
   s2.all.Afficher;

end Client;
