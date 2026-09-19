select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v8 * 0.5 + p.v6 * 0.5 as v1,
    coalesce(p.v6, 0) + 2 as v2,
    p.v8 * 2 as v3,
    p.v8 + 13 as v4,
    p.v8 + 2 as v5,
    coalesce(p.v6, 0) + 2 as v6,
    case when p.v6 > 1100 then p.v6 else 0 end as v7
from {{ ref('int_ev_0024') }} as p
