### <ins>Lab4: Adders and Buses</ins>
Design, build, simulate, and analyze at least two 64-bit adders:

1. Ripple Carry Adder (RCA)
2. A 2-stage Carry Select Adder

<ins>Requirements:</ins>

* The design **must** be hierarchical (i.e., using blocks which you can reuse).

* One of the modules must be a 4-bit ripple carry adder.

* You must use Structural Verilog (gate-level specification) for the RCAs. You may use Behavioral Verilog for the MUXes.

* Base the 64-bit adders on 1-bit full adders made up of ANDs, ORs, and NOTs (and intermediate modules that you construct). In particular, do not use XORs or half adders.

* For timing, assume that ANDs and ORs count as one gate delay, but that NOTs count as zero; we assume that we get NOTs for free in our underlying process. There is one exception: assume that the MUXes that select between the 0/1 RCA outputs have zero gate delays. Again, this is because the underlying process is likely to give you this for free.

* Create two versions of all of the adders:
  1. using standard logic gates
  2. using the “timed” gates to be provided
  
  You can simplify your design by reusing the logic with ‘define (presented in discussion section).

* Your timing diagram must include representative examples. This is relatively easy in this lab, but becomes more important later in the semester.
  1. Force an overall carry out
  2. Random large A&B input (w/ and w/o carry)
  3. Random small A&B input (w/ and w/o carry)
  4. Random combinations

* Since 64 bits is far too many to analyze wire by wire, your test bench must include verification logic. We’ll go over this in the discussion section, but (briefly) this entails creating behavioral level HDL code and comparing its output with your logic. You will also need to test the verification logic explicitly.
