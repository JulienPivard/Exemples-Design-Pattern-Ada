with Ada.Text_IO;

with Fabrique_P;
with Fabrique_P.Markdown_P;
with Fabrique_P.Html_P;
with Produit_A_P;
with Produit_B_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   ---------------------------------------------------------------------------
   procedure Construire
      (Fabrique : in Fabrique_P.Fabrique_T'Class);
   --  Construit les produits à partir de la fabrique.
   --  @param Fabrique
   --  La fabrique.

   procedure Construire
      (Fabrique : in Fabrique_P.Fabrique_T'Class)
   is
      Produit_A : constant Produit_A_P.Produit_T'Class :=
         Fabrique.Creer_Produit_A;
      Produit_B : constant Produit_B_P.Produit_T'Class :=
         Fabrique.Creer_Produit_B;
   begin
      Produit_A.Annonce;
      Produit_B.Presente;
   end Construire;
   ---------------------------------------------------------------------------

   package Fab_1_R renames Fabrique_P.Markdown_P;
   package Fab_2_R renames Fabrique_P.Html_P;
   Fabrique_1 : Fab_1_R.Fabrique_Un_T;
   Fabrique_2 : Fab_2_R.Fabrique_Deux_T;
begin
   Ada.Text_IO.New_Line (1);
   Ada.Text_IO.Put_Line ("En markdown : ");
   Construire (Fabrique_1);

   Ada.Text_IO.New_Line (1);
   Ada.Text_IO.Put_Line ("En html : ");
   Construire (Fabrique_2);
end Executer;
