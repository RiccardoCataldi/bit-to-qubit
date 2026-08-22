"""Tests for the Pauli-Z gate."""

import sys
import unittest
from pathlib import Path

from qiskit.circuit.library import ZGate
from qiskit.quantum_info import Operator, Statevector

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "01_gates"))
from z_gate import z_gate  # noqa: E402


class TestZGate(unittest.TestCase):
    """Tests for Z (Pauli-Z)."""

    def test_operator_equiv_z_gate(self):
        self.assertTrue(Operator(z_gate()).equiv(Operator(ZGate())))

    def test_statevector_zero_unchanged(self):
        sv = Statevector.from_instruction(z_gate())
        self.assertTrue(sv.equiv(Statevector.from_label("0")))

    def test_statevector_one_phase_minus(self):
        sv = Statevector.from_label("1").evolve(z_gate())
        self.assertAlmostEqual(sv.data[1].real, -1.0)
        self.assertAlmostEqual(sv.data[1].imag, 0.0)

    def test_statevector_plus_to_minus(self):
        sv = Statevector.from_label("+").evolve(z_gate())
        self.assertTrue(sv.equiv(Statevector.from_label("-")))


if __name__ == "__main__":
    unittest.main()
