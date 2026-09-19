select
    p0.segment_id as segment_id,
    p1.g2 * 0.5 + p0.g4 * 0.5 as r1,
    p0.g1 as r2
from {{ ref('seg_0241') }} as p0
inner join {{ ref('seg_0357') }} as p1 on p1.segment_id = p0.segment_id
