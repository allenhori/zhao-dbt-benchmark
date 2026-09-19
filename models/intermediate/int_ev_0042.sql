select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m6 * 7 as v1,
    coalesce(p.m10, 0) + 2 as v2,
    case when p.m6 > p.m10 then p.m6 else p.m10 end as v3,
    case when p.m6 > 500 then p.m6 else 0 end as v4,
    coalesce(p.m10, 0) + 13 as v5,
    round(p.m6 / 13.0, 4) as v6,
    case when p.m6 > 1100 then p.m6 else 0 end as v7
from {{ ref('stg_ev_02') }} as p
