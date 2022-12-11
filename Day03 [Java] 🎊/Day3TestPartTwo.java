import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

class Day3TestPartTwo {

    @org.junit.jupiter.api.Test
    void regroupElementsByThree() {
        ArrayList<String> data = new ArrayList<String>();
        data.add("abc");
        data.add("def");
        data.add("ghi");
        data.add("jkl");
        data.add("mno");
        data.add("pqr");
        data.add("stu");
        data.add("vwx");
        data.add("yz");
        ArrayList<ArrayList<String>> regroupedData = PartTwo.regroupElementsByThree(data);
        assertEquals("abc", regroupedData.get(0).get(0));
        assertEquals("def", regroupedData.get(0).get(1));
        assertEquals("ghi", regroupedData.get(0).get(2));
        assertEquals("jkl", regroupedData.get(1).get(0));
        assertEquals("mno", regroupedData.get(1).get(1));
        assertEquals("pqr", regroupedData.get(1).get(2));
        assertEquals("stu", regroupedData.get(2).get(0));
        assertEquals("vwx", regroupedData.get(2).get(1));
        assertEquals("yz", regroupedData.get(2).get(2));
    }

    @org.junit.jupiter.api.Test
    void findCommonLetters() {
        ArrayList<String> data = new ArrayList<String>();
        data.add("abc");
        data.add("dae");
        data.add("fga");
        String commonLetter = PartTwo.findCommonLetters(data);
        assertEquals("a", commonLetter);
    }
}