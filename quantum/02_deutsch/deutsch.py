from qiskit import QuantumCircuit


def _apply_oracle(qc: QuantumCircuit, oracle: str) -> None:
    if oracle == "constant_0":
        return
    if oracle == "constant_1":
        qc.x(1)
        return
    if oracle == "balanced":
        qc.cx(0, 1)
        return
    raise ValueError(f"unknown oracle: {oracle}")


def deutsch(oracle: str) -> QuantumCircuit:
    qc = QuantumCircuit(2)
    qc.x(1)
    qc.h(0)
    qc.h(1)
    _apply_oracle(qc, oracle)
    qc.h(0)
    return qc
