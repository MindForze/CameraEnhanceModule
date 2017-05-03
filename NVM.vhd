LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY NVM IS

	PORT(
		CLK : IN STD_LOGIC;
		RST  : IN STD_LOGIC;
		-- 1kB
		ADDRESS : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		DATAOUT : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));

END ENTITY NVM;


ARCHITECTURE a_NVM OF NVM IS
	
	TYPE RAM_TYPE IS ARRAY(0 TO 4095) OF STD_LOGIC_VECTOR(127 DOWNTO 0);
	SIGNAL DATAMEMORY : RAM_TYPE;

	BEGIN
		process(CLK, RST)
		BEGIN
		IF RST = '1' THEN
		DATAMEMORY <= ((others => (others  => '0')));
		END IF;
		END PROCESS;
		DATAOUT <= DATAMEMORY (TO_INTEGER(UNSIGNED(ADDRESS))); -- Async.

END a_NVM;
