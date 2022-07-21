--  @summary
--  Classe mère du patron de méthode.
--  @description
--  Classe mère du patron de méthode.
--  @group Patron De Méthode
package Patron_De_Methode_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Patron_De_Methode_T is abstract tagged private;
   --  Patron de méthode abstrait pour factoriser le code commun.

   procedure Methode_Patron
      (This : in out Patron_De_Methode_T'Class);
   --  Patron de méthode qui factorise tout le code
   --  commun à ses sous classes.
   --  @param This
   --  Le patron de méthode.

   procedure Operation_1
      (This : in out Patron_De_Methode_T)
   is abstract;
   --  La première opération spécifique aux sous classes.
   --  @param This
   --  La classe utilisatrice.

   procedure Operation_2
      (This : in out Patron_De_Methode_T)
   is abstract;
   --  La seconde opération spécifique aux sous classes.
   --  @param This
   --  La classe utilisatrice.

private

   type Patron_De_Methode_T is abstract tagged
      record
         null;
      end record;

end Patron_De_Methode_P;
