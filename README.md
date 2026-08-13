# Bit to Qubit

Hands-on lab for building and testing computation primitives — classical digital logic and quantum circuits.

## Tracks

| Track | Path | Stack |
|-------|------|--------|
| Classical (Nand2Tetris) | `classical/nand2tetris/` | Verilog + testbenches |
| Quantum (Qiskit) | `quantum/` | Python + Qiskit + unittest |

Same learning contract on both sides: **implement a block → compose it → verify it**.

### Classical

```text
classical/nand2tetris/
  project_1/   # boolean gates, mux/dmux
  project_2/   # adder, ALU
  project_3/   # DFF, registers, RAM
```

### Quantum

```text
quantum/
  01_gates/          # X, H, Z, CNOT, …
  test/python/       # unittest, mirrors Qiskit
```

```bash
cd quantum
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
python -m unittest discover -s test/python
```

## Parallel map

| Classical | Quantum |
|-----------|---------|
| NAND / gates | H, X, Z, CNOT |
| Mux / ALU | composite circuits |
| DFF / RAM | measurement + state |
| `tb_*.v` | `unittest` + `Operator.equiv` / `Statevector.equiv` |
