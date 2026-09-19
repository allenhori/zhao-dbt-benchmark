select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.m11, 0) + 5 as v1,
    p.m8 * 0.5 + p.m11 * 0.5 as v2,
    p.m11 * 0.5 + p.m5 * 0.5 as v3,
    case when p.m11 > p.m8 then p.m11 else p.m8 end as v4,
    p.m11 * 3 as v5,
    case when p.m8 > 300 then p.m8 else 0 end as v6
from {{ ref('stg_ev_05') }} as p
