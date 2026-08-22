"""Tests for the CNOT gate."""

import sys
import unittest
from pathlib import Path

from qiskit.circuit.library import CXGate
from qiskit.quantum_info import Operator, Statevector

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "01_gates"))
from cnot_gate import cnot_gate  # noqa: E402


class TestCnotGate(unittest.TestCase):
    """Tests for CNOT (CX, control q0, target q1)."""

    def test_operator_equiv_cx_gate(self):
        self.assertTrue(Operator(cnot_gate()).equiv(Operator(CXGate())))

    def test_statevector_00_unchanged(self):
        sv = Statevector.from_instruction(cnot_gate())
        self.assertTrue(sv.equiv(Statevector.from_label("00")))

    def test_statevector_01_flips_target(self):
        sv = Statevector.from_label("01").evolve(cnot_gate())
        self.assertTrue(sv.equiv(Statevector.from_label("11")))

    def test_statevector_10_unchanged(self):
        sv = Statevector.from_label("10").evolve(cnot_gate())
        self.assertTrue(sv.equiv(Statevector.from_label("10")))

    def test_statevector_11_flips_target(self):
        sv = Statevector.from_label("11").evolve(cnot_gate())
        self.assertTrue(sv.equiv(Statevector.from_label("01")))


if __name__ == "__main__":
    unittest.main()
