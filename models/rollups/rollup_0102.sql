select
    p0.segment_id as segment_id,
    p1.g1 * 0.5 + p0.g1 * 0.5 as r1,
    p2.g2 as r2
from {{ ref('seg_0284') }} as p0
inner join {{ ref('seg_0251') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0342') }} as p2 on p2.segment_id = p0.segment_id
