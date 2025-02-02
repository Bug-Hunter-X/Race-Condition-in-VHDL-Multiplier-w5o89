```vhdl
ENTITY multiplier IS
  GENERIC (width : INTEGER := 8);
  PORT ( 
    clk : IN STD_LOGIC;
    a, b : IN STD_LOGIC_VECTOR(width-1 DOWNTO 0);
    result : OUT STD_LOGIC_VECTOR(2*width-1 DOWNTO 0)
  );
END ENTITY;

ARCHITECTURE behavioral OF multiplier IS
  SIGNAL product : UNSIGNED(2*width-1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL result_int : STD_LOGIC_VECTOR(2*width-1 DOWNTO 0);
BEGIN
  PROCESS (clk)
  BEGIN
    IF rising_edge(clk) THEN
      product <= UNSIGNED(a) * UNSIGNED(b);
    END IF;
  END PROCESS;

  PROCESS (product)
  BEGIN
    result_int <= STD_LOGIC_VECTOR(product);
    result <= result_int;
  END PROCESS;
END ARCHITECTURE;
```