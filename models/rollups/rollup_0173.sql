select
    p0.segment_id as segment_id,
    p0.g1 as r1,
    p1.g3 + p0.g3 as r2,
    p0.g2 as r3
from {{ ref('seg_0098') }} as p0
inner join {{ ref('seg_0218') }} as p1 on p1.segment_id = p0.segment_id
