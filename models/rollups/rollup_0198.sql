select
    p0.segment_id as segment_id,
    p0.g1 + p1.g2 as r1,
    p0.g2 as r2,
    p0.g1 + p1.g1 as r3,
    p1.g2 as r4
from {{ ref('seg_0194') }} as p0
inner join {{ ref('seg_0261') }} as p1 on p1.segment_id = p0.segment_id
