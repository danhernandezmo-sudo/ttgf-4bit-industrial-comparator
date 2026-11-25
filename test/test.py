import cocotb
from cocotb.triggers import Timer


@cocotb.test()
async def test_comparador(dut):

    dut.ena.value = 1
    dut.clk.value = 0
    dut.rst_n.value = 1
    dut.uio_in.value = 0

    # Evaluar las 256 combinaciones
    for A in range(16):
        for B in range(16):

            dut.ui_in.value = (B << 4) | A

            await Timer(100, unit="ns")

            if A > B:
                esperado = 0b00000001
            elif A == B:
                esperado = 0b00000010
            else:
                esperado = 0b00000100

            assert int(dut.uo_out.value) == esperado, (
                f"Error: A={A}, B={B}"
            )

    dut._log.info("256 combinations tested successfully")
