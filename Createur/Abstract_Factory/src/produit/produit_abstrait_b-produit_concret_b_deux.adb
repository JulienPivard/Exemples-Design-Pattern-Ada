with Ada.Text_IO;

package body Produit_Abstrait_B.Produit_Concret_B_Deux is

    ---------------------------------------------------------------------------
    overriding
    procedure Presente (Produit : in Prod_B_Deux) is
        pragma Unreferenced (Produit);
    begin
        Ada.Text_IO.Put_Line ("<h1>Classe B 2 ! Pour vous servir.</h1>");
    end Presente;

end Produit_Abstrait_B.Produit_Concret_B_Deux;
