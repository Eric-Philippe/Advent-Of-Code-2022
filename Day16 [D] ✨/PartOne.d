import std.stdio;
import std.algorithm;
import std.file : readText;
import std.conv;
import std.format;
import std.string;
import std.range;
import std.array;
import std.math;

void runPartOne(string[] args)
{
    auto input = readText(args[1]).strip.split('\n');

    static struct valve {
        string name;
        string[] edgenames;
        size_t[] edges;
        int flow;
        int mask;
    }

    valve[] cave;
    size_t[string] valveidx;
    int nvalves = 0;
    foreach(ln; input)
    {
        valve v;
        string edgespec;
        ln.formattedRead("Valve %s has flow rate=%s;%s", &v.name, &v.flow, &edgespec);
        auto edges = edgespec.split(',');
        edges[0] = edges[0].split[$-1];
        v.edgenames = edges.map!(e => e.strip).array;
        if(v.flow > 0)
            v.mask = 1 << (nvalves++);
        cave ~= v;
        valveidx[v.name] = cave.length-1;
    }
    //writeln(cave);

    foreach(ref v; cave)
        v.edges = v.edgenames.map!(en => valveidx[en]).array;

    int[][] makestate() {
        int[][] result = new int[][](cave.length, 1 << nvalves);
        foreach(ref r; result)
            r[] = -1;
        return result;
    }
    auto state = makestate;
    // part 1
    auto aaidx = valveidx["AA"];
    state[aaidx][0] = 0;
    foreach(m; 0 .. 30)
    {
        auto newstate = makestate;
        foreach(i; 0 .. state.length)
        {
            auto newflow = (29 - m) * cave[i].flow;
            foreach(j; 0 .. state[i].length)
            {
                if(state[i][j] >= 0)
                {
                    if(newflow && !(cave[i].mask & j))
                    {
                        auto nm = cave[i].mask | j;
                        newstate[i][nm] = max(newstate[i][nm], state[i][j] + newflow);
                    }

                    foreach(e; cave[i].edges)
                    {
                        newstate[e][j] = max(newstate[e][j], state[i][j]);
                    }
                }
            }
        }
        state = newstate;
    }
    int p1;
    foreach(r; state)
        foreach(v; r)
        {
            p1 = max(p1, v);
        }
    writeln("part1: ", p1);
}