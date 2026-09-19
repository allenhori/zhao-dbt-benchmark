select
    p0.segment_id as segment_id,
    p2.g3 * 0.5 + p0.g1 * 0.5 as r1,
    case when p0.g3 > p2.g1 then p0.g3 else p2.g1 end as r2,
    case when p2.g2 > p0.g3 then p2.g2 else p0.g3 end as r3,
    p1.g1 as r4
from {{ ref('seg_0226') }} as p0
inner join {{ ref('seg_0051') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0218') }} as p2 on p2.segment_id = p0.segment_id
