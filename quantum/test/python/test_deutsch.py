"""Tests for Deutsch's algorithm."""

import sys
import unittest
from pathlib import Path

from qiskit.quantum_info import Statevector

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "02_deutsch"))
from deutsch import deutsch  # noqa: E402


class TestDeutsch(unittest.TestCase):
    """Tests for 1-bit Deutsch's algorithm."""

    def test_constant_zero(self):
        probs = Statevector.from_instruction(deutsch("constant_0")).probabilities([0])
        self.assertAlmostEqual(probs[0], 1.0)

    def test_constant_one(self):
        probs = Statevector.from_instruction(deutsch("constant_1")).probabilities([0])
        self.assertAlmostEqual(probs[0], 1.0)

    def test_balanced(self):
        probs = Statevector.from_instruction(deutsch("balanced")).probabilities([0])
        self.assertAlmostEqual(probs[1], 1.0)


if __name__ == "__main__":
    unittest.main()
