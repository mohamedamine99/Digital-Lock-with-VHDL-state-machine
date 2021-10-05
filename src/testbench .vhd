--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:38:13 12/12/2020
-- Design Name:   
-- Module Name:   C:/Users/AMINE/Desktop/iia4/xilinx/VLSITP/testing.vhd
-- Project Name:  VLSITP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SerrureTP4
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY testing IS
END testing;
 
ARCHITECTURE behavior OF testing IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SerrureTP4
    PORT(
         clk : IN  std_logic;
         K : IN  std_logic_vector(0 to 3);
         R : IN  std_logic_vector(0 to 3);
         valider : IN  std_logic;
         ouverture : OUT  std_logic;
			 conf: in std_logic; -- entrée pour configurer le mot de passe

			
			 Alarme : out std_logic

        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal K : std_logic_vector(0 to 3) := (others => '0');
   signal R : std_logic_vector(0 to 3) := (others => '0');
   signal valider : std_logic := '0';
	signal conf:  std_logic:= '0'; 


 	--Outputs
   signal ouverture : std_logic;
	 signal Alarme :  std_logic;


   -- Clock period definitions
   constant clk_period : time := 100 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SerrureTP4 PORT MAP (
          clk => clk,
          K => K,
          R => R,
          valider => valider,
          ouverture => ouverture,
			 conf=>conf,
			  Alarme =>Alarme
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		--appui bouton de configuration
		
      wait for 1000 ms;
      conf<='1';	
      wait for 1100 ms;
      conf<='0';
		
      wait for 100 ns;	
		
		--saisie du password ancient
		
		k<="1000";	
		r<="1000";
      wait for clk_period*10;		
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";			
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;	
		valider<='1';	
		wait for clk_period*10;	
		valider<='0';
		
--	saisie du nouveau password
	
		wait for clk_period*10;
		k<="0100";	
		r<="0100";
      wait for clk_period*10;		
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="0100";
		r<="0100";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";			
		wait for clk_period*10;
		k<="0100";
		r<="0100";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="0100";
		r<="0100";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;	
		valider<='1';	
		wait for clk_period*10;	
		valider<='0';
		
--saisie dun password correcte
		
		wait for clk_period*10;
		k<="0100";	
		r<="0100";
      wait for clk_period*10;		
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="0100";
		r<="0100";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";			
		wait for clk_period*10;
		k<="0100";
		r<="0100";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="0100";
		r<="0100";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;	
		valider<='1';	
		wait for clk_period*10;	
		valider<='0';
	

		wait for clk_period*10;	


		--saisie dun password erroné

		
		k<="1000";	
		r<="1000";
      wait for clk_period*10;		
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";			
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;	
		valider<='1';	
		wait for clk_period*10;	
		valider<='0';
	
	--saisie dun password erroné

		
		wait for clk_period*10;	
		k<="1000";	
		r<="1000";
      wait for clk_period*10;		
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";			
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;	
		valider<='1';	
		wait for clk_period*10;	
		valider<='0';
		wait for clk_period*10;
		
				--saisie dun password erroné

		wait for clk_period*10;	
		k<="1000";	
		r<="1000";
      wait for clk_period*10;		
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";			
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;	
		valider<='1';	
		wait for clk_period*10;	
		valider<='0';
		
				--saisie dun password erroné

		wait for clk_period*10;	
		k<="1000";	
		r<="1000";
      wait for clk_period*10;		
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";			
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;	
		valider<='1';	
		wait for clk_period*20;	
		valider<='0';
		wait for clk_period*10;	

		--saisie dun password erroné

		k<="1000";	
		r<="1000";
      wait for clk_period*10;		
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";			
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="1000";
		r<="1000";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;	
		valider<='1';	
		wait for clk_period*10;	
		valider<='0';
		wait for clk_period*10;
		
		--saisie dun password corretce
		
		wait for clk_period*10;
		k<="0100";	
		r<="0100";
      wait for clk_period*10;		
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="0100";
		r<="0100";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";			
		wait for clk_period*10;
		k<="0100";
		r<="0100";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="0100";
		r<="0100";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;	
		valider<='1';	
		wait for clk_period*10;	
		valider<='0';	
		
				--saisie dun password corretce

		wait for clk_period*10;
		k<="0100";	
		r<="0100";
      wait for clk_period*10;		
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="0100";
		r<="0100";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";			
		wait for clk_period*10;
		k<="0100";
		r<="0100";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		wait for clk_period*10;
		k<="0100";
		r<="0100";
      wait for clk_period*10;	
		k<="0000";
		r<="0000";		
		
		wait for clk_period*10;	
		valider<='1';	
		wait for clk_period*10;	
		valider<='0';
	

		wait for clk_period*10;	



      -- insert stimulus here 

      wait;
   end process;

END;
