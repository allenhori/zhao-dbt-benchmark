select
    p0.segment_id as segment_id,
    p1.g1 as r1,
    p0.g1 - p1.g1 as r2,
    p0.g2 as r3
from {{ ref('seg_0279') }} as p0
inner join {{ ref('seg_0278') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0147') }} as p2 on p2.segment_id = p0.segment_id
