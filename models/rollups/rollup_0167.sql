select
    p0.segment_id as segment_id,
    p1.r3 as r1,
    p1.r2 + p0.g2 as r2,
    case when p1.r3 > p0.g3 then p1.r3 else p0.g3 end as r3
from {{ ref('seg_0299') }} as p0
inner join {{ ref('rollup_0119') }} as p1 on p1.segment_id = p0.segment_id
