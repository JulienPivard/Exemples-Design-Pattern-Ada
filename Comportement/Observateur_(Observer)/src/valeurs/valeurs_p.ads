--  @summary
--  Valeurs.
--  @description
--  Valeurs.
--  @group Valeurs
package Valeurs_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Val_T is range 0 .. 100;

   type Indice_T is range 1 .. 5;

   type Table_Valeurs_T is array (Indice_T) of Val_T;

   type Valeurs_Graphe_T is tagged private;

   procedure Modifier
      (
         This : in out Valeurs_Graphe_T;
         Vals : in     Table_Valeurs_T
      );

   function Lire_Vals
      (This : in     Valeurs_Graphe_T)
      return Table_Valeurs_T;

private

   type Valeurs_Graphe_T is tagged
      record
         Vals : Table_Valeurs_T := Table_Valeurs_T'(others => 0);
      end record;

end Valeurs_P;
