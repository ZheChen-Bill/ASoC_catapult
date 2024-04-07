
--------> /usr/cadtool/mentor/Catapult/2023.1/Mgc_home/pkgs/siflibs/ccs_in_wait_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_in_wait_pkg_v1 IS

COMPONENT ccs_in_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    idat   : OUT std_logic_vector(width-1 DOWNTO 0);
    rdy    : OUT std_logic;
    ivld   : OUT std_logic;
    dat    : IN  std_logic_vector(width-1 DOWNTO 0);
    irdy   : IN  std_logic;
    vld    : IN  std_logic
   );
END COMPONENT;

END ccs_in_wait_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_in_wait_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    idat  : OUT std_logic_vector(width-1 DOWNTO 0);
    rdy   : OUT std_logic;
    ivld  : OUT std_logic;
    dat   : IN  std_logic_vector(width-1 DOWNTO 0);
    irdy  : IN  std_logic;
    vld   : IN  std_logic
  );
END ccs_in_wait_v1;

ARCHITECTURE beh OF ccs_in_wait_v1 IS
  constant stall_const : std_logic := '0';
  SIGNAL stall_ctrl : std_logic;
BEGIN
  stall_ctrl <= stall_const;

  idat <= dat;
  rdy  <= irdy and not stall_ctrl;
  ivld <= vld and not stall_ctrl;

END beh;


--------> /usr/cadtool/mentor/Catapult/2023.1/Mgc_home/pkgs/siflibs/ccs_out_wait_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_out_wait_pkg_v1 IS

COMPONENT ccs_out_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    dat    : OUT std_logic_vector(width-1 DOWNTO 0);
    irdy   : OUT std_logic;
    vld    : OUT std_logic;
    idat   : IN  std_logic_vector(width-1 DOWNTO 0);
    rdy    : IN  std_logic;
    ivld   : IN  std_logic
  );
END COMPONENT;

END ccs_out_wait_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_out_wait_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    dat   : OUT std_logic_vector(width-1 DOWNTO 0);
    irdy  : OUT std_logic;
    vld   : OUT std_logic;
    idat  : IN  std_logic_vector(width-1 DOWNTO 0);
    rdy   : IN  std_logic;
    ivld  : IN  std_logic
  );
END ccs_out_wait_v1;

ARCHITECTURE beh OF ccs_out_wait_v1 IS
  constant stall_const : std_logic := '0';
  SIGNAL stall_ctrl : std_logic;
BEGIN
  stall_ctrl <= stall_const;

  dat  <= idat;
  irdy <= rdy and not stall_ctrl;
  vld  <= ivld and not stall_ctrl;

END beh;


--------> /usr/cadtool/mentor/Catapult/2023.1/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
PACKAGE mgc_io_sync_pkg_v2 IS

COMPONENT mgc_io_sync_v2
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END COMPONENT;

END mgc_io_sync_pkg_v2;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_io_sync_v2 IS
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END mgc_io_sync_v2;

ARCHITECTURE beh OF mgc_io_sync_v2 IS
BEGIN

  lz <= ld;

END beh;


--------> /usr/cadtool/mentor/Catapult/2023.1/Mgc_home/pkgs/siflibs/ccs_in_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_in_pkg_v1 IS

COMPONENT ccs_in_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    idat   : OUT std_logic_vector(width-1 DOWNTO 0);
    dat    : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

END ccs_in_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_in_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    idat  : OUT std_logic_vector(width-1 DOWNTO 0);
    dat   : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END ccs_in_v1;

ARCHITECTURE beh OF ccs_in_v1 IS
BEGIN

  idat <= dat;

END beh;


--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    2023.1/1033555 Production Release
--  HLS Date:       Mon Feb 13 11:32:25 PST 2023
-- 
--  Generated by:   m111061545@ws41
--  Generated date: Tue Mar 26 18:29:00 2024
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    fir_run_run_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_run_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    SHIFT_C_0_tr0 : IN STD_LOGIC
  );
END fir_run_run_fsm;

ARCHITECTURE v1 OF fir_run_run_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for fir_run_run_fsm_1
  TYPE fir_run_run_fsm_1_ST IS (main_C_0, SHIFT_C_0, main_C_1);

  SIGNAL state_var : fir_run_run_fsm_1_ST;
  SIGNAL state_var_NS : fir_run_run_fsm_1_ST;

