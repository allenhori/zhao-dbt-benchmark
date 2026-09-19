select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m8 - p.m10 as v1,
    case when p.m8 > 1300 then p.m8 else 0 end as v2,
    round(p.m10 / 11.0, 4) as v3,
    case when p.m8 > 300 then p.m8 else 0 end as v4,
    p.m10 * 0.5 + p.m8 * 0.5 as v5,
    coalesce(p.m8, 0) + 11 as v6,
    p.m8 * 13 as v7
from {{ ref('stg_ev_00') }} as p
