select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m7 * 0.5 + p.m12 * 0.5 as v1,
    case when p.m12 > p.m7 then p.m12 else p.m7 end as v2,
    p.m7 + 2 as v3,
    case when p.m12 > p.m7 then p.m12 else p.m7 end as v4,
    p.m12 + p.m7 as v5,
    case when p.m12 > 200 then p.m12 else 0 end as v6,
    p.m7 * 2 as v7
from {{ ref('stg_ev_04') }} as p
