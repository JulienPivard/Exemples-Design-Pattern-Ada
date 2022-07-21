with Data_P;

--  @summary
--  Classe mère de toutes les opérations interprété.
--  @description
--  Classe mère de toutes les opérations interprété.
--  @group Interpreteur
package Valeur_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Valeur_Abstraite_T is interface;

   function Interprete
      (This : in     Valeur_Abstraite_T)
      return Data_P.Valeur_T
   is abstract;

   function Image
      (This : in     Valeur_Abstraite_T)
      return String
   is abstract;

end Valeur_P;
