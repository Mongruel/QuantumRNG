namespace QuantumRNG {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;

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

    // Takes max (number) as a maximum value for the output
    operation SampleRandomNumberInRange(max: Int) : Int {
        // Mutable: A type of object whose data members, such as properties, data and fields, can be modified after its creation
        mutable output = 0;

        // Repeat code inside until output value <= max value
        repeat{
            // Defines a bit string with nBits
            mutable bits = [];
            
            for indexBit in 1..BitSizeI(max) {
                // Sums new bit
                set bits += [GenerateRandomBit()];
            }
            // Converts bits to decimals
            set output = ResultArrayAsInt(bits);
        } until (output <= max);
        
        return output;
    }

    @EntryPoint()
    operation SampleRandomNumber() : Int {
        let max = 50;
        Message($"Sampling a random number between 0 and {max}: ");
        return SampleRandomNumberInRange(max);
    }
}