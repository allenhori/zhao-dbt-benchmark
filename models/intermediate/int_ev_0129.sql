select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v2, 0) + 3 as v1,
    case when p.v4 > p.v2 then p.v4 else p.v2 end as v2,
    p.v2 * 0.5 + p.v4 * 0.5 as v3,
    p.v2 * 0.5 + p.v4 * 0.5 as v4,
    p.v2 + p.v4 as v5,
    coalesce(p.v2, 0) + 3 as v6,
    case when p.v2 > 1300 then p.v2 else 0 end as v7,
    coalesce(p.v4, 0) + 2 as v8
from {{ ref('int_ev_0056') }} as p
