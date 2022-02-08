-- bibliothèques d'entrée sortie
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- TAD
with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;
with TAD_grilleSudoku; use TAD_grilleSudoku;
with affichage;        use affichage;
-- Résolutions de sudoku
with affichage;     use affichage;
with resolutions;   use resolutions;
with remplirGrille; use remplirGrille;

package body Tests_Resolutions is


   -------------------------------
   -- tests resolution grille 1 --
   -------------------------------

   function test_Resolution_Grille_1 return Boolean is
      g      : Type_Grille;
      trouve : Boolean;
      cpt : integer :=0;
   begin
      g := grille1TresTresFacileDuNouvelAn2018;
      resoudreSudoku (g, trouve, cpt);
      return trouve;
   exception
      when others =>
         return False;
   end test_Resolution_Grille_1;

   -------------------------------
   -- tests resolution grille 2 --
   -------------------------------
   function test_Resolution_Grille_2 return Boolean is
      g      : Type_Grille;
      cpt : integer :=0;
      trouve : Boolean;
   begin
      g := grille2TresTresFacile;
      resoudreSudoku (g, trouve, cpt);
      return trouve;
   exception
      when others =>
         return False;
   end test_Resolution_Grille_2;

   -------------------------------
   -- tests resolution grille 3 --
   -------------------------------
   function test_Resolution_Grille_3 return Boolean is
      g      : Type_Grille;
      trouve : Boolean;
      cpt : integer :=0;
   begin
      g := grille3TresFacile;
      resoudreSudoku (g, trouve, cpt);
      return trouve;
   exception
      when others =>
         return False;
   end test_Resolution_Grille_3;

   -------------------------------
   -- tests resolution grille 4 --
   -------------------------------
   function test_Resolution_Grille_4 return Boolean is
      g      : Type_Grille;
      trouve : Boolean;
      cpt : integer :=0;
   begin
      g := grille4Facile;
      resoudreSudoku (g, trouve, cpt);
      return trouve;
   exception
      when others =>
         return False;
   end test_Resolution_Grille_4;

   -------------------------------
   -- tests resolution grille 5 --
   -------------------------------
   function test_Resolution_Grille_5 return Boolean is
      g      : Type_Grille;
      trouve : Boolean;
      cpt : integer :=0;
  begin
      g := grille5Facile;
      resoudreSudoku (g, trouve, cpt);
      return trouve;
   exception
      when others =>
         return False;
   end test_Resolution_Grille_5;

   -------------------------------
   -- tests resolution grille 6 --
   -------------------------------
   function test_Resolution_Grille_6 return Boolean is
      g      : Type_Grille;
      trouve : Boolean;
       cpt : integer :=0;
  begin
      g := grille6Moyen;
      resoudreSudoku (g, trouve, cpt);
      return trouve;
   exception
      when others =>
         return False;
   end test_Resolution_Grille_6;

   -------------------------------
   -- tests resolution grille 7 --
   -------------------------------
   function test_Resolution_Grille_7 return Boolean is
      g      : Type_Grille;
      trouve : Boolean;
       cpt : integer :=0;
   begin
      g := grille7Difficile;
       resoudreSudoku (g, trouve, cpt);
      return trouve;
   exception
      when others =>
         return False;
   end test_Resolution_Grille_7;

   -------------------------------
   -- tests resolution grille 8 --
   -------------------------------
   function test_Resolution_Grille_8 return Boolean is
      g      : Type_Grille;
      trouve : Boolean;
      cpt : integer :=0;
   begin
      g := grille8Difficile;
      resoudreSudoku (g, trouve, cpt);
      return trouve;
   exception
      when others =>
         return False;
   end test_Resolution_Grille_8;

   -------------------------------
   -- tests resolution grille 9 --
   -------------------------------
   function test_Resolution_Grille_9 return Boolean is
      g      : Type_Grille;
      cpt : integer :=0;
      trouve : Boolean;
   begin
      g := grille9TresDifficile;
      resoudreSudoku (g, trouve, cpt);
      return trouve;
   exception
      when others =>
         return False;
   end test_Resolution_Grille_9;

   ----------------------------------
   -- tests resolution masseCase 1 --
   ----------------------------------
   function test_Resolution_masseCase_1 return Boolean is
      g : Type_Grille;
      x : Integer;
   begin
      g := Grille_test_masseCase;
      x:= masseCase(g,construireCoordonnees(1,2));
      return False;
   exception
      when CASE_NON_VIDE =>
         return True;
      when others =>
         return False;
   end test_Resolution_masseCase_1;

   ----------------------------------
   -- tests resolution masseCase 2 --
   ----------------------------------
   function test_Resolution_masseCase_2 return Boolean is
      g : Type_Grille;
   begin
      g := Grille_test_masseCase;
      return masseCase(g,construireCoordonnees(1,1))=1;
   exception
      when others =>
         return False;
   end test_Resolution_masseCase_2;

   ----------------------------------
   -- tests resolution masseCase 3 --
   ----------------------------------
   function test_Resolution_masseCase_3 return Boolean is
      g : Type_Grille;
   begin
      g := Grille_test_masseCase;
      return masseCase(g,construireCoordonnees(9,9))=9;
   exception
      when others =>
         return False;
   end test_Resolution_masseCase_3;

end Tests_Resolutions;
