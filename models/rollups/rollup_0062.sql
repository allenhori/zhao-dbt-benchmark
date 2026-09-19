select
    p0.segment_id as segment_id,
    p2.g3 as r1,
    p2.g3 as r2,
    p0.g1 as r3
from {{ ref('seg_0126') }} as p0
inner join {{ ref('seg_0229') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('seg_0393') }} as p2 on p2.segment_id = p0.segment_id
