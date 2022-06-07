with Implementeur_P.Motif_P;
with Implementeur_P.X_P;

package body Abstraction_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Initialiser
      (
         This  : in out Abstraction_T;
         Sorte : in     Natural
      )
   is
      Impl : constant Implementeur_P.Implementeur_T'Class :=
         Init (Sorte => Sorte);
   begin
      This.Implementeur := Impl_P.To_Holder (New_Item => Impl);
   end Initialiser;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Operation
      (This : in out Abstraction_T)
   is
   begin
      This.Implementeur.Reference.Operation_1;
      This.Implementeur.Reference.Operation_2;
      This.Implementeur.Reference.Operation_3;
   end Operation;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Init
      (Sorte : in     Natural)
      return Implementeur_P.Implementeur_T'Class
   is
      Impl_1 : Implementeur_P.Motif_P.Motif_T;
      Impl_2 : Implementeur_P.X_P.X_T;
   begin
      if    Sorte = 1 then
         return Impl_1;
      elsif Sorte = 2 then
         return Impl_2;
      else
         return Impl_1;
      end if;
   end Init;
   ---------------------------------------------------------------------------

end Abstraction_P;
