namespace QuantumRNG {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    // Define operation and its name
    // Define an output
    operation GenerateRandomBit() : Result {
        // Initialize a variable and allocate a qubit in it
        use q = Qubit();
        
        // Applies Hadamard Gate to the qubit
        H(q);

        // Measures the qubit and return its value.  
        return M(q);
    }
}