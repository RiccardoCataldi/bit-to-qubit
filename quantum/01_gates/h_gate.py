from qiskit import QuantumCircuit


def h_gate():
    qc = QuantumCircuit(1)
    qc.h(0)
    return qc
