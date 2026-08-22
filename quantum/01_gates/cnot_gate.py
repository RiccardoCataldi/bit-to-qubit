from qiskit import QuantumCircuit


def cnot_gate():
    qc = QuantumCircuit(2)
    qc.cx(0, 1)
    return qc
