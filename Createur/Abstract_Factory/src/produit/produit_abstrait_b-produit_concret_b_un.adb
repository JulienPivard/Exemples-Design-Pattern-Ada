with Ada.Text_IO;

package body Produit_Abstrait_B.Produit_Concret_B_Un is

    --  La classe se présente elle même.
    overriding
    procedure Presente (Produit : in Prod_B_Un) is
        pragma Unreferenced (Produit);
    begin
        Ada.Text_IO.Put_Line ("# Classe B 1 ! Pour vous servir.");
    end Presente;

end Produit_Abstrait_B.Produit_Concret_B_Un;
