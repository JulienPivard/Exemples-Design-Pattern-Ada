with Ada.Text_IO;

with Sujet_P.Reel_P;

package body Sujet_P.Procuration_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Operation
      (This : in out Procuration_T)
   is
   begin
      if This.Sujet.Is_Empty then
         Ada.Text_IO.Put_Line (Item => "Procuration création");
         This.Sujet := Conteneur_P.To_Holder (New_Item => Reel_P.Creer);
      end if;
      This.Sujet.Reference.Operation;
   end Operation;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Sujet_P.Procuration_P;
