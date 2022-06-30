--  @summary
--  État extrinsèque qui sera passé au poids mouche.
--  @description
--  État extrinsèque qui sera passé au poids mouche.
--  @group Etat Extrinsèque
package Etat_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   subtype Valeur_T is Integer;
   --  Valeur des états externe.

   type Etat_Externe_T is tagged private;
   --  Un état externe.

   procedure Modifier_Val
      (
         This : in out Etat_Externe_T;
         Val  : in     Valeur_T
      );
   --  Modifier une valeur de l'état.
   --  @param This
   --  L'état externe.
   --  @param Val
   --  La nouvelle valeur de l'état.

   function Lire_Val
      (This : in     Etat_Externe_T)
      return Valeur_T;
   --  Lit une valeur de l'état externe.
   --  @param This
   --  L'état externe.
   --  @return La valeur de l'état externe.

private

   type Etat_Externe_T is tagged
      record
         Valeur : Valeur_T := 0;
         --  Les valeurs qui représente un état externe.
      end record;

end Etat_P;
