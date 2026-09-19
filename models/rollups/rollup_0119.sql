select
    p0.segment_id as segment_id,
    case when p2.g3 > p0.g1 then p2.g3 else p0.g1 end as r1,
    p2.g1 as r2,
    p2.g1 * 0.5 + p0.g4 * 0.5 as r3,
    p1.r3 - p0.g3 as r4
from {{ ref('seg_0143') }} as p0
inner join {{ ref('rollup_0009') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0160') }} as p2 on p2.segment_id = p0.segment_id
