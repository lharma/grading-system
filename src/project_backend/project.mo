
import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor GradingSystem {

    // marks array
    let marks : [Nat] = [75, 88, 59, 92, 66, 81, 70];

    // Function to calculate average
    public func averageMark() : async Nat {
        var total : Nat = 0;
        var count : Nat = 0;

        for (m in marks.vals()) {
            total += m;
            count += 1;
        };

        let avg = total / count;
        Debug.print("Average mark is: " # debug_show(avg));
        return avg;
    };

    // Function to find maximum mark
    public func maximumMark() : async Nat {
        var max : Nat = marks[0];

        for (m in marks.vals()) {
            if (m > max) {
                max := m;
            };
        };

        Debug.print("Maximum mark is: " # debug_show(max));
        return max;
    };

    // Function to find minimum mark
    public func minimumMark() : async Nat {
        var min : Nat = marks[0];

        for (m in marks.vals()) {
            if (m < min) {
                min := m;
            };
        };

        Debug.print("Minimum mark is: " # debug_show(min));
        return min;
    };

    // Function to find the median mark
    public func medianMark() : async Nat {
        // Sort the array first
        let sortedMarks = Array.sort(marks, Nat.compare);
        let len = sortedMarks.size();

        var median : Nat = 0;

        if (len % 2 == 0) {
            // if even number of marks, take average of two middle values
            let mid1 = sortedMarks[(len/2) - 1];
            let mid2 = sortedMarks[len/2];
            median := (mid1 + mid2) / 2;
        } else {
            // if odd, take the middle value
            median := sortedMarks[len/2];
        };

        Debug.print("Median mark is: " # debug_show(median));
        return median;
    };

};
