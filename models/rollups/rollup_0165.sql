select
    p0.segment_id as segment_id,
    case when p0.r2 > p2.r3 then p0.r2 else p2.r3 end as r1,
    p2.r3 as r2,
    p0.r4 as r3
from {{ ref('rollup_0085') }} as p0
inner join {{ ref('seg_0087') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('rollup_0117') }} as p2 on p2.segment_id = p0.segment_id
