private with Mem_P.Etat_P;

--  @summary
--  Le mémento qui vas servir à stocker notre instantané.
--  @description
--  Le mémento qui vas servir à stocker notre instantané.
--  @group Memento
package Mem_P.Memento_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Memento_T is private;
   --  Stock un instantané de l'utilisateur.

private

   type Memento_T is
      record
         Etat : Etat_P.Etat_T;
         --  L'état de l'objet dont on veut sauver un instantané.
      end record;

end Mem_P.Memento_P;
