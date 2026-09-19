select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.m12 > 1100 then p.m12 else 0 end as v1,
    p.m5 + p.m8 as v2,
    round(p.m12 / 2.0, 4) as v3,
    p.m5 * 0.5 + p.m12 * 0.5 as v4,
    p.m5 + 2 as v5,
    p.m5 + 13 as v6,
    p.m8 + p.m5 as v7
from {{ ref('stg_ev_02') }} as p
