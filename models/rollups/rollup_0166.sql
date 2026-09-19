select
    p0.segment_id as segment_id,
    p2.r3 as r1,
    case when p2.r1 > p0.r1 then p2.r1 else p0.r1 end as r2,
    p0.r2 as r3,
    p0.r1 + p1.r3 as r4
from {{ ref('rollup_0148') }} as p0
inner join {{ ref('rollup_0077') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('rollup_0143') }} as p2 on p2.segment_id = p0.segment_id
