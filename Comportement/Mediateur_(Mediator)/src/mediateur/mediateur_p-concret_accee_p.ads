with Utilisateur_P.Collegue_Accee_P;

--  @summary
--  Version concrète du médiateur.
--  @description
--  Version concrète du médiateur.
--  @group Mediateur
package Mediateur_P.Concret_Accee_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   subtype Collegue_A is Utilisateur_P.Collegue_Accee_P.Utilisateur_Collegue_A;

   type Concret_T is new Mediateur_T with private;

   overriding
   procedure Signaler
      (
         This : in out Concret_T;
         Id   : in     Id_T
      );

   not overriding
   procedure Inscrire
      (
         This        : not null access Concret_T;
         Utilisateur : in     Collegue_A
      );

private

   type Concret_T is new Mediateur_T with
      record
         U_1 : Utilisateur_P.Collegue_Accee_P.Utilisateur_Collegue_A;
         --  Le premier utilisateur.
         U_2 : Utilisateur_P.Collegue_Accee_P.Utilisateur_Collegue_A;
         --  Le deuxième utilisateur.
         Pos : Id_T := Id_T'First;
      end record;

end Mediateur_P.Concret_Accee_P;
