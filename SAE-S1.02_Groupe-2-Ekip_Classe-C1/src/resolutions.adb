pragma Ada_2012;
package body resolutions is

   -----------------------
   --estChiffrePlaceable--
   -----------------------
   function estChiffrePlaceable
     (g : in Type_Grille; v : in Integer; c : in Type_Coordonnee)
      return Boolean
   is
      ens : Type_Ensemble;
   begin
      if not caseVide (g, c) then
         raise CASE_NON_VIDE;
      end if;
      ens := construireEnsemble;
      ens := obtenirChiffresDUneColonne (g, obtenirColonne (c));
      if appartientChiffre (ens, v) then
         return False;
      end if;
      ens := obtenirChiffresDUneLigne (g, obtenirLigne (c));
      if appartientChiffre (ens, v) then
         return False;
      end if;
      ens := obtenirChiffresDUnCarre (g, obtenirCarre (c));
      if appartientChiffre (ens, v) then
         return False;
      end if;
      return True;
   end estChiffrePlaceable;

   -----------------------
   -- estChiffreValable --
   -----------------------
   function estChiffreValable
     (g : in Type_Grille; v : in Integer; c : in Type_Coordonnee)
      return Boolean
   is
      cosCarre, cosRecherche : Type_Coordonnee;
   begin
      if not estChiffrePlaceable (g, v, c) then
         return False;
      end if;
      cosCarre := obtenirCoordonneeCarre (obtenirCarre (c));
      for i in 0 .. 2 loop
         for j in 0 .. 2 loop
            cosRecherche :=
              construireCoordonnees
                (obtenirLigne (cosCarre) + i, obtenirColonne (cosCarre) + j);
            if caseVide (g, cosRecherche) then
               if estChiffrePlaceable (g, v, cosRecherche) and
                 cosRecherche /= c
               then
                  return False;
               end if;
            end if;
         end loop;
      end loop;
      return True;
   end estChiffreValable;

   -------------------------------
   -- obtenirSolutionsPossibles --
   -------------------------------
   function obtenirSolutionsPossibles
     (g : in Type_Grille; c : in Type_Coordonnee) return Type_Ensemble
   is
      ens : Type_Ensemble := construireEnsemble;
   begin
      if not caseVide (g, c) then
         raise CASE_NON_VIDE;
      end if;
      for i in 1 .. 9 loop
         if estChiffrePlaceable (g, i, c) then
            if not appartientChiffre (ens, i) then
               ajouterChiffre (ens, i);
            end if;
         end if;
      end loop;
      return ens;
   end obtenirSolutionsPossibles;

   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------
   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer
   is
   begin
      if ensembleVide (resultats) then
         raise ENSEMBLE_VIDE;
      end if;
      if nombreChiffres (resultats) /= 1 then
         raise PLUS_DE_UN_CHIFFRE;
      end if;
      for i in 1 .. 9 loop
         if appartientChiffre (resultats, i) then
            return i;
         end if;
      end loop;
      return 0;
   end rechercherSolutionUniqueDansEnsemble;

   ---------------
   -- masseCase --
   ---------------
   function masseCase
     (g : in Type_Grille; c : in Type_Coordonnee) return Integer
   is
   begin
      if not caseVide (g, c) then
         raise CASE_NON_VIDE;
      end if;
      return nombreChiffres (obtenirSolutionsPossibles (g, c));
   end masseCase;

   -----------------------
   -- trouverCaseLegere --
   -----------------------
   function trouverCaseLegere (g : in Type_Grille) return Type_Coordonnee is
      c           : Type_Coordonnee;
      coRecherche : Type_Coordonnee;
      poids       : Integer := 10;
      temp        : Integer;
   begin
      for i in 1 .. 9 loop
         for j in 1 .. 9 loop
            coRecherche := construireCoordonnees (i, j);
            if caseVide (g, coRecherche) then
               temp := masseCase (g, coRecherche);
               if temp < poids then
                  if temp = 1 then
                     return coRecherche;
                  end if;
                  c     := coRecherche;
                  poids := temp;
               end if;
            end if;
         end loop;
      end loop;
      return c;
   end trouverCaseLegere;

   --------------------
   -- resoudreSudoku --
   --------------------
   procedure resoudreSudoku
     (g : in out Type_Grille; trouve : out Boolean; cpt : in out Integer)
   is
      reroll                : Boolean := False;
      masse, possibleValeur : Integer;
      cos                   : Type_Coordonnee;
      ensPossibles          : Type_Ensemble;
      grilleBis             : Type_Grille;
   begin
      for v in 1 .. 9 loop
         for i in 1 .. 9 loop
            for j in 1 .. 9 loop
               if caseVide (g, construireCoordonnees (i, j)) then
                  if estChiffreValable (g, v, construireCoordonnees (i, j))
                  then
                     fixerChiffre (g, construireCoordonnees (i, j), v, cpt);
                     reroll := True;
                  end if;
               end if;
            end loop;
         end loop;
      end loop;
      if reroll then
         resoudreSudoku (g, trouve, cpt);
      elsif not estRemplie (g) then
         cos   := trouverCaseLegere (g);
         masse := masseCase (g, cos);
         if masse = 1 then
            fixerChiffre
              (g, cos,
               rechercherSolutionUniqueDansEnsemble
                 (obtenirSolutionsPossibles (g, cos)),
               cpt);
            resoudreSudoku (g, trouve, cpt);
         elsif masse > 1 then
            ensPossibles := construireEnsemble;
            ensPossibles := obtenirSolutionsPossibles (g, cos);
            for i in 1 .. masse loop
               possibleValeur := premierChiffre (ensPossibles);
               grilleBis      := g;
               retirerChiffre (ensPossibles, possibleValeur);
               fixerChiffre (g, cos, possibleValeur, cpt);
               resoudreSudoku (g, trouve, cpt);
               if estRemplie (g) then
                  return;
               end if;
               g := grilleBis;
            end loop;
         end if;
      end if;
      trouve := estRemplie (g);
   end resoudreSudoku;

end resolutions;