BEGIN
  fir_run_run_fsm_1 : PROCESS (SHIFT_C_0_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN SHIFT_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "010");
        IF ( SHIFT_C_0_tr0 = '1' ) THEN
          state_var_NS <= main_C_1;
        ELSE
          state_var_NS <= SHIFT_C_0;
        END IF;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "100");
        state_var_NS <= main_C_0;
      -- main_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "001");
        state_var_NS <= SHIFT_C_0;
    END CASE;
  END PROCESS fir_run_run_fsm_1;

  fir_run_run_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= main_C_0;
      ELSE
        IF ( run_wen = '1' ) THEN
          state_var <= state_var_NS;
        END IF;
      END IF;
    END IF;
  END PROCESS fir_run_run_fsm_1_REG;

END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_staller
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_staller IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_wen : OUT STD_LOGIC;
    run_wten : OUT STD_LOGIC;
    input_rsci_wen_comp : IN STD_LOGIC;
    output_rsci_wen_comp : IN STD_LOGIC
  );
END fir_run_staller;

ARCHITECTURE v1 OF fir_run_staller IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL run_wen_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  run_wen <= run_wen_drv;

  run_wen_drv <= input_rsci_wen_comp AND output_rsci_wen_comp;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        run_wten <= '0';
      ELSE
        run_wten <= NOT run_wen_drv;
      END IF;
    END IF;
  END PROCESS;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl IS
  PORT(
    run_wten : IN STD_LOGIC;
    coeffs_triosy_obj_iswt0 : IN STD_LOGIC;
    coeffs_triosy_obj_biwt : OUT STD_LOGIC
  );
END fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl;

ARCHITECTURE v1 OF fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  coeffs_triosy_obj_biwt <= (NOT run_wten) AND coeffs_triosy_obj_iswt0;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_output_rsci_output_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_output_rsci_output_wait_ctrl IS
  PORT(
    output_rsci_iswt0 : IN STD_LOGIC;
    output_rsci_biwt : OUT STD_LOGIC;
    output_rsci_irdy : IN STD_LOGIC
  );
END fir_run_output_rsci_output_wait_ctrl;

ARCHITECTURE v1 OF fir_run_output_rsci_output_wait_ctrl IS
  -- Default Constants

BEGIN
  output_rsci_biwt <= output_rsci_iswt0 AND output_rsci_irdy;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_input_rsci_input_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_input_rsci_input_wait_ctrl IS
  PORT(
    input_rsci_iswt0 : IN STD_LOGIC;
    input_rsci_biwt : OUT STD_LOGIC;
    input_rsci_ivld : IN STD_LOGIC
  );
END fir_run_input_rsci_input_wait_ctrl;

ARCHITECTURE v1 OF fir_run_input_rsci_input_wait_ctrl IS
  -- Default Constants

BEGIN
  input_rsci_biwt <= input_rsci_iswt0 AND input_rsci_ivld;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_coeffs_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_coeffs_triosy_obj IS
  PORT(
    coeffs_triosy_lz : OUT STD_LOGIC;
    run_wten : IN STD_LOGIC;
    coeffs_triosy_obj_iswt0 : IN STD_LOGIC
  );
END fir_run_coeffs_triosy_obj;

