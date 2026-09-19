select
    p0.segment_id as segment_id,
    case when p1.r3 > p2.r2 then p1.r3 else p2.r2 end as r1,
    p2.r3 as r2,
    p1.r1 + p0.r2 as r3,
    p2.r1 as r4
from {{ ref('rollup_0078') }} as p0
inner join {{ ref('rollup_0033') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('rollup_0070') }} as p2 on p2.segment_id = p0.segment_id
