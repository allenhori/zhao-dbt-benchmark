select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.m12, 0) + 13 as v1,
    case when p.m2 > 300 then p.m2 else 0 end as v2,
    p.m12 + 13 as v3,
    p.m8 * 2 as v4,
    coalesce(p.m12, 0) + 11 as v5,
    round(p.m8 / 7.0, 4) as v6,
    coalesce(p.m2, 0) + 5 as v7,
    coalesce(p.m2, 0) + 2 as v8
from {{ ref('stg_ev_01') }} as p
