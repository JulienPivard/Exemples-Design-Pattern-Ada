--  @summary
--  Implémentation concrète du patron de méthode.
--  @description
--  Implémentation concrète du patron de méthode.
--  @group Patron De Méthode
package Patron_De_Methode_P.Concret_1_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Concret_T is new Patron_De_Methode_T with private;

   overriding
   procedure Operation_1
      (This : in out Concret_T);
   --  La première opération spécifique aux sous classes.
   --  @param This
   --  La classe utilisatrice.

   overriding
   procedure Operation_2
      (This : in out Concret_T);
   --  La seconde opération spécifique aux sous classes.
   --  @param This
   --  La classe utilisatrice.

private

   type Concret_T is new Patron_De_Methode_T with
      record
         null;
      end record;

end Patron_De_Methode_P.Concret_1_P;
