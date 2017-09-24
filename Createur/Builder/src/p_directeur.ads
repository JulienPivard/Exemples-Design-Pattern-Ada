with P_Builder;

package P_Directeur is

    type T_Directeur is tagged private;

    procedure Construire
        (
            Directeur : in T_Directeur;
            Monteur : in out P_Builder.T_Monteur'Class
        );

private

    type T_Directeur is tagged null record;

end P_Directeur;
