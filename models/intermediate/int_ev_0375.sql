select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 3 as v1,
    case when p.v1 > 200 then p.v1 else 0 end as v2,
    p.v1 + 11 as v3,
    p.v8 + 3 as v4,
    coalesce(p.v1, 0) + 5 as v5,
    p.v1 * 0.5 + p.v8 * 0.5 as v6,
    case when p.v8 > 300 then p.v8 else 0 end as v7
from {{ ref('int_ev_0053') }} as p
