select
    p0.segment_id as segment_id,
    p0.g3 as r1,
    p1.g1 as r2,
    p0.g1 * 0.5 + p1.g4 * 0.5 as r3,
    p0.g1 as r4
from {{ ref('seg_0314') }} as p0
inner join {{ ref('seg_0033') }} as p1 on p1.segment_id = p0.segment_id
