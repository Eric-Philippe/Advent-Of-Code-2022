// Unit test

// Unit test to test to read the first line off the input.txt

// file and print it to the console.

bool TestValve ( ) {
    auto input = readText(args[1]).strip.split('\n');
    static struct valve {
        string name;
        string[] edgenames;
        size_t[] edges;
        int flow;
        int mask;
    }
    // Use the first line for the input
    input[0].formattedRead("Valve %s has flow rate=%s;%s", &v.name, &v.flow, &edgespec);

    auto edges = edgespec.split(',');
        edges[0] = edges[0].split[$-1];
        v.edgenames = edges.map!(e => e.strip).array;
        if(v.flow > 0)
            v.mask = 1 << (nvalves++);
        cave ~= v;
        valveidx[v.name] = cave.length-1;

    if (valve.name == "Valve SY") {
        return true;
    } else {
        return false;
    }

}