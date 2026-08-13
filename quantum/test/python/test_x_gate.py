"""Tests for the Pauli-X gate."""

import sys
import unittest
from pathlib import Path

from qiskit.circuit.library import XGate
from qiskit.quantum_info import Operator, Statevector

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "01_gates"))
from x_gate import x_gate  # noqa: E402


class TestXGate(unittest.TestCase):
    """Tests for X (Pauli-X)."""

    def test_operator_equiv_x_gate(self):
        self.assertTrue(Operator(x_gate()).equiv(Operator(XGate())))

    def test_statevector_zero_to_one(self):
        sv = Statevector.from_instruction(x_gate())
        self.assertTrue(sv.equiv(Statevector.from_label("1")))

    def test_statevector_one_to_zero(self):
        sv = Statevector.from_label("1").evolve(x_gate())
        self.assertTrue(sv.equiv(Statevector.from_label("0")))


if __name__ == "__main__":
    unittest.main()
