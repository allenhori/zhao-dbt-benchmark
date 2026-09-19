select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m8 * 0.5 + p.m4 * 0.5 as v1,
    p.m8 * 11 as v2,
    p.m9 * 0.5 + p.m4 * 0.5 as v3,
    case when p.m4 > p.m8 then p.m4 else p.m8 end as v4,
    p.m8 * 7 as v5,
    coalesce(p.m9, 0) + 7 as v6,
    case when p.m4 > p.m8 then p.m4 else p.m8 end as v7
from {{ ref('stg_ev_07') }} as p
