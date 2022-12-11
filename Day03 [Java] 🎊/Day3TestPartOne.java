import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

class Day3TestPartOne {

    @Test
    void halving() {
        ArrayList<String> data = new ArrayList<String>();
        data.add("abcdef");
        data.add("ghijkl");
        data.add("mnopqr");
        data.add("stuvwx");
        data.add("yz");
        ArrayList<ArrayList<String>> halvedData = PartOne.halving(data);
        assertEquals("abc", halvedData.get(0).get(0));
        assertEquals("def", halvedData.get(0).get(1));
        assertEquals("ghi", halvedData.get(1).get(0));
        assertEquals("jkl", halvedData.get(1).get(1));
        assertEquals("mno", halvedData.get(2).get(0));
        assertEquals("pqr", halvedData.get(2).get(1));
        assertEquals("stu", halvedData.get(3).get(0));
        assertEquals("vwx", halvedData.get(3).get(1));
        assertEquals("y", halvedData.get(4).get(0));
    }

    @Test
    void triage() {
        assertEquals(1, PartOne.triage("a"));
        assertEquals(2, PartOne.triage("b"));
        assertEquals(52, PartOne.triage("Z"));
    }

    @Test
    void occurrenceDetector() {
        String str1 = "abcdef";
        String str2 = "hieklm";
        assertEquals('e', PartOne.occurrenceDetector(str1, str2));
    }
}