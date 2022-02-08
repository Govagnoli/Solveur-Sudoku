pragma Ada_2012;
package body TAD_ensemble is
    ------------------------
    -- construireEnsemble --
    ------------------------
    function construireEnsemble return Type_Ensemble is
        e : Type_Ensemble;
    begin
        for i in 1 .. 9 loop
            e (i) := True;
        end loop;
        return e;
    end construireEnsemble;

    ------------------
    -- ensembleVide --
    ------------------
    function ensembleVide (e : in Type_Ensemble) return Boolean is
        estPlein : Boolean := True;
        i        : Integer;
    begin
        i := 1;
        while i < 10 and estPlein loop
            if e (i) = False then
                estPlein := False;
            end if;
            i := i + 1;
        end loop;
        return estPlein;
    end ensembleVide;

    -----------------------
    -- appartientChiffre --
    -----------------------
    function appartientChiffre
       (e : in Type_Ensemble; v : Integer) return Boolean
    is
    begin
        return not e (v);
    end appartientChiffre;

    --------------------
    -- nombreChiffres --
    --------------------
    function nombreChiffres (e : in Type_Ensemble) return Integer is
        nbElement : Integer := 0;
    begin
        for i in 1 .. 9 loop
            if e (i) = False then
                nbElement := nbElement + 1;
            end if;
        end loop;
        return nbElement;
    end nombreChiffres;

    --------------------
    -- ajouterChiffre --
    --------------------
    procedure ajouterChiffre (e : in out Type_Ensemble; v : in Integer) is
    begin
        if appartientChiffre (e, v) then
            raise APPARTIENT_ENSEMBLE;
        end if;
        e (v) := False;
    end ajouterChiffre;

    --------------------
    -- retirerChiffre --
    --------------------
    procedure retirerChiffre (e : in out Type_Ensemble; v : in Integer) is
    begin
        if not appartientChiffre (e, v) then
            raise NON_APPARTIENT_ENSEMBLE;
        end if;
        e (v) := True;
    end retirerChiffre;
    --------------------
    -- premierChiffre --
    --------------------
    function premierChiffre (e : in Type_Ensemble) return Integer is
    begin
        if ensembleVide (e) then
            raise ENSEMBLE_VIDE;
        end if;
        for i in 1 .. 8 loop
            if appartientChiffre (e, i) then
                return i;
            end if;
        end loop;
        return 9;
    end premierChiffre;

end TAD_ensemble;
