with Composant_P;
with Ada.Containers.Indefinite_Holders;

use type Composant_P.Composant_T;

--  @summary
--  Stockage d'un objet de la classe composant.
--  @description
--  Stockage d'un objet de la classe composant.
--  @group Decorateur
package Composant_Class_P is new Ada.Containers.Indefinite_Holders
   (Element_Type => Composant_P.Composant_T'Class);
