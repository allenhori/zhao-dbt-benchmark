select
    p0.segment_id as segment_id,
    p0.g1 as r1,
    p0.g2 * 0.5 + p1.g2 * 0.5 as r2
from {{ ref('seg_0348') }} as p0
inner join {{ ref('seg_0017') }} as p1 on p1.segment_id = p0.segment_id
