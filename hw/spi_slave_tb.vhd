library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity spi_slave_tb is
-- No entity ports needed for a testbench
end spi_slave_tb;

architecture Behavioral of spi_slave_tb is

  -- Component declaration for the Unit Under Test (UUT)
  component spi_slave
    
    Port (   
      out_frame_saved : out std_logic_vector (3 downto 0);
      out_send_off: out std_logic;
      --out_state_print : out std_logic_vector (1 downto 0);
      in_spi_clk : in std_logic;
      in_spi_cs: in std_logic;
      in_internal_clk : in std_logic;
      in_spi_mosi : in std_logic
    );
  end component;

  -- Signals to connect to the UUT
  signal out_frame_saved_tb : std_logic_vector(3 downto 0);
  signal out_state_print_tb : std_logic_vector(1 downto 0);
  signal out_send_off_tb : std_logic;
  signal in_spi_clk_tb : std_logic := '0';
  signal in_spi_cs_tb : std_logic := '1';
  signal in_internal_clk_tb : std_logic := '0';
  signal in_spi_mosi_tb : std_logic := '0';

  -- Clock period constants
  constant spi_clk_period : time := 120 ns;
  constant internal_clk_period : time := 10 ns;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut: spi_slave
    
    port map (
      out_frame_saved => out_frame_saved_tb,
      out_send_off => out_send_off_tb,
      --out_state_print => out_state_print_tb,
      in_spi_clk => in_spi_clk_tb,
      in_spi_cs => in_spi_cs_tb,
      in_internal_clk => in_internal_clk_tb,
      in_spi_mosi => in_spi_mosi_tb
    );

  -- Clock generation for internal clock
  process
  begin    
      in_internal_clk_tb <= '1';
      wait for internal_clk_period / 2;
      in_internal_clk_tb <= '0';
      wait for internal_clk_period / 2;
  end process;

  -- Clock generation for SPI clock
  process
  begin         
          in_spi_clk_tb <= '0';
          wait for spi_clk_period / 2;
          in_spi_clk_tb <= '1';
          wait for spi_clk_period / 2;
         
  end process;

  -- Stimulus process to send data
  process
  begin
    -- Initialization
    wait for 120 ns;
    
    -- Start a SPI frame (activate chip select)
    in_spi_cs_tb <= '0';
    
    -- Sending 4 bits over MOSI (bit by bit)

    -- Send '1'
    in_spi_mosi_tb <= '1';
    wait for spi_clk_period;
    
    -- Send '0'
    in_spi_mosi_tb <= '1';
    wait for spi_clk_period;
    
    -- Send '1'
    in_spi_mosi_tb <= '1';
    wait for spi_clk_period;
    
    -- Send '0'
    in_spi_mosi_tb <= '1';
    wait for 1*spi_clk_period;
    
    -- Deactivate chip select after frame transmission
    in_spi_cs_tb <= '1';
    
    -- Wait some time to observe the output
    wait for 120 ns;
    
    -- Stop simulation
   
  end process;

end Behavioral;
