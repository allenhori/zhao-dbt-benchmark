select
    p0.segment_id as segment_id,
    p0.r1 as r1,
    case when p0.r4 > p1.g2 then p0.r4 else p1.g2 end as r2,
    p1.g2 as r3,
    p1.g2 - p0.r1 as r4
from {{ ref('rollup_0063') }} as p0
inner join {{ ref('seg_0218') }} as p1 on p1.segment_id = p0.segment_id
