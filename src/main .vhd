-----------------------------------------------------------------------------------

-- Module Name:    SerrureDigitale - Behavioral 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--declaration de l'entité de la serrure numerique

entity SerrureTP4 is   
port(

--fermer :in std_logic:='0';
 clk: in std_logic;  -- entrée du signal d'horloge 
 K: in std_logic_vector(0 to 3):= (others => '0'); -- entrée de l'utilisateur ligne
 R: in std_logic_vector(0 to 3):= (others => '0'); -- entrée de l'utilisateur Colonne
 valider: in std_logic; -- entrée pour valider l'input
 conf: in std_logic; -- entrée pour configurer le mot de passe
 --et12: out std_logic; 
 ouverture : out std_logic;-- sortie qui represente l'ouverture de la porte
 Alarme : out std_logic
 
 ); 
end SerrureTP4;

architecture Behavioral of SerrureTP4 is



-- code initial est 0000 (r=k=1000)

signal ok :std_logic;

signal k1 : std_logic_vector(0 to 3):="1000";
signal k2 : std_logic_vector(0 to 3):="1000";
signal k3 : std_logic_vector(0 to 3):="1000";
signal k4 : std_logic_vector(0 to 3):="1000";

signal r1 : std_logic_vector(0 to 3):="1000";
signal r2 : std_logic_vector(0 to 3):="1000";
signal r3 : std_logic_vector(0 to 3):="1000";
signal r4 : std_logic_vector(0 to 3):="1000";

subtype entier is integer range 0 to 3; 
signal nb_erreur: entier;-- nombre d'erreur successives


-- declaration d'un nouveau type etat_type qui repesente une intervalle d'entiers entre 0 et 15
subtype etat_type is integer range 0 to 32; 
signal etat, etat_suivant: etat_type;
begin
-- premier process pour determiner les etats et les condition des transition d'un etat a un autre
  process(etat, K,R, valider,ok,nb_erreur,conf) 
    begin
		 case etat is 
		 
		 -- attendre premier digit : s'il ya un input alors verifier si l'input est ok 
		 when 0 => ok<='1';
		      if (conf='1') then etat_suivant<=12; 
				else
				if (( K /="0000" )and (R /="0000")) then -- si bouton est pressed 
					if (( K /=k1 )and (R /=r1)) then  -- verifier code : si faux ok <= 0
					ok<='0';
				end if;
		 etat_suivant <= 1;
		 else etat_suivant <= 0;
		 end if; 
		 end if;
		 
		 --premier digit : attendre release du bouton 
		 when 1 =>
		 if (( K ="0000" )and (R ="0000")) then
		 etat_suivant <= 2;
		 else etat_suivant <= 1;
		 end if;


		 -- attendre 2eme digit : s'il ya un input alors verifier si l'input est ok 
		 when 2 =>
		 if (( K /="0000" )and (R /="0000")) then -- si bouton est pressed 
				if (( K /=k2 )and (R /=r2)) then  -- verifier code : si faux ok <= 0
				ok<='0';
				end if;
		 etat_suivant <= 3;
		 else etat_suivant <= 2;
		 end if; 
		 
		 --2eme digit : attendre release du bouton 
		 when 3 => if (( K ="0000" )and (R ="0000")) then
		 etat_suivant <= 4;
		 else etat_suivant <= 3;
		 end if;


		 -- attendre 3eme digit : s'il ya un input alors verifier si l'input est ok 
		 when 4 => if (( K /="0000" )and (R /="0000")) then -- si bouton est pressed 
				if (( K /=k3 )and (R /=r3)) then  -- verifier code : si faux ok <= 0
				ok<='0';
				end if;
		 etat_suivant <= 5;
		 else etat_suivant <= 4;
		 end if; 
		 
		 --3eme digit : attendre release du bouton 
		 when 5 => if (( K ="0000" )and (R ="0000")) then
		 etat_suivant <= 6;
		 else etat_suivant <= 5;
		 end if;

		 -- attendre 4eme digit : s'il ya un input alors verifier si l'input est ok 
		 when 6 => if (( K /="0000" )and (R /="0000")) then -- si bouton est pressed 
				if (( K /=k4 )and (R /=r4)) then  -- verifier code : si faux ok <= 0
				ok<='0';
				end if;
		 etat_suivant <= 7;
		 else etat_suivant <= 6;
		 end if; 
		 
		 --4eme digit : attendre release du bouton 
		 when 7 => if (( K ="0000" )and (R ="0000")) then
		 etat_suivant <= 8;
		 else etat_suivant <= 7;
		 end if;
		 
		 
		 -- 8eme etat attente du press du bouton valider
		 
		 when 8 => if (valider='1') then etat_suivant <= 9;	 
		 else etat_suivant <= 8;
		 end if;
		
		-- 9eme etat attente du release du bouton valider
		 
		 when 9 => if (valider='0')then  -- si valider released 
				if (ok='1') then 
							
					nb_erreur <=0; -- reset le nombre de fois d'erreurs
					etat_suivant <= 10;  -- si code vrai et pas de changement de mot de passe par utilisateur alors etape d'ouverture
				else 
				
				nb_erreur <= nb_erreur+1 after 150 ms;
				
				
				etat_suivant <= 0; -- sinion yarja3 mil loul
				end if;
		 else etat_suivant <= 9; -- si valider pressed on reste dans 9 cette etape
		 end if;
		 
		 -- 10eme etat : ouverture de la porte
		 
		  when 10 => etat_suivant<=11 after 8000 ms;
		  
			--si on arrive ay dernier etat on retourne a l'etat initial d'attente d'un input d'utilisateur
  
		  when 11 => etat_suivant<=0 ;
		  
		

		  when 12 => if (conf ='0') then
						etat_suivant<=23; -- il faut que le bouton configuration soit ralaché pour changer le mot de passe
		             else etat_suivant<=12;
						 end if;

		
