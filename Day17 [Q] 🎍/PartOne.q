.PartOne.shape:{raze til[count x],/:'where each x}each not null
    (enlist"####";(" # ";"###";" # ");("  #";"  #";"###");
    enlist each"####";("##";"##"));

.PartOne.ssz:1+max each .PartOne.shape;

runPartOne:{[lim;x]
    dir:-1+2*">"=first x; // Direction
    dc:count dir; // Direction count
    field:(); // Field
    t:-1; // Time
    pcs:0; // Piece count
    top:0N; // Top of current piece
    flog:enlist[()]!enlist `int$(); // Field log for each piece
    hlog:`int$(); // Height of field at each piece
    // Piece loop
    while[1b;
        t+:1;
        d:dir[t mod dc];
        if[null top;
            m:0; while[$[m=count field;0b;0=sum field m]; m+:1];
            field:m _field;
            if[pcs>=lim; :count[field]];
            hlog,:count field;
            snap:0b,raze 12 sublist field;
            flog[snap],:pcs;

            if[3<=count st:flog[snap];
                if[1=count pers:distinct 1_deltas st;
                    per:first pers;
                    heightFirstPartial:hlog[st 0];
                    hper:hlog[st 2]-hlog[st 1]; //height per period
                    fullPers:(lim-st 0)div per; //number of full periods
                    plst:(lim-st 0)mod per;  //pieces in last partial period
                    heightLastPartial:hlog[plst+st 1]-hlog[st 1];
                    :heightFirstPartial+(fullPers*hper)+heightLastPartial;
                ];
            ];

            shape:.PartOne.shape pcs mod 5;
            ssz:.PartOne.ssz pcs mod 5;
            field:((ssz[0]+3)#enlist 7#0b),field;
            top:0;
            left:2;
            pcs+:1;
        ];
        left+:d;

        if[7<left+ssz 1; left-:1];
        if[0>left; left+:1];
        if[any field ./:(top;left)+/:shape; left-:d];

        top+:1;
        hit:0b;

        if[count[field]<top+ssz 0; hit:1b];
        if[any field ./:(top;left)+/:shape; hit:1b];

        if[hit;
            top-:1;
            field:.[;;:;1b]/[field;(top;left)+/:shape];
            top:0N;
        ];
    ];
    };
PartOne:{PartOne[2022;x]};