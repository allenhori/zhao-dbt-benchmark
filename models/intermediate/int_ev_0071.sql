select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.m7, 0) + 2 as v1,
    p.m8 - p.m7 as v2,
    round(p.m8 / 13.0, 4) as v3,
    p.m8 + p.m7 as v4,
    case when p.m8 > 1300 then p.m8 else 0 end as v5,
    case when p.m8 > p.m7 then p.m8 else p.m7 end as v6,
    p.m7 + 13 as v7,
    p.m8 * 5 as v8
from {{ ref('stg_ev_00') }} as p
