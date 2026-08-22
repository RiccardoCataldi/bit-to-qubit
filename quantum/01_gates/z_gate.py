from qiskit import QuantumCircuit


def z_gate():
    qc = QuantumCircuit(1)
    qc.z(0)
    return qc
