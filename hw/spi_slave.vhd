----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.09.2024 09:12:39
-- Design Name: 
-- Module Name: spi_slave - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-----------------------------------------------------------------------
-- Simple SPI SLAVE component 
-- 
-----------------------------------------------------------------------
entity spi_slave is
  generic (
    length_frame: integer := 4; 
    length_header: integer := 0
  );
  Port (   
    -- OUTPUT SIGNALS
    out_frame_saved : out std_logic_vector (length_frame+length_header-1 downto 0);
    out_send_off: out std_logic;
    --out_state_print : out std_logic_vector (1 downto 0); -- Checking Signal (Use to debug the program)
    -- INPUT SIGNALS
    in_spi_clk : in std_logic;
    in_spi_cs: in std_logic;
    in_internal_clk : in std_logic;
    in_spi_mosi : in std_logic
  );
end spi_slave;

architecture Behavioral of spi_slave is

type state_type is (idle, reading);
signal state, next_state: state_type := idle;

-- Variables internas
signal position : integer range 0 to length_frame+length_header-1 := length_frame+length_header-1;
signal frame_buffer : std_logic_vector (length_frame+length_header-1 downto 0) := (others => '0');
signal internal_flag : std_logic := '0'; 
begin

process (in_internal_clk) -- Proceso de cambio de estado
begin
    if rising_edge(in_internal_clk) then
        -- Cambio de estado
        state <= next_state;
         
    end if; 
end process;

process (state, in_spi_cs, in_spi_clk)
begin
   
   if in_spi_cs = '1' then
     next_state <= idle;
   end if; 
   
   if internal_flag = '1' then
    internal_flag <= '0';
    out_frame_saved <= frame_buffer;
   end if;
   
    case state is
        
        when idle =>
            --out_state_print <= "10";
            out_send_off <= '0';  -- No se ha completado la recepci n
            if in_spi_cs = '0' then                
                position <= length_frame + length_header - 1; -- Reinicia la posici n y el buffer
                frame_buffer <= (others => '0');
                next_state <= reading;  -- Pasa al estado de lectura
             end if;
        
        when reading =>
            --out_state_print <= "01";
            if rising_edge(in_spi_clk) then
                frame_buffer(position) <= in_spi_mosi;
                if position > 0 then-- Actualiza la posici n
                    position <= position - 1;
                else
                    out_send_off <= '1';
                    internal_flag <= '1';                                                           
                    next_state <= idle; -- Si se ha completado la lectura del frame
                end if;
                
            end if;
     
    end case;
end process;
end Behavioral;
