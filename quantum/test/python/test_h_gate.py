"""Tests for the Hadamard gate."""

import sys
import unittest
from pathlib import Path

from qiskit.circuit.library import HGate
from qiskit.quantum_info import Operator, Statevector

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "01_gates"))
from h_gate import h_gate  # noqa: E402


class TestHGate(unittest.TestCase):
    """Tests for H (Hadamard)."""

    def test_operator_equiv_h_gate(self):
        self.assertTrue(Operator(h_gate()).equiv(Operator(HGate())))

    def test_statevector_zero_to_plus(self):
        sv = Statevector.from_instruction(h_gate())
        self.assertTrue(sv.equiv(Statevector.from_label("+")))

    def test_statevector_one_to_minus(self):
        sv = Statevector.from_label("1").evolve(h_gate())
        self.assertTrue(sv.equiv(Statevector.from_label("-")))


if __name__ == "__main__":
    unittest.main()
