select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 * 3 as v1,
    coalesce(p.v4, 0) + 2 as v2,
    case when p.v4 > p.v1 then p.v4 else p.v1 end as v3,
    case when p.v3 > p.v4 then p.v3 else p.v4 end as v4,
    p.v4 * 0.5 + p.v3 * 0.5 as v5,
    coalesce(p.v4, 0) + 2 as v6,
    case when p.v1 > 700 then p.v1 else 0 end as v7
from {{ ref('int_ev_0019') }} as p