ARCHITECTURE v1 OF fir_run_coeffs_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_triosy_obj_biwt : STD_LOGIC;

  COMPONENT fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl
    PORT(
      run_wten : IN STD_LOGIC;
      coeffs_triosy_obj_iswt0 : IN STD_LOGIC;
      coeffs_triosy_obj_biwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  coeffs_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => coeffs_triosy_obj_biwt,
      lz => coeffs_triosy_lz
    );
  fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl_inst : fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl
    PORT MAP(
      run_wten => run_wten,
      coeffs_triosy_obj_iswt0 => coeffs_triosy_obj_iswt0,
      coeffs_triosy_obj_biwt => coeffs_triosy_obj_biwt
    );
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_output_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_output_rsci IS
  PORT(
    output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    output_rsc_vld : OUT STD_LOGIC;
    output_rsc_rdy : IN STD_LOGIC;
    output_rsci_oswt : IN STD_LOGIC;
    output_rsci_wen_comp : OUT STD_LOGIC;
    output_rsci_idat : IN STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
END fir_run_output_rsci;

ARCHITECTURE v1 OF fir_run_output_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL output_rsci_biwt : STD_LOGIC;
  SIGNAL output_rsci_irdy : STD_LOGIC;

  SIGNAL output_rsci_idat_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL output_rsci_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT fir_run_output_rsci_output_wait_ctrl
    PORT(
      output_rsci_iswt0 : IN STD_LOGIC;
      output_rsci_biwt : OUT STD_LOGIC;
      output_rsci_irdy : IN STD_LOGIC
    );
  END COMPONENT;
BEGIN
  output_rsci : work.ccs_out_wait_pkg_v1.ccs_out_wait_v1
    GENERIC MAP(
      rscid => 3,
      width => 8
      )
    PORT MAP(
      irdy => output_rsci_irdy,
      ivld => output_rsci_oswt,
      idat => output_rsci_idat_1,
      rdy => output_rsc_rdy,
      vld => output_rsc_vld,
      dat => output_rsci_dat
    );
  output_rsci_idat_1 <= output_rsci_idat;
  output_rsc_dat <= output_rsci_dat;

  fir_run_output_rsci_output_wait_ctrl_inst : fir_run_output_rsci_output_wait_ctrl
    PORT MAP(
      output_rsci_iswt0 => output_rsci_oswt,
      output_rsci_biwt => output_rsci_biwt,
      output_rsci_irdy => output_rsci_irdy
    );
  output_rsci_wen_comp <= (NOT output_rsci_oswt) OR output_rsci_biwt;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_input_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_input_rsci IS
  PORT(
    input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    input_rsc_vld : IN STD_LOGIC;
    input_rsc_rdy : OUT STD_LOGIC;
    input_rsci_oswt : IN STD_LOGIC;
    input_rsci_wen_comp : OUT STD_LOGIC;
    input_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
END fir_run_input_rsci;

ARCHITECTURE v1 OF fir_run_input_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL input_rsci_biwt : STD_LOGIC;
  SIGNAL input_rsci_ivld : STD_LOGIC;
  SIGNAL input_rsci_idat : STD_LOGIC_VECTOR (7 DOWNTO 0);

  SIGNAL input_rsci_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL input_rsci_idat_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT fir_run_input_rsci_input_wait_ctrl
    PORT(
      input_rsci_iswt0 : IN STD_LOGIC;
      input_rsci_biwt : OUT STD_LOGIC;
      input_rsci_ivld : IN STD_LOGIC
    );
  END COMPONENT;
BEGIN
  input_rsci : work.ccs_in_wait_pkg_v1.ccs_in_wait_v1
    GENERIC MAP(
      rscid => 1,
      width => 8
      )
    PORT MAP(
      rdy => input_rsc_rdy,
      vld => input_rsc_vld,
      dat => input_rsci_dat,
      irdy => input_rsci_oswt,
      ivld => input_rsci_ivld,
      idat => input_rsci_idat_1
    );
  input_rsci_dat <= input_rsc_dat;
  input_rsci_idat <= input_rsci_idat_1;

  fir_run_input_rsci_input_wait_ctrl_inst : fir_run_input_rsci_input_wait_ctrl
    PORT MAP(
      input_rsci_iswt0 => input_rsci_oswt,
      input_rsci_biwt => input_rsci_biwt,
      input_rsci_ivld => input_rsci_ivld
    );
  input_rsci_idat_mxwt <= input_rsci_idat;
  input_rsci_wen_comp <= (NOT input_rsci_oswt) OR input_rsci_biwt;
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    input_rsc_vld : IN STD_LOGIC;
    input_rsc_rdy : OUT STD_LOGIC;
    coeffs_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    coeffs_triosy_lz : OUT STD_LOGIC;
    output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    output_rsc_vld : OUT STD_LOGIC;
    output_rsc_rdy : IN STD_LOGIC
  );
END fir_run;

ARCHITECTURE v1 OF fir_run IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL run_wen : STD_LOGIC;
  SIGNAL run_wten : STD_LOGIC;
  SIGNAL input_rsci_wen_comp : STD_LOGIC;
  SIGNAL input_rsci_idat_mxwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL coeffs_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL output_rsci_wen_comp : STD_LOGIC;
  SIGNAL output_rsci_idat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL SHIFT_acc_1_tmp : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL or_dcpl_5 : STD_LOGIC;
  SIGNAL or_dcpl_6 : STD_LOGIC;
  SIGNAL or_dcpl_7 : STD_LOGIC;
  SIGNAL or_dcpl_8 : STD_LOGIC;
  SIGNAL or_dcpl_9 : STD_LOGIC;
  SIGNAL or_dcpl_10 : STD_LOGIC;
  SIGNAL or_dcpl_11 : STD_LOGIC;
  SIGNAL or_dcpl_12 : STD_LOGIC;
  SIGNAL or_dcpl_14 : STD_LOGIC;
  SIGNAL or_dcpl_16 : STD_LOGIC;
  SIGNAL SHIFT_i_3_0_sva_2_0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL reg_input_rsci_oswt_cse : STD_LOGIC;
  SIGNAL reg_coeffs_triosy_obj_iswt0_cse : STD_LOGIC;
  SIGNAL MAC_and_m1c : STD_LOGIC;
  SIGNAL MAC_and_m1c_1 : STD_LOGIC;
  SIGNAL MAC_and_m1c_2 : STD_LOGIC;
  SIGNAL MAC_and_m1c_3 : STD_LOGIC;
  SIGNAL MAC_and_m1c_4 : STD_LOGIC;
  SIGNAL MAC_and_m1c_5 : STD_LOGIC;
  SIGNAL or_13_cse : STD_LOGIC;
  SIGNAL MAC_i_3_0_sva_2_0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL MAC_and_12_m1c : STD_LOGIC;
  SIGNAL regs_0_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_3_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_4_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_2_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_5_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_1_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_6_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_7_lpi_2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL temp_sva : STD_LOGIC_VECTOR (18 DOWNTO 0);
  SIGNAL regs_0_lpi_2_mx1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL temp_sva_2 : STD_LOGIC_VECTOR (18 DOWNTO 0);
  SIGNAL SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1 : STD_LOGIC_VECTOR (7
      DOWNTO 0);
  SIGNAL MAC_i_3_0_sva_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL SHIFT_else_acc_1_tmp : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL and_60_cse : STD_LOGIC;

  SIGNAL not_22_nl : STD_LOGIC;
  SIGNAL not_31_nl : STD_LOGIC;
  SIGNAL or_15_nl : STD_LOGIC;
  SIGNAL MAC_mul_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL MAC_mux_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL MAC_MAC_mux1h_nl : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL MAC_nor_nl : STD_LOGIC;
  SIGNAL MAC_or_nl : STD_LOGIC;
  SIGNAL MAC_and_6_nl : STD_LOGIC;
  SIGNAL MAC_and_7_nl : STD_LOGIC;
  SIGNAL MAC_and_8_nl : STD_LOGIC;
  SIGNAL MAC_and_9_nl : STD_LOGIC;
  SIGNAL MAC_and_10_nl : STD_LOGIC;
  SIGNAL MAC_and_11_nl : STD_LOGIC;
  SIGNAL MAC_and_20_nl : STD_LOGIC;
  SIGNAL coeffs_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL coeffs_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT fir_run_input_rsci
    PORT(
      input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      input_rsc_vld : IN STD_LOGIC;
      input_rsc_rdy : OUT STD_LOGIC;
      input_rsci_oswt : IN STD_LOGIC;
      input_rsci_wen_comp : OUT STD_LOGIC;
      input_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL fir_run_input_rsci_inst_input_rsc_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fir_run_input_rsci_inst_input_rsci_idat_mxwt : STD_LOGIC_VECTOR (7 DOWNTO
      0);

  COMPONENT fir_run_output_rsci
    PORT(
      output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      output_rsc_vld : OUT STD_LOGIC;
      output_rsc_rdy : IN STD_LOGIC;
      output_rsci_oswt : IN STD_LOGIC;
      output_rsci_wen_comp : OUT STD_LOGIC;
      output_rsci_idat : IN STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL fir_run_output_rsci_inst_output_rsc_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fir_run_output_rsci_inst_output_rsci_idat : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT fir_run_coeffs_triosy_obj
    PORT(
      coeffs_triosy_lz : OUT STD_LOGIC;
      run_wten : IN STD_LOGIC;
      coeffs_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT fir_run_staller
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_wen : OUT STD_LOGIC;
      run_wten : OUT STD_LOGIC;
      input_rsci_wen_comp : IN STD_LOGIC;
      output_rsci_wen_comp : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT fir_run_run_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      SHIFT_C_0_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL fir_run_run_fsm_inst_fsm_output : STD_LOGIC_VECTOR (2 DOWNTO 0);

  FUNCTION CONV_SL_1_1(input_val:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input_val THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX1HOT_v_8_9_2(input_8 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(8 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
      tmp := (OTHERS=>sel( 5));
      result := result or ( input_5 and tmp);
      tmp := (OTHERS=>sel( 6));
      result := result or ( input_6 and tmp);
      tmp := (OTHERS=>sel( 7));
      result := result or ( input_7 and tmp);
      tmp := (OTHERS=>sel( 8));
      result := result or ( input_8 and tmp);
    RETURN result;
  END;

  FUNCTION MUX_v_19_2_2(input_0 : STD_LOGIC_VECTOR(18 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(18 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(18 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_3_2_2(input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_8_2_2(input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_8_7_2(input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "000" =>
          result := input_0;
        WHEN "001" =>
          result := input_1;
        WHEN "010" =>
          result := input_2;
        WHEN "011" =>
          result := input_3;
        WHEN "100" =>
          result := input_4;
        WHEN "101" =>
          result := input_5;
        WHEN others =>
          result := input_6;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_8_8_2(input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "000" =>
          result := input_0;
        WHEN "001" =>
          result := input_1;
        WHEN "010" =>
          result := input_2;
        WHEN "011" =>
          result := input_3;
        WHEN "100" =>
          result := input_4;
        WHEN "101" =>
          result := input_5;
        WHEN "110" =>
          result := input_6;
        WHEN others =>
          result := input_7;
      END CASE;
    RETURN result;
  END;

BEGIN
  coeffs_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 2,
      width => 64
      )
    PORT MAP(
      dat => coeffs_rsci_dat,
      idat => coeffs_rsci_idat_1
    );
  coeffs_rsci_dat <= coeffs_rsc_dat;
  coeffs_rsci_idat <= coeffs_rsci_idat_1;

  fir_run_input_rsci_inst : fir_run_input_rsci
    PORT MAP(
      input_rsc_dat => fir_run_input_rsci_inst_input_rsc_dat,
      input_rsc_vld => input_rsc_vld,
      input_rsc_rdy => input_rsc_rdy,
      input_rsci_oswt => reg_input_rsci_oswt_cse,
      input_rsci_wen_comp => input_rsci_wen_comp,
      input_rsci_idat_mxwt => fir_run_input_rsci_inst_input_rsci_idat_mxwt
    );
  fir_run_input_rsci_inst_input_rsc_dat <= input_rsc_dat;
  input_rsci_idat_mxwt <= fir_run_input_rsci_inst_input_rsci_idat_mxwt;

  fir_run_output_rsci_inst : fir_run_output_rsci
    PORT MAP(
      output_rsc_dat => fir_run_output_rsci_inst_output_rsc_dat,
      output_rsc_vld => output_rsc_vld,
      output_rsc_rdy => output_rsc_rdy,
      output_rsci_oswt => reg_coeffs_triosy_obj_iswt0_cse,
      output_rsci_wen_comp => output_rsci_wen_comp,
      output_rsci_idat => fir_run_output_rsci_inst_output_rsci_idat
    );
  output_rsc_dat <= fir_run_output_rsci_inst_output_rsc_dat;
  fir_run_output_rsci_inst_output_rsci_idat <= output_rsci_idat;

  fir_run_coeffs_triosy_obj_inst : fir_run_coeffs_triosy_obj
    PORT MAP(
      coeffs_triosy_lz => coeffs_triosy_lz,
      run_wten => run_wten,
      coeffs_triosy_obj_iswt0 => reg_coeffs_triosy_obj_iswt0_cse
    );
  fir_run_staller_inst : fir_run_staller
    PORT MAP(
      clk => clk,
      rst => rst,
      run_wen => run_wen,
      run_wten => run_wten,
      input_rsci_wen_comp => input_rsci_wen_comp,
      output_rsci_wen_comp => output_rsci_wen_comp
    );
  fir_run_run_fsm_inst : fir_run_run_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      run_wen => run_wen,
      fsm_output => fir_run_run_fsm_inst_fsm_output,
      SHIFT_C_0_tr0 => and_60_cse
    );
  fsm_output <= fir_run_run_fsm_inst_fsm_output;

  or_13_cse <= or_dcpl_5 OR (NOT (SHIFT_i_3_0_sva_2_0(1)));
  and_60_cse <= (MAC_i_3_0_sva_2(3)) AND (SHIFT_acc_1_tmp(3));
  or_15_nl <= or_dcpl_11 OR (SHIFT_i_3_0_sva_2_0(1));
  regs_0_lpi_2_mx1 <= MUX_v_8_2_2(input_rsci_idat_mxwt, regs_0_lpi_2, or_15_nl);
  MAC_and_m1c <= CONV_SL_1_1(MAC_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("001"));
  MAC_and_m1c_1 <= CONV_SL_1_1(MAC_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("010"));
  MAC_and_m1c_2 <= CONV_SL_1_1(MAC_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("011"));
  MAC_and_m1c_3 <= CONV_SL_1_1(MAC_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("100"));
  MAC_and_m1c_4 <= CONV_SL_1_1(MAC_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("101"));
  MAC_and_m1c_5 <= CONV_SL_1_1(MAC_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("110"));
  MAC_and_12_m1c <= CONV_SL_1_1(MAC_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("111"));
  MAC_mux_nl <= MUX_v_8_8_2((coeffs_rsci_idat(7 DOWNTO 0)), (coeffs_rsci_idat(15
      DOWNTO 8)), (coeffs_rsci_idat(23 DOWNTO 16)), (coeffs_rsci_idat(31 DOWNTO 24)),
      (coeffs_rsci_idat(39 DOWNTO 32)), (coeffs_rsci_idat(47 DOWNTO 40)), (coeffs_rsci_idat(55
      DOWNTO 48)), (coeffs_rsci_idat(63 DOWNTO 56)), MAC_i_3_0_sva_2_0);
  MAC_nor_nl <= NOT(CONV_SL_1_1(MAC_i_3_0_sva_2_0/=STD_LOGIC_VECTOR'("000")));
  MAC_or_nl <= ((NOT or_dcpl_8) AND MAC_and_m1c) OR ((NOT or_dcpl_12) AND MAC_and_m1c_1)
      OR ((NOT or_dcpl_14) AND MAC_and_m1c_2) OR ((NOT or_dcpl_16) AND MAC_and_m1c_3)
      OR ((NOT or_dcpl_6) AND MAC_and_m1c_4) OR ((NOT or_dcpl_10) AND MAC_and_m1c_5)
      OR ((NOT or_13_cse) AND MAC_and_12_m1c);
  MAC_and_6_nl <= or_dcpl_8 AND MAC_and_m1c;
  MAC_and_7_nl <= or_dcpl_12 AND MAC_and_m1c_1;
  MAC_and_8_nl <= or_dcpl_14 AND MAC_and_m1c_2;
  MAC_and_9_nl <= or_dcpl_16 AND MAC_and_m1c_3;
  MAC_and_10_nl <= or_dcpl_6 AND MAC_and_m1c_4;
  MAC_and_11_nl <= or_dcpl_10 AND MAC_and_m1c_5;
  MAC_and_20_nl <= or_13_cse AND MAC_and_12_m1c;
  MAC_MAC_mux1h_nl <= MUX1HOT_v_8_9_2(regs_0_lpi_2_mx1, SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1,
      regs_1_lpi_2, regs_2_lpi_2, regs_3_lpi_2, regs_4_lpi_2, regs_5_lpi_2, regs_6_lpi_2,
      regs_7_lpi_2, STD_LOGIC_VECTOR'( MAC_nor_nl & MAC_or_nl & MAC_and_6_nl & MAC_and_7_nl
      & MAC_and_8_nl & MAC_and_9_nl & MAC_and_10_nl & MAC_and_11_nl & MAC_and_20_nl));
  MAC_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(MAC_mux_nl) * SIGNED(MAC_MAC_mux1h_nl)),
      16));
  temp_sva_2 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(temp_sva) + CONV_SIGNED(SIGNED(MAC_mul_nl),
      19), 19));
  SHIFT_else_acc_1_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(SHIFT_i_3_0_sva_2_0)
      + UNSIGNED'( "111"), 3));
  SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1 <= MUX_v_8_7_2(regs_0_lpi_2,
      regs_1_lpi_2, regs_2_lpi_2, regs_3_lpi_2, regs_4_lpi_2, regs_5_lpi_2, regs_6_lpi_2,
      SHIFT_else_acc_1_tmp);
  SHIFT_acc_1_tmp <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(SHIFT_i_3_0_sva_2_0),
      3), 4) + SIGNED'( "1111"), 4));
  MAC_i_3_0_sva_2 <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_UNSIGNED(UNSIGNED(MAC_i_3_0_sva_2_0),
      3), 4) + SIGNED'( "1111"), 4));
  or_dcpl_5 <= NOT((SHIFT_i_3_0_sva_2_0(2)) AND (SHIFT_i_3_0_sva_2_0(0)));
  or_dcpl_6 <= or_dcpl_5 OR (SHIFT_i_3_0_sva_2_0(1));
  or_dcpl_7 <= (SHIFT_i_3_0_sva_2_0(2)) OR (NOT (SHIFT_i_3_0_sva_2_0(0)));
  or_dcpl_8 <= or_dcpl_7 OR (SHIFT_i_3_0_sva_2_0(1));
  or_dcpl_9 <= (NOT (SHIFT_i_3_0_sva_2_0(2))) OR (SHIFT_i_3_0_sva_2_0(0));
  or_dcpl_10 <= or_dcpl_9 OR (NOT (SHIFT_i_3_0_sva_2_0(1)));
  or_dcpl_11 <= (SHIFT_i_3_0_sva_2_0(2)) OR (SHIFT_i_3_0_sva_2_0(0));
  or_dcpl_12 <= or_dcpl_11 OR (NOT (SHIFT_i_3_0_sva_2_0(1)));
  or_dcpl_14 <= or_dcpl_7 OR (NOT (SHIFT_i_3_0_sva_2_0(1)));
  or_dcpl_16 <= or_dcpl_9 OR (SHIFT_i_3_0_sva_2_0(1));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_input_rsci_oswt_cse <= '0';
        SHIFT_i_3_0_sva_2_0 <= STD_LOGIC_VECTOR'( "000");
        MAC_i_3_0_sva_2_0 <= STD_LOGIC_VECTOR'( "000");
        temp_sva <= STD_LOGIC_VECTOR'( "0000000000000000000");
        reg_coeffs_triosy_obj_iswt0_cse <= '0';
      ELSIF ( run_wen = '1' ) THEN
        reg_input_rsci_oswt_cse <= (NOT((SHIFT_acc_1_tmp(0)) OR and_60_cse)) AND
            CONV_SL_1_1(SHIFT_acc_1_tmp(2 DOWNTO 1)=STD_LOGIC_VECTOR'("00")) AND
            (fsm_output(1));
        SHIFT_i_3_0_sva_2_0 <= MUX_v_3_2_2((SHIFT_acc_1_tmp(2 DOWNTO 0)), STD_LOGIC_VECTOR'("111"),
            not_22_nl);
        MAC_i_3_0_sva_2_0 <= MUX_v_3_2_2((MAC_i_3_0_sva_2(2 DOWNTO 0)), STD_LOGIC_VECTOR'("111"),
            not_31_nl);
        temp_sva <= MUX_v_19_2_2(STD_LOGIC_VECTOR'("0000000000000000000"), temp_sva_2,
            (fsm_output(1)));
        reg_coeffs_triosy_obj_iswt0_cse <= and_60_cse AND (fsm_output(1));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_5_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (CONV_SL_1_1(SHIFT_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("101")) AND (fsm_output(1))
          AND (CONV_SL_1_1(SHIFT_else_acc_1_tmp/=STD_LOGIC_VECTOR'("101"))) AND run_wen)
          = '1' ) THEN
        regs_5_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_1_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (CONV_SL_1_1(SHIFT_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("001")) AND (fsm_output(1))
          AND (CONV_SL_1_1(SHIFT_else_acc_1_tmp/=STD_LOGIC_VECTOR'("001"))) AND run_wen)
          = '1' ) THEN
        regs_1_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_6_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (CONV_SL_1_1(SHIFT_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("110")) AND (fsm_output(1))
          AND (CONV_SL_1_1(SHIFT_else_acc_1_tmp/=STD_LOGIC_VECTOR'("110"))) AND run_wen)
          = '1' ) THEN
        regs_6_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_2_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (CONV_SL_1_1(SHIFT_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("010")) AND (fsm_output(1))
          AND (CONV_SL_1_1(SHIFT_else_acc_1_tmp/=STD_LOGIC_VECTOR'("010"))) AND run_wen)
          = '1' ) THEN
        regs_2_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_7_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (run_wen AND (NOT((CONV_SL_1_1(SHIFT_acc_1_tmp(2 DOWNTO 0)=STD_LOGIC_VECTOR'("111")))
          OR and_60_cse)) AND (NOT or_13_cse)) = '1' ) THEN
        regs_7_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_3_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (CONV_SL_1_1(SHIFT_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("011")) AND (fsm_output(1))
          AND (CONV_SL_1_1(SHIFT_else_acc_1_tmp/=STD_LOGIC_VECTOR'("011"))) AND run_wen)
          = '1' ) THEN
        regs_3_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_0_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( ((CONV_SL_1_1(SHIFT_acc_1_tmp(2 DOWNTO 0)/=STD_LOGIC_VECTOR'("000"))
          OR and_60_cse) AND (fsm_output(1)) AND run_wen AND CONV_SL_1_1(SHIFT_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("000")))
          = '1' ) THEN
        regs_0_lpi_2 <= regs_0_lpi_2_mx1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        regs_4_lpi_2 <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (CONV_SL_1_1(SHIFT_i_3_0_sva_2_0=STD_LOGIC_VECTOR'("100")) AND (fsm_output(1))
          AND (CONV_SL_1_1(SHIFT_else_acc_1_tmp/=STD_LOGIC_VECTOR'("100"))) AND run_wen)
          = '1' ) THEN
        regs_4_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        output_rsci_idat <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( (run_wen AND and_60_cse AND (fsm_output(1))) = '1' ) THEN
        output_rsci_idat <= temp_sva_2(18 DOWNTO 11);
      END IF;
    END IF;
  END PROCESS;
  not_22_nl <= NOT (fsm_output(1));
  not_31_nl <= NOT (fsm_output(1));
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    fir
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    input_rsc_vld : IN STD_LOGIC;
    input_rsc_rdy : OUT STD_LOGIC;
    coeffs_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    coeffs_triosy_lz : OUT STD_LOGIC;
    output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    output_rsc_vld : OUT STD_LOGIC;
    output_rsc_rdy : IN STD_LOGIC
  );
END fir;

ARCHITECTURE v1 OF fir IS
  -- Default Constants

  COMPONENT fir_run
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      input_rsc_vld : IN STD_LOGIC;
      input_rsc_rdy : OUT STD_LOGIC;
      coeffs_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      coeffs_triosy_lz : OUT STD_LOGIC;
      output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      output_rsc_vld : OUT STD_LOGIC;
      output_rsc_rdy : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL fir_run_inst_input_rsc_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fir_run_inst_coeffs_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL fir_run_inst_output_rsc_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN
  fir_run_inst : fir_run
    PORT MAP(
      clk => clk,
      rst => rst,
      input_rsc_dat => fir_run_inst_input_rsc_dat,
      input_rsc_vld => input_rsc_vld,
      input_rsc_rdy => input_rsc_rdy,
      coeffs_rsc_dat => fir_run_inst_coeffs_rsc_dat,
      coeffs_triosy_lz => coeffs_triosy_lz,
      output_rsc_dat => fir_run_inst_output_rsc_dat,
      output_rsc_vld => output_rsc_vld,
      output_rsc_rdy => output_rsc_rdy
    );
  fir_run_inst_input_rsc_dat <= input_rsc_dat;
  fir_run_inst_coeffs_rsc_dat <= coeffs_rsc_dat;
  output_rsc_dat <= fir_run_inst_output_rsc_dat;

END v1;



