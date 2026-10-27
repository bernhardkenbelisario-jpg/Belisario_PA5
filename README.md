# Belisario_PA5


# MATLAB Linear Algebra: Matrix Transposes & Linear System Solvers

A complete, self-contained MATLAB script demonstrating matrix transpose operations across real and complex domains, along with solving a system of linear equations using two distinct numerical methods (Matrix Inversion and Cramer's Rule) accompanied by numerical precision verification checks.

Table of Contents
- [Overview](#overview)
- [Key Features](#key-features)
- [Section A: Transpose Operations](#section-a-transpose-operations)
- [Section B: Systems of Linear Equations](#section-b-systems-of-linear-equations)
- [Conceptual Q&A](#conceptual-qa)
- [Expected Output & Verification](#expected-output--verification)

---

## Overview

This repository contains a MATLAB script designed for numerical analysis and linear algebra verification. The script is structured into two main parts:

1. **Matrix Transpose Behavior:** Inspects and compares the functional differences between the standard transpose operator (`. '`), the complex conjugate/Hermitian transpose operator (`'`), and the built-in `transpose()` function when applied to real vs. complex matrices.
2. **Linear System Solving:** Solves a system of 4 linear equations (Ax = b) without using MATLAB's backslash (`\`) operator. The system is solved independently via Matrix Inversion (x = (A^-1) b) and Cramer's Rule, followed by norm residual checks to confirm solution accuracy to machine precision.

---

## Key Features

### Section A: Transpose Operations
* **Real Matrix Analysis ($R \in \mathbb{R}^{3 \times 4}$):** Evaluates $R^T$ using `transpose(R)`, `R'`, and `R.'` to confirm equivalence on real-valued entries.
* **Complex Matrix Analysis ($Z \in \mathbb{C}^{2 \times 3}$):** Demonstrates how complex entries behave under non-conjugate transpose (`transpose(Z)`, `Z.'`) versus complex conjugate transpose (`Z'`).

### Section B: Systems of Linear Equations
Solves the simultaneous equation system:

2x_1 - x_2 + 3x_3 + 2x_4 = 16

x_1 + 4x_2 - 2x_3 + x_4 = -7

3x_1 + 2x_2 + x_3 - x_4 = 6

-2x_1 + 3x_2 + 4x_3 + 2x_4 = 7

* **Method 1 (Inverse Method):** Calculates solution vector inv = A^{-1}b using matrix inversion.
* **Method 2 (Cramer's Rule):** Iteratively substitutes each column of matrix A with the vector b and computes column determinants to build cramer.
* **Verification Checks:** Calculates det(A), the error norm x_inv - x_cramer, and residual norm A * x_inv - b.

---


```
```



## Conceptual Q&A

### Question A: Which operations give identical results for the real matrix $R$?

**Answer:** All three operations (`transpose(R)`, `R'`, and `R.'`) produce identical results for matrix $R$. Because all entries in $R$ are real numbers, taking the complex conjugate leaves every element unchanged.

### Question B: Which two operations give identical results for the complex matrix $Z$?

**Answer:** `transpose(Z)` and `Z.'` produce identical results. Both compute a standard non-conjugate matrix transpose, leaving the signs of the imaginary parts unaffected.

### Question C: What additional operation is performed by the apostrophe operator `'` on complex matrices?

**Answer:** The apostrophe operator (`'`) performs a **Hermitian conjugate transpose** (complex conjugate transpose). In addition to swapping row and column indices, it takes the complex conjugate of each entry by negating the sign of its imaginary component ($a + bi \to a - bi$).

---

## Expected Output & Verification

When executed, the script outputs the calculated matrices, comparison vectors, and verification metrics directly to the Command Window:

```text
=== A: TRANSPOSE OPERATIONS ===
 Matrix R:
     5    -2     0     7
     1     3    -4     2
     6     0     8    -1

1) transpose(R):
     5     1     6
    -2     3     0
     0    -4     8
     7     2    -1

...

=== B: TWO METHODS FOR A LINEAR SYSTEM ===
Solution via Inverse Method (x_inv):
     2
    -1
     3
     1

Solution via Cramer's Rule (x_cramer):
     2
    -1
     3
     1

--- Numerical Verification Checks ---
Determinant of A, det(A)    = 280.0000  (Must be non-zero)
norm(x_inv - x_cramer)      = 2.3941e-15  (Approximately 0)
norm(A*x_inv - b)          = 8.8818e-16  (Approximately 0)
Check Passed: det(A) is non-zero; unique solution exists, and both norm checks are ~0.

```

---

```

```