----changement premier digit
			
			when 13 => 
							if (( K /="0000" )and (R /="0000")) then -- si un bouton est pressed 
								k1<=k; --affectation du 1er digit du nouveau password
								r1<=r;
								etat_suivant <= 14;
							else etat_suivant <= 13;
							end if; 
							
			when 14 => if (( K ="0000" )and (R ="0000")) then --attend relachement du bouton
		 etat_suivant <= 15;
		 else etat_suivant <= 14;
		 end if;

			when 15 => 
					if (( K /="0000" )and (R /="0000")) then -- si un bouton est pressed 
						k2<=k; --affectation du 1er digit du nouveau password
						r2<=r;
						etat_suivant <= 16;
					else etat_suivant <= 15;
					end if; 
					
		when 16 => if (( K ="0000" )and (R ="0000")) then --attend relachement du bouton
		 etat_suivant <= 17;
		 else etat_suivant <= 16;
		 end if;
						
		when 17 => 
				if (( K /="0000" )and (R /="0000")) then -- si un bouton est pressed 
					k3<=k; --affectation du 1er digit du nouveau password
					r3<=r;
					etat_suivant <= 18;
				else etat_suivant <= 17;
					end if; 
					
		when 18 => if (( K ="0000" )and (R ="0000")) then --attend relachement du bouton
		 etat_suivant <= 19;
		 else etat_suivant <= 18;
		 end if;
		 
		-- dernier digit				
		when 19 => 
				if (( K /="0000" )and (R /="0000")) then -- si un bouton est pressed 
					k4<=k; --affectation du 1er digit du nouveau password
					r4<=r;
					etat_suivant <= 20;
				else etat_suivant <= 19;
					end if; 
					
		when 20 => if (( K ="0000" )and (R ="0000")) then --attend relachement du bouton
		 etat_suivant <= 21;
		 else etat_suivant <= 20;
		 end if;
		 
		 -- Validation du nouveau mot de passe
		 
			 when 21 => if (valider='1') then etat_suivant <= 22;	 
		 else etat_suivant <= 21;
		 end if;	
		 
			when 22 => if (valider='0') then etat_suivant <= 0;	 
		 else etat_suivant <= 22;
		 end if;	



 when 23 =>	     	
				if (( K /="0000" )and (R /="0000")) then -- si bouton est pressed 
					if (( K /=k1 )and (R /=r1)) then  -- verifier code : si faux ok <= 0
					ok<='0';
				end if;
		 etat_suivant <= 24;
		 else etat_suivant <= 23;
		 end if; 

	 --premier digit : attendre release du bouton 
		 when 24 =>
		 if (( K ="0000" )and (R ="0000")) then
		 etat_suivant <= 25;
		 else etat_suivant <= 24;
		 end if;
		 
		 
		 	 -- attendre 2eme digit : s'il ya un input alors verifier si l'input est ok 
		 when 25 =>
		 if (( K /="0000" )and (R /="0000")) then -- si bouton est pressed 
				if (( K /=k2 )and (R /=r2)) then  -- verifier code : si faux ok <= 0
				ok<='0';
				end if;
		 etat_suivant <= 26;
		 else etat_suivant <= 25;
		 end if; 
		 
		 --2eme digit : attendre release du bouton 
		 when 26 => if (( K ="0000" )and (R ="0000")) then
		 etat_suivant <= 27;
		 else etat_suivant <= 26;
		 end if;


		 -- attendre 3eme digit : s'il ya un input alors verifier si l'input est ok 
		 when 27 => if (( K /="0000" )and (R /="0000")) then -- si bouton est pressed 
				if (( K /=k3 )and (R /=r3)) then  -- verifier code : si faux ok <= 0
				ok<='0';
				end if;
		 etat_suivant <= 28;
		 else etat_suivant <= 27;
		 end if; 
		 
		 --3eme digit : attendre release du bouton 
		 when 28 => if (( K ="0000" )and (R ="0000")) then
		 etat_suivant <= 29;
		 else etat_suivant <= 28;
		 end if;

		 -- attendre 4eme digit : s'il ya un input alors verifier si l'input est ok 
		 when 29 => if (( K /="0000" )and (R /="0000")) then -- si bouton est pressed 
				if (( K /=k4 )and (R /=r4)) then  -- verifier code : si faux ok <= 0
				ok<='0';
				end if;
		 etat_suivant <= 30;
		 else etat_suivant <= 29;
		 end if; 
		 
		 --4eme digit : attendre release du bouton 
		 when 30 => if (( K ="0000" )and (R ="0000")) then
		 etat_suivant <= 31;
		 else etat_suivant <= 30;
		 end if;
		 
		 
		 -- 8eme etat attente du press du bouton valider
		 
		 when 31 => if (valider='1') then etat_suivant <= 32;	 
		 else etat_suivant <= 31;
		 end if;
		
		-- 9eme etat attente du release du bouton valider
		 
		 when 32 => if (valider='0')then  -- si valider released 
				if (ok='1') then 
							
					nb_erreur <=0; -- reset le nombre de fois d'erreurs
					etat_suivant <= 13;  -- si code vrai et pas de changement de mot de passe par utilisateur alors etape d'ouverture
				else 
				
				nb_erreur <= nb_erreur+1 after 300 ms;
				
				
				etat_suivant <= 0; -- sinion yarja3 mil loul
				end if;
		 else etat_suivant <= 32; -- si valider pressed on reste dans cette etape
		 end if;
	
	
	
		 end case;
end process;

--process pour determiner les operation a faire pendant chaque etat
process(etat)
begin
		 case etat is
		 when 0 to 9 =>  ouverture <= '0';
		 								--et12<='1';
	if (nb_erreur <3) then alarme <='0';
			else  alarme<='1';   
			end if;			
						
						
		 when 10 to 11 => ouverture <= '1';
		                  Alarme<='0';
								--et12<='0'; 
								
		when 12 to 32  => ouverture <= '0';
		                  Alarme<='0';
								--et12<='0';


	
		 end case;
		end process;
-- process qui represente un registre a decalage pour la transition de l'etat n a l'etat n+1
process(clk)
begin
		 if rising_edge(clk) then
		 etat <= etat_suivant;
 end if;
end process;
end Behavioral;


